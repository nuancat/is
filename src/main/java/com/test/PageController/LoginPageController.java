package com.test.PageController;

import com.test.model.*;
import com.test.persistance.BookmarksRepository;
import com.test.persistance.FriendshipRepository;
import com.test.persistance.LikedRepository;
import com.test.persistance.LoginRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by shamilbikchentaev on 03.05.17.
 */
@Controller
public class LoginPageController {

    @Autowired
    private LoginRepository lrep;
    @Autowired
    private BookmarksRepository brep;
    @Autowired
    private FriendshipRepository frep;
    @Autowired
    private LikedRepository likedR;

    @RequestMapping(value = "/pages/register", method = RequestMethod.GET)
    public String registerPage(){
        return "/pages/register";
    }

    @RequestMapping(value = "/pages/login", method = RequestMethod.GET)
    public String loginPage(){
        return "/pages/login";
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String indexPage(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException {
        Login login = checkLogin(req,res); if (login==null) return "index";
        checkRequests(login,model);
        indexHead(login,model);
        friendsActivity(login,model);
        model.addAttribute("user", login);
        return "index";
    }
    @RequestMapping(value = "/friends", method = RequestMethod.GET)
    public String friendsPage(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException {
        Login login = checkLogin(req,res); if (login==null) return "friends";
        checkRequests(login,model);
        Iterable<Friendship> friendships = frep.findAllByInitiatorIdAndHandshake(login.getId(), true);
        List<Login>friends = new ArrayList<>();
        for (Friendship x: friendships) {
            friends.add(lrep.findById(x.getTargetId()));
        }
        model.addAttribute("friends", friends.iterator());
        model.addAttribute("user", login);
        return "friends";
    }

    @RequestMapping(value = "/bookmarks", method = RequestMethod.GET)
    public String bookmarksPage(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException {
        Login login = checkLogin(req,res); if (login==null) return "bookmarks";
        checkRequests(login,model);
        model.addAttribute("user", login);
        Iterable<Bookmark> bookmarks = brep.findAllByOwnerId(login.getId());
        model.addAttribute("bookmarks", bookmarks);
        return "bookmarks";
    }

    @RequestMapping(value = "/bookmarks", method = RequestMethod.POST)
    public String bookmarksPage(HttpServletRequest req,
                                HttpServletResponse res,
                                Model model, @RequestParam String cathegory,
                                @RequestParam String name,
                                @RequestParam String site,
                                @RequestParam Boolean access,
                                HttpServletResponse response) throws IOException {

        Login login = checkLogin(req,res); if (login==null) return "bookmarks";
        checkRequests(login,model);
        Bookmark bookmark = new Bookmark(login.getId(), cathegory, name, site, access);
        brep.save(bookmark);
        model.addAttribute("user", login);
        Iterable<Bookmark> bookmarks = brep.findAllByOwnerId(login.getId());
        model.addAttribute("bookmarks", bookmarks);
        return "bookmarks";
    }

    @RequestMapping(value = "/liked", method = RequestMethod.GET)
    public String likedPage(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException {
        Login login = checkLogin(req,res); if (login==null) return "liked";
        checkRequests(login,model);
        model.addAttribute("user", login);
        Iterable<Bookmark> liked = loadLiked(login);
        model.addAttribute("liked", liked);
        return "liked";
    }

    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String profilePage(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException {
        Login login = checkLogin(req,res); if (login==null) return "profile";
        checkRequests(login,model);
        model.addAttribute("user", login);
        return "profile";
    }

    @RequestMapping (value = "/", method = RequestMethod.GET)
    public String start(HttpServletRequest req, HttpServletResponse res, Model mod) throws IOException {
        Cookie[] cookies = req.getCookies();
        if (cookies==null) return loginPage();
        else {

            return indexPage(req, res, mod);
        }
    }
    @RequestMapping (value = "/api/service/friendshipRequest", method = RequestMethod.POST)
    public void addFriend(HttpServletRequest req, HttpServletResponse res, @RequestParam String targetLogin) throws IOException {
        Login initiator = checkLogin(req,res);
        Login target = lrep.findByLogin(targetLogin);
        if (target==null) {
            res.sendRedirect("/friends");
            return;
        }
        Friendship exists = frep.findByInitiatorIdAndTargetId(initiator.getId(), target.getId());
        if (exists!=null){
            res.sendRedirect("/friends");
            return;
        }

        Friendship friendship = new Friendship(initiator.getId(), target.getId(),false);
        frep.save(friendship);
        res.sendRedirect("/friends");
        return;
    }

    @RequestMapping (value = "/api/service/friendshipAccept", method = RequestMethod.POST)
    public void acceptFriend(HttpServletRequest req, HttpServletResponse res, @RequestParam(required = false, name = "acceptLogin") String initiatorLogin, @RequestParam(required = false, name = "declineLogin") String declineLogin) throws IOException {
        Login login = checkLogin(req,res);
        if (initiatorLogin!=null) {
            Friendship friendship = new Friendship(initiatorLogin, login.getId(), true);
            Friendship friendship2 = new Friendship(login.getId(), initiatorLogin, true);
            frep.deleteByInitiatorIdAndTargetId(initiatorLogin, login.getId());
            frep.deleteByInitiatorIdAndTargetId(login.getId(), initiatorLogin);
            frep.save(friendship);
            frep.save(friendship2);
        }
        else {
            frep.deleteByInitiatorIdAndTargetId(declineLogin, login.getId());
            frep.deleteByInitiatorIdAndTargetId(login.getId(), declineLogin);
        }
        res.sendRedirect("/friends");

    }

    @RequestMapping (value = "/api/service/like", method = RequestMethod.POST)
    public void doLike(HttpServletRequest req, HttpServletResponse res, @RequestParam String bookmarkId) throws IOException {
        Login login = checkLogin(req,res);
        Liked exists = likedR.findByBookmarkId(bookmarkId);
        if(exists==null)
            likedR.save(new Liked(bookmarkId, login.getId()));
        res.sendRedirect("/index");
    }


    private List<Bookmark> loadLiked(Login target){
        Iterable<Liked> likedById = likedR.findAllByUserId(target.getId());
        List<Bookmark> returnable = new ArrayList<>();
        for (Liked x: likedById){
            returnable.add(brep.findById(x.getBookmarkId()));
        }
        return returnable;
    }
    private Login checkLogin(HttpServletRequest req, HttpServletResponse res) throws IOException {
        Cookie[] cookies = req.getCookies();
        String token = "";
        if (cookies == null) {
            req.getSession(true);
            res.sendRedirect("/pages/login");
            return null;
        }
        for (Cookie k: cookies){
            if (k.getName().equals("token")) token = k.getValue();
        }
        if(token.equals("")) {

            res.sendRedirect("/pages/login");
            return null;
        }
        String find = URLDecoder.decode(token, "UTF-8");
        Login byToken = lrep.findByToken(find.split("\"")[3]);

        return byToken;
    }
    private void checkRequests (Login target, Model model){
        Iterable<Friendship> friendships = frep.findAllByTargetIdAndHandshake(target.getId(), false);
        List<Login>friendRequests = new ArrayList<>();
        for(Friendship x: friendships){
            friendRequests.add(lrep.findById(x.getInitiatorId()));
        }
        model.addAttribute("friendshipRequests", friendRequests);

    }
    private void indexHead(Login login, Model model){
        Integer countByOwnerId = brep.countByOwnerId(login.getId());
        model.addAttribute("bcount", countByOwnerId);
        Integer friendsCount = frep.countByInitiatorIdAndHandshake(login.getId(), true);
        model.addAttribute("friends", friendsCount);
        Integer likedBookmarks = likedR.countByUserId(login.getId());
        model.addAttribute("likedNum", likedBookmarks);
    }
    private void friendsActivity(Login login, Model model){
        Iterable<Friendship> friendships = frep.findAllByInitiatorIdAndHandshake(login.getId(), true);
        List<Activity> activity = new ArrayList<>();
        for (Friendship x :friendships){
            Login user = lrep.findById(x.getTargetId());
            String fullname = user.getFullname();

            List<Bookmark> userActivity= brep.findAllByOwnerIdAndAccess(x.getTargetId(), true);
            for(Bookmark b: userActivity){
                activity.add(new Activity(b.getId(),fullname,b.getCathegory(),b.getName(), b.getDate(), b.getSite()));
            }

        }
        model.addAttribute("activity", activity);

    }

}
