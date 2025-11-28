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
        if (!dir.exists()) dir.mkdirs();


        BoardVO one = null;
        MultipartRequest multpartRequest = null;
        try {
            multpartRequest = new MultipartRequest(request, realPath,
                    sizeLimit, "utf-8",new DefaultFileRenamePolicy());
            String filename = multpartRequest.getFilesystemName("photo");

            one = new BoardVO();
            String seq = multpartRequest.getParameter("seq");
            if(seq != null && seq.equals("")) one.setSeq(Integer.parseInt(seq));
            one.setTitle(multpartRequest.getParameter("title"));
            one.setWriter(multpartRequest.getParameter("writer"));
            one.setCategory(multpartRequest.getParameter("category"));
            one.setContent(multpartRequest.getParameter("content"));
            one.setCnt(Integer.parseInt(multpartRequest.getParameter("cnt")));

            if(seq!=null && seq.equals("")) {
                BoardDAO boardDAO = new BoardDAO();
                String oldfile = boardDAO.getFileName(Integer.parseInt(seq));

                if(filename != null && oldfile != null) {
                    FileUpload.deleteFile(request, oldfile);
                }
                else if(filename == null && oldfile != null) {
                    filename = oldfile;
                }
            }
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
