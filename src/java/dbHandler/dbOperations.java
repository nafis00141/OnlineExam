/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbHandler;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author NafiS
 */
public class dbOperations {
    Statement st;
    Statement sst;
    public dbOperations(){
        DBConnection DB = new DBConnection();
        try {
            st = DB.con.createStatement();
            sst = DB.con.createStatement();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
    
    public String[] isUser( String uname, String pass  ){
        String sql = "SELECT * FROM `user` WHERE username = '"+uname+"'";
        String[] res = {"","false"};
        try { 
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                String id = rs.getString(1);
                String UserName = rs.getString(2);
                String Password = rs.getString(3);
                String type = rs.getString(4);
                if( UserName.equals(uname) && Password.equals(pass) ){
                    String[] res1 = {id,type};
                    return res1;
                }
            }
            return res;
            
        } catch (SQLException ex) {
            return res;
        }
    }
    
    public String addUser(String uname, String pass, String type ){
        //System.out.println(uname + pass+ type);
        String sql = "INSERT INTO `user`(`username`, `pass`, `type`) VALUES ('"+uname+"','"+pass+"','"+type+"')";
        try {
            st.execute(sql);
        } catch (SQLException ex){
            System.out.println("problem");
            return "Wrong information";
        }
        return "Successfully Added New User!";
    }
    
    public void addExamStudent(int sid,int eid ){
        //System.out.println(uname + pass+ type);
        String sql = "INSERT INTO `examgivenlist`(`studentId`, `examId`) VALUES ("+sid+","+eid+")";
        System.out.println(sql);
        try {
            st.execute(sql);
        } catch (SQLException ex){
            System.out.println("problem");
            
        }
        
    }
    
    public String addExam(String examName, String examTime, String totalQuestion , String teacherId ){
        //System.out.println(uname + pass+ type);
        String sql = "INSERT INTO `exams` (`examName`, `examTime`, `totalQuestion`, `teacherId`)  VALUES ('"+examName+"','"+examTime+"','"+totalQuestion+"','"+teacherId+"')";
        try {
            st.execute(sql);
        } catch (SQLException ex){
            System.out.println("problem");
            return "Wrong information";
        }
        
        sql = "SELECT `examId` FROM `exams` WHERE `examName` = '"+examName+"'";
        
        try { 
            ResultSet rs = st.executeQuery(sql);
            String examid = null;
            while(rs.next()){
                examid = rs.getString(1);
                return examid;
            }
            
        } catch (SQLException ex) {
            return "Problem";
        }
        return "Problem";
    }
    
    public boolean addQuestion(String examId, String teacherId, String question , String marks ){
        //System.out.println(uname + pass+ type);
        String sql = "INSERT INTO `questions`(`examId`, `teacherId`, `question`, `marks`) VALUES ('"+examId+"','"+teacherId+"','"+question+"','"+marks+"')";
        try {
            st.execute(sql);
        } catch (SQLException ex){
            System.out.println("problem");
            return false;
        }
        return true;
    }
    
    public boolean updateQuestion(String qid, String question , String marks ){
        //System.out.println(uname + pass+ type);
        String sql = "UPDATE `questions` SET `question`='"+question+"',`marks`='"+marks+"' WHERE `questionId`='"+qid+"'";
        try {
            st.execute(sql);
        } catch (SQLException ex){
            System.out.println("problem");
            return false;
        }
        return true;
    }    
    
    public ArrayList<String> getAllExams( String teacherId  ){
        String sql = "SELECT examName FROM `exams` WHERE teacherId = '"+teacherId+"'";
        ArrayList<String> res = new ArrayList<String>();
        try { 
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                String examName = rs.getString(1);
                res.add(examName);
            }
            return res;
            
        } catch (SQLException ex) {
            res.add("problem");
            return res;
        }
    }
    
    public ArrayList<String> getAllQues( int examId){
        String sql = "SELECT question,marks,questionId FROM questions,exams WHERE exams.examId = questions.examId and exams.examId = '"+examId+"'";
        ArrayList<String> res = new ArrayList<String>();
        try { 
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                String ques = rs.getString(1);
                String marks = rs.getString(2);
                String qid = rs.getString(3);
                res.add(ques);
                res.add(marks);
                res.add(qid);
            }
            return res;
            
        } catch (SQLException ex) {
            res.add("problem");
            return res;
        }
    }
    
    public ArrayList<ArrayList> getAllSubmittedAnswes( String examName){
        String sql = "SELECT `username`,`id` FROM `user` WHERE `id` in (SELECT `studentId` FROM `examgivenlist` WHERE `examId` = (SELECT `examId` FROM `exams` WHERE `examName` = '"+examName+"'))";
        ArrayList<ArrayList>fin = new ArrayList<ArrayList>(); 
        ArrayList<String> namess = new ArrayList<String>();
        ArrayList<String> ids = new ArrayList<String>();
        try { 
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                String names = rs.getString(1);
                String id = rs.getString(2);
                namess.add(names);
                ids.add(id);
            }
            fin.add(namess);
            fin.add(ids);
            return fin;
            
        } catch (SQLException ex) {
            System.out.println("Problem now");
            return fin;
        }
    }
    
    public ArrayList<String> getAllQues( String examName){
        String sql = "SELECT question,marks FROM questions,exams WHERE exams.examId = questions.examId and exams.examName = '"+examName+"'";
        ArrayList<String> res = new ArrayList<String>();
        try { 
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                String ques = rs.getString(1);
                String marks = rs.getString(2);
                res.add(ques);
                res.add(marks);
            }
            return res;
            
        } catch (SQLException ex) {
            res.add("problem");
            return res;
        }
    }
    
    public ArrayList<ArrayList<String>> getAllQue( String examName){
        String sql = "SELECT questionId,question,marks FROM questions,exams WHERE exams.examId = questions.examId and exams.examName = '"+examName+"'";
        ArrayList<ArrayList<String>> res = new ArrayList<ArrayList<String>>();
        ArrayList<String> id = new ArrayList<String>();
        ArrayList<String> questions = new ArrayList<String>();
        ArrayList<String> mark = new ArrayList<String>();
        try { 
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                String qid = rs.getString(1);
                String ques = rs.getString(2);
                String marks = rs.getString(3);
                id.add(qid);
                questions.add(ques);
                mark.add(marks);
                
            }
            res.add(id);
            res.add(questions);
            res.add(mark);
            return res;
            
        } catch (SQLException ex) {
            
            return res;
        }
    }
    
    public boolean updateResult( int sid,ArrayList<Integer> aid,ArrayList<Integer> res){
        
       
        
        for(int i=0;i<aid.size();i++){
            String p = "UPDATE `answers` SET `marks`= "+res.get(i)+" WHERE `studentId` = "+sid+" AND `ansId` = "+aid.get(i);
            try {
            System.out.println(p);
                st.execute(p);
            } catch (SQLException ex){
                System.out.println("problem");
                return false;
            }
        }
        
        
        return true;
    }
    
    public ArrayList<String> getAllAns( String examName,String sid){
        String sql = "SELECT `ansId`,`answer`,`marks` FROM `answers` WHERE `studentId` = '"+sid+"' AND `questionId` in (SELECT `questionId` FROM `questions` WHERE `examId` = (SELECT `examId` FROM `exams` WHERE `examName` = '"+examName+"'))";
        ArrayList<String> res = new ArrayList<String>();
        try { 
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                String ansid = rs.getString(1);
                String ans = rs.getString(2);
                String marks = rs.getString(3);
                res.add(ansid);
                res.add(ans);
                res.add(marks);
            }
            return res;
            
        } catch (SQLException ex) {
            res.add("problem");
            return res;
        }
    }
    
    
    
    public ArrayList<String> getAllQues( String examName , int type){
        String sql = "SELECT questionId,question,marks FROM questions,exams WHERE exams.examId = questions.examId and exams.examName = '"+examName+"'";
        ArrayList<String> res = new ArrayList<String>();
        try { 
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                String quesNo = rs.getString(1);
                String ques = rs.getString(2);
                String marks = rs.getString(3);
                res.add(quesNo);
                res.add(ques);
                res.add(marks);
            }
            return res;
            
        } catch (SQLException ex) {
            res.add("problem");
            return res;
        }
    }
    
    public String getExamName(String eid){
        String sql = "SELECT `examName` FROM `exams` WHERE `examId` = '"+eid+"'";
        System.out.println(sql);
        String res = "";
        try { 
            ResultSet rs = sst.executeQuery(sql);
            while(rs.next()){
                res = rs.getString(1);
            }
            rs.close();
        } catch (SQLException ex) {
            System.out.println("Problem here");
            return res;
        }
        
        return res;
        
    }
    
    public ArrayList<String> getNumber(String eid,String sid){
        
        ArrayList<String>res = new ArrayList<String>();
        
        String sql = "SELECT SUM(`marks`) FROM `answers` WHERE `studentId` = "+sid+" AND `questionId` in (SELECT `questionId` FROM `questions` WHERE `examId` = "+eid+")";
        try { 
            ResultSet rs = sst.executeQuery(sql);
            String gotNum = "";
            while(rs.next()){
                gotNum = rs.getString(1);
            }
            res.add(gotNum);
            
            sql = "SELECT SUM(`marks`) FROM `questions` WHERE `examId` = "+eid;
            
            rs = sst.executeQuery(sql);
            String totNum = "";
            while(rs.next()){
                totNum = rs.getString(1);
            }
            res.add(totNum);
            
            rs.close();
            
            
        } catch (SQLException ex) {
            System.out.println("Problem");
            return res;
        }
        
        return res;
        
    }
    
    public ArrayList<String> getExam( String examName){
        String sql = "SELECT * FROM `exams` WHERE `examName` LIKE '%"+examName+"%'";
        ArrayList<String> res = new ArrayList<String>();
        try { 
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                String examId = rs.getString(1);
                String exName = rs.getString(2);
                String exmaTime = rs.getString(3);
                String toQue = rs.getString(4);
                String teacherId = rs.getString(5);
                
                String teacherName = getTeacherNameUsingTeacherId(teacherId);
                
                res.add(examId);
                res.add(exName);
                res.add(exmaTime);
                res.add(toQue);
                res.add(teacherName);
            }
            rs.close();
            return res;
            
        } catch (SQLException ex) {
            res.add("GAGANot Found");
            res.add(ex.toString());
            return res;
        }
    }

    private String getTeacherNameUsingTeacherId(String teacherId) {
        String sql = "SELECT `username` FROM `user` WHERE `id` = "+teacherId;
        try { 
            ResultSet rs = sst.executeQuery(sql);
            String teacherName = "";
            while(rs.next()){
                teacherName = rs.getString(1);
            }
            rs.close();
            return teacherName;
            
        } catch (SQLException ex) {
            return "Not Found";
        }
    }
    
    
    public boolean addAnswer(String questionid, String studentId, String ans){
        ans = " \""+ans+"\" ";
        String sql = "INSERT INTO `answers`(`questionId`, `studentId`, `answer`) VALUES ("+questionid+","+studentId+","+ans+")";
        System.out.println(sql);
        try {
            st.execute(sql);
        } catch (SQLException ex){
            System.out.println("problem");
            return false;
        }
        return true;
    }
    
    public int getNumOfExams(){

        String sql = "SELECT COUNT(*) FROM `exams`";
        System.out.println(sql);
        try {
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                return Integer.parseInt(rs.getString(1));
            }
        } catch (SQLException ex){
            System.out.println("problem");
            return 0;
        }
        return 0;
    }
    
    public int studentGaveExam(int sid,int eid){

        String sql = "SELECT COUNT(*) FROM `examgivenlist` WHERE `studentId` = "+sid+" and `examId` = "+eid+"";
        System.out.println(sql);
        try {
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                return Integer.parseInt(rs.getString(1));
            }
        } catch (SQLException ex){
            System.out.println("problem");
            return 0;
        }
        return 0;
    }
    
    
}
