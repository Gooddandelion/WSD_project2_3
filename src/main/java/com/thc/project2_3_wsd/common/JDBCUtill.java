package com.thc.project2_3_wsd.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtill {

    public static Connection con = null;

    public static Connection getConnection() {
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
