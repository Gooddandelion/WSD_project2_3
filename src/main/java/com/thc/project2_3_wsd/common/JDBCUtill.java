package com.thc.project2_3_wsd.common;

import java.sql.*;

public class JDBCUtill {


    public static Connection getConnection() {
        Connection con = null;
        if (con == null) {
            try {
                Class.forName("org.mariadb.jdbc.Driver");
                con = DriverManager.getConnection(
                        "jdbc:mariadb://walab.handong.edu:3306/W25_22100324",
                        "W25_22100324",
                        "ahM2ka"
                );
            } catch (ClassNotFoundException | SQLException e) {
                throw new RuntimeException(e);
            }

        }

        return con;
    }


}
