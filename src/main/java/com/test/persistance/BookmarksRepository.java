package com.test.persistance;

import com.test.model.Bookmark;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

/**
 * Created by shamilbikchentaev on 12.05.17.
 */
public interface BookmarksRepository extends MongoRepository<Bookmark, String> {
        Bookmark findById(String Id);
        Iterable<Bookmark>findAllByOwnerId(String ownerId);
        Bookmark save(Bookmark bookmark);
        Integer countByOwnerId(String ownerId);
        List<Bookmark> findAllByOwnerIdAndAccess(String ownerId, Boolean access);
}
