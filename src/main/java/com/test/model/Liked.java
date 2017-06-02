package com.test.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * Created by shamilbikchentaev on 13.05.17.
 */
@Document (collection = "liked")
public class Liked {
    @Id
    private String id;
    private String bookmarkId;
    private String userId;

    public Liked(String bookmarkId, String userId) {
        this.bookmarkId = bookmarkId;
        this.userId = userId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBookmarkId() {
        return bookmarkId;
    }

    public void setBookmarkId(String bookmarkId) {
        this.bookmarkId = bookmarkId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}
