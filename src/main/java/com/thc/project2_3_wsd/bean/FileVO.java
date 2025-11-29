package com.thc.project2_3_wsd.bean;

public class FileVO {
    private String title;
    private String fileName;

    public FileVO() {}

    public FileVO(String title , String fileName) {
        this.title = title;
        this.fileName = fileName;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
