package com.thc.project2_3_wsd.bean;

import java.util.Date;

public class BoardVO {
    private int seq;
    private String title;
    private String writer;
    private String password;
    private String category;
    private String content;
    private String photo;
    private Date regdate;
    private int cnt;

    public BoardVO() {
    }

    public BoardVO(String title , String writer , String content , String password , String category , String photo) {
        this.title = title;
        this.writer = writer;
        this.password = password;
        this.category = category;
        this.content = content;
        this.photo = photo;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    public int getCnt() {
        return cnt;
    }

    public void setCnt(int cnt) {
        this.cnt = cnt;
    }
}
