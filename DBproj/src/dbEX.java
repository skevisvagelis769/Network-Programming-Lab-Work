/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author carabi
 */
import java.sql.*;
public class dbEX {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String db_url="ddbc:mysql://localhost:3306/dbproducts";
    static final String dbUSER="proadmin";
    static final String dbPASS="78910";
    Connection dbConn= null;
    Statement dbStmt=null;
}
dbEX(){
    DatabaseExample db = new DatabaseExample();
    if(db.Connect()){
        db.InsertValues();
        db.ShowRecords();
        db.Disconnect();
    
    }
    
}