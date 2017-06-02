package com.test.model;

/**
 * Created by shamilbikchentaev on 14.05.17.
 */
public class Activity {
    private String bookmarkID;
    private String name;
    private String header;
    private String text;
    private String date;
    private String site;

    public Activity(String bookmarkID, String name, String header, String text, String date, String site) {
        this.bookmarkID = bookmarkID;
        this.name = name;
        this.header = header;
        this.text = text;
        this.date = date;
        this.site = site;
    }

    public String getBookmarkID() {
        return bookmarkID;
    }

    public void setBookmarkID(String bookmarkID) {
        this.bookmarkID = bookmarkID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHeader() {
        return header;
    }

    public void setHeader(String header) {
        this.header = header;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }
}
