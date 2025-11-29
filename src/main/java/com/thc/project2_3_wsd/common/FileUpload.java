package com.thc.project2_3_wsd.common;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.thc.project2_3_wsd.bean.BoardVO;
import com.thc.project2_3_wsd.bean.FileVO;
import com.thc.project2_3_wsd.dao.BoardDAO;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileUpload {
    public BoardVO uploadFile(HttpServletRequest request) {
        int sizeLimit = 15 * 1024 * 1024;
        String realPath = request.getServletContext().getRealPath("upload");

        File dir = new File(realPath);
        if (!dir.exists()) dir.mkdir();

        BoardVO one = null;
        MultipartRequest multpartRequest = null;
        try {
            multpartRequest = new MultipartRequest(request, realPath,
                    sizeLimit, "utf-8",new DefaultFileRenamePolicy());

            String filename = multpartRequest.getFilesystemName("photo");

            one = new BoardVO();

            String seqStr = multpartRequest.getParameter("seq");
            if (seqStr != null && !seqStr.trim().isEmpty()) {
                try {
                    one.setSeq(Integer.parseInt(seqStr));
                } catch (NumberFormatException e) {
                }
            }

            String cntStr = multpartRequest.getParameter("cnt");
            if (cntStr != null && !cntStr.trim().isEmpty()) {
                try {
                    one.setCnt(Integer.parseInt(cntStr));
                } catch (NumberFormatException e) {
                    one.setCnt(0);
                }
            } else {
                one.setCnt(0);
            }

            one.setTitle(multpartRequest.getParameter("title"));
            one.setWriter(multpartRequest.getParameter("writer"));
            one.setPassword(multpartRequest.getParameter("password"));
            one.setCategory(multpartRequest.getParameter("category"));
            one.setContent(multpartRequest.getParameter("content"));
            one.setPhoto(filename);

        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        return one;
    }

    public static void deleteFile(HttpServletRequest request,String fileName) {
        String filePath = request.getServletContext().getRealPath("upload");

        File file = new File(filePath + '/' + fileName);
        if (file.exists()) { file.delete();}
    }
}
