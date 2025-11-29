package com.thc.project2_3_wsd.dao;

import com.thc.project2_3_wsd.bean.BoardVO;
import com.thc.project2_3_wsd.common.JDBCUtill;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    private final String BOARD_INSERT = "insert into BOARD(title, writer, password, category, content, photo) values(?,?,?,?,?,?)";
    private final String BOARD_LIST = "select * from BOARD order by regdate desc";
    private final String BOARD_DELETE = "delete from BOARD where seq = ?";
    private final String BOARD_SELECT = "select * from BOARD where seq = ? ";
    private final String BOARD_UPDATE = "update BOARD set title = ?, writer = ?, category = ?, content = ?, photo = ? where seq = ?";
    private final String BOARD_SEARCH = "select * from BOARD where title like = ? order by regdate desc";
    private final String BOARD_PHOTONAME = "select photo from BOARD where seq = ?";

    public int insertBoard(BoardVO vo) {
        try {
            con = JDBCUtill.getConnection();
            pstmt = con.prepareStatement(BOARD_INSERT);
            pstmt.setString(1, vo.getTitle());
            pstmt.setString(2, vo.getWriter());
            pstmt.setString(3, vo.getPassword());
            pstmt.setString(4, vo.getCategory());
            pstmt.setString(5, vo.getContent());
            pstmt.setString(6, vo.getPhoto());
            pstmt.executeUpdate();
            return 1;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<BoardVO> getBoardList() {
        List<BoardVO> list = new ArrayList<>();
        try {
            con = JDBCUtill.getConnection();
            pstmt = con.prepareStatement(BOARD_LIST);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                BoardVO vo = new BoardVO();
                vo.setSeq(rs.getInt("seq"));
                vo.setTitle(rs.getString("title"));
                vo.setWriter(rs.getString("writer"));
                vo.setCategory(rs.getString("category"));
                vo.setContent(rs.getString("content"));
                vo.setRegdate(rs.getDate("regdate"));
                vo.setCnt(rs.getInt("cnt"));
                vo.setPhoto(rs.getString("photo"));
                list.add(vo);
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void deleteBoard(BoardVO vo) {
        try {
            con = JDBCUtill.getConnection();
            pstmt = con.prepareStatement(BOARD_DELETE);
            pstmt.setInt(1, vo.getSeq());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public BoardVO getBoard(int seq) {
        BoardVO vo = null;
        try {
            con = JDBCUtill.getConnection();
            pstmt = con.prepareStatement(BOARD_SELECT);
            pstmt.setInt(1, seq);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                vo = new BoardVO();
                vo.setSeq(rs.getInt("seq"));
                vo.setTitle(rs.getString("title"));
                vo.setWriter(rs.getString("writer"));
                vo.setCategory(rs.getString("category"));
                vo.setContent(rs.getString("content"));
                vo.setRegdate(rs.getDate("regdate"));
                vo.setCnt(rs.getInt("cnt"));
                vo.setPhoto(rs.getString("photo"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return vo;
    }

    public int updateBoard(BoardVO vo) {
        try {
            con = JDBCUtill.getConnection();
            pstmt = con.prepareStatement(BOARD_UPDATE);

            pstmt.setString(1, vo.getTitle());
            pstmt.setString(2, vo.getWriter());
            pstmt.setString(3, vo.getCategory());
            pstmt.setString(4, vo.getContent());
            pstmt.setString(5, vo.getPhoto());
            pstmt.setInt(6, vo.getSeq());

            pstmt.executeUpdate();
            return 1;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<BoardVO> searchBoard(String title) {
        List<BoardVO> list = new ArrayList<>();
        try {
            con = JDBCUtill.getConnection();
            pstmt = con.prepareStatement(BOARD_SEARCH);

            pstmt.setString(1, "%" + title + "%");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                BoardVO vo = new BoardVO();
                vo.setSeq(rs.getInt("seq"));
                vo.setTitle(rs.getString("title"));
                vo.setWriter(rs.getString("writer"));
                vo.setCategory(rs.getString("category"));
                vo.setContent(rs.getString("content"));
                vo.setRegdate(rs.getDate("regdate"));
                vo.setCnt(rs.getInt("cnt"));
                list.add(vo);
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public String getFileName(int seq) {
        try {
            con = JDBCUtill.getConnection();
            pstmt = con.prepareStatement(BOARD_PHOTONAME);

            pstmt.setInt(1, seq);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                return rs.getString("photo");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
