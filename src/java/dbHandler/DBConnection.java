/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbHandler;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author NafiS
 */
public class DBConnection {
    Connection con;
    public DBConnection(){
        try{  
            Class.forName("com.mysql.jdbc.Driver");  
            Connection CON=DriverManager.getConnection("jdbc:mysql://localhost:3306/austexams","root","");
            con = CON;
        }catch(Exception e){
            System.out.println("Database Connecting Error!");
        }
    }

}