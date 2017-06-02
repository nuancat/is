package com.test.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by shamilbikchentaev on 12.05.17.
 */

@Document(collection = "bookmark")
public class Bookmark {
    @Id
    private  String id;
    private  String ownerId;
    private  String cathegory;
    private  String name;
    private  String site;
    private String date;
    private  Boolean access;

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public String getId() {
        return id;
    }

    public Bookmark(String ownerId, String cathegory, String name, String site, Boolean access) {
        this.ownerId = ownerId;
        this.cathegory = cathegory;
        this.name = name;
        this.site = site;
        this.date = new SimpleDateFormat("dd-MM-yyyy HH:mm").format(new Date());
        this.access = access;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(String ownerId) {
        this.ownerId = ownerId;
    }

    public String getCathegory() {
        return cathegory;
    }

    public void setCathegory(String cathegory) {
        this.cathegory = cathegory;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Boolean getAccess() {
        return access;
    }

    public void setAccess(Boolean access) {
        this.access = access;
    }
}
