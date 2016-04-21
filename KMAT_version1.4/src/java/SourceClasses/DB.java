package SourceClasses;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Pc
 */
public class DB {
        public Connection connectDB()
	{
    
	    String url = "jdbc:mysql://localhost:3307/";
	    String user = "Asbah";
	    String password = "149103";
	    
	    try
	    {
	        Class.forName("com.mysql.jdbc.Driver").newInstance();
	        Connection con = DriverManager.getConnection(url, user, password);

	        return con;
	    }
	    catch (Exception e)
	    {
	        e.printStackTrace();
	    }
            return null;
	}
        public void createNewUser(Connection con,String email, String password, String createDate, String updateDate)
        {
            try{
                   Statement stt = con.createStatement();

                   stt.execute("USE kmat");
                   String query="INSERT INTO kmat.user_tbl (username, password,create_dt,update_dt) VALUES( '"+email+"', '"+password+"', '"+createDate+"', '"+updateDate+"');";
                   PreparedStatement preparedStmt = con.prepareStatement(query);
                   preparedStmt.execute();
                   stt.close();
                  // con.close();
               }
               catch(Exception e)
               {
               }
        }
        public void createNewUserDetails(Connection con,String userId,String email, String firstName,String lastName,String password, String address, String contactNumber, String details, String createDate, String updateDate)
        {
            try{
                   Statement stt = con.createStatement();

                   stt.execute("USE kmat");
                   String query="INSERT INTO kmat.user_details_tbl (user_idfk, first_name,last_name,email,address,contact_number,details,create_dt,update_dt) VALUES('"+userId+"', '"+firstName+"', '"+lastName+"', '"+email+"', '"+address+"', '"+contactNumber+"', '"+details+"', '"+createDate+"', '"+updateDate+"');";
                   PreparedStatement preparedStmt = con.prepareStatement(query);
                   preparedStmt.execute();
                   stt.close();
                   con.close();
               }
               catch(Exception e)
               {
               }
        }
        public String findUserId(Connection con, String userName)
        {
            String userId=null;
            try{
            	Statement stt = con.createStatement();
                
	        stt.execute("USE kmat");
                ResultSet res = stt.executeQuery("select user_id from kmat.user_tbl where username='"+userName+"';");
                
                while (res.next())
	        {
	            userId=res.getString("user_id");
	        }
                //con.close();
                return userId;
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            
            return userId;
        }
        
        public void createProject(Connection con,String projectName,String project_description,Integer project_privacy, String createDate, String updateDate )
        {
            try{
            	Statement stt = con.createStatement();
                
	        stt.execute("USE kmat");
                String query="INSERT INTO kmat.project_tbl (project_name, description,privacy_level,create_dt,update_dt) VALUES('"+projectName+"', '"+project_description+"', '"+project_privacy.toString()+"', '"+createDate+"', '"+updateDate+"');";
                PreparedStatement preparedStmt = con.prepareStatement(query);
		preparedStmt.execute();
	        stt.close();
                con.close();
            }
            catch(Exception e)
            {
            }
            
        }
        public List<Project> getAllProjects(Connection con)
        {
            List<Project> projects=new ArrayList<Project>();
            try{
            	Statement stt = con.createStatement();
                
	        stt.execute("USE kmat");
                ResultSet res = stt.executeQuery("select * from kmat.project_tbl;");
                
                while (res.next())
	        {
                    Project project=new Project();
                    project.setProject_id(Integer.parseInt(res.getString("project_id")));
                    project.setProject_name(res.getString("project_name"));
                    project.setDescription(res.getString("description"));
                    project.setPrivacy_level(res.getString("privacy_level"));
                    project.setCreate_dt(res.getString("create_dt"));
                    project.setCreate_dt(res.getString("update_dt"));
                    
	            projects.add(project);
	        }
                con.close();
                return projects;
            }
            catch(Exception e)
            {
            }
            
            return projects;
        }
        public Project getProject(Connection con, String project_id)
        {
            Project project=new Project();
            try{
            	Statement stt = con.createStatement();
                
	        stt.execute("USE kmat");
                ResultSet res = stt.executeQuery("select * from kmat.project_tbl where project_id='"+project_id+"';");
                
                if(res.next())
	        {
                    res.beforeFirst();
                    project.setProject_id(Integer.parseInt(res.getString("project_id")));
                    project.setProject_name(res.getString("project_name"));
                    project.setDescription(res.getString("description"));
                    project.setPrivacy_level(res.getString("privacy_level"));
                    project.setCreate_dt(res.getString("create_dt"));
                    project.setUpdate_dt(res.getString("update_dt"));
	        }
                con.close();
                return project;
            }
            catch(Exception e)
            {
                e.printStackTrace();
                
                
                project.setProject_id(Integer.parseInt("10"));
                    project.setProject_name("see");
                    project.setDescription("see");
                    project.setPrivacy_level("see");
                    project.setCreate_dt("see");
                    project.setUpdate_dt("see");
                return project;
            }
            
        }
        public void createGroup(Connection con,String createdBy,String groupName,String groupDescription,Integer projectPrivacy, String createDate, String updateDate )
        {
            try{
            	Statement stt = con.createStatement();
                
	        stt.execute("USE kmat");
                String query="INSERT INTO kmat.group_tbl (created_by_idfk,group_name, description,privacy_level_idfk,create_dt,update_dt) VALUES('"+createdBy+"','"+groupName+"', '"+groupDescription+"', '"+projectPrivacy.toString()+"', '"+createDate+"', '"+updateDate+"');";
                PreparedStatement preparedStmt = con.prepareStatement(query);
		preparedStmt.execute();
	        stt.close();
                con.close();
            }
            catch(Exception e)
            {
            }
            
        }
        public List<Group> getAllGroups(Connection con)
        {
            List<Group> groups=new ArrayList<Group>();
            try{
            	Statement stt = con.createStatement();
                
	        stt.execute("USE kmat");
                ResultSet res = stt.executeQuery("select * from kmat.group_tbl;");
                
                while (res.next())
	        {
                    Group group=new Group();
                    group.setGroup_id(Integer.parseInt(res.getString("group_id")));
                    group.setCreated_by_idfk(Integer.parseInt(res.getString("created_by_idfk")));
	            group.setGroup_name(res.getString("group_name"));
                    group.setDescription(res.getString("description"));
                    group.setPrivacy_level_idfk(res.getString("privacy_level_idfk"));
                    group.setCreate_dt(res.getString("create_dt"));
                    group.setUpdate_dt(res.getString("update_dt"));
                    
                    groups.add(group);
	        }
                con.close();
                return groups;
            }
            catch(Exception e)
            {
            }
            
            return groups;
        }
        public void deleteProject(Connection con,String project)
        {
            try{
            	Statement stt = con.createStatement();
                
	        stt.execute("USE kmat");
                String query="DELETE FROM kmat.project_tbl WHERE  project_id="+project+";";
                PreparedStatement preparedStmt = con.prepareStatement(query);
		preparedStmt.execute();
	        stt.close();
                con.close();
            }
            catch(Exception e)
            {
            }
        }
        
        public void editProject(Connection con, String projectID, Project project)
        {
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = new Date();
            String dateString=dateFormat.format(date);
            try{
            	Statement stt = con.createStatement();
                
	        stt.execute("USE kmat");
                String query="UPDATE kmat.project_tbl SET project_name='"+project.getProject_name()+"', description='"+project.getDescription()+"', privacy_level='"+project.getPrivacy_level()+"', update_dt='"+dateString+"' WHERE project_id='"+projectID+"';";
                PreparedStatement preparedStmt = con.prepareStatement(query);
		preparedStmt.execute();
	        stt.close();
                con.close();
            }
            catch(Exception e)
            {
            }
        }
        
        public void deleteGroup(Connection con,String group)
        {
            try{
            	Statement stt = con.createStatement();
                
	        stt.execute("USE kmat");
                String query="DELETE FROM kmat.group_tbl WHERE  group_id="+group+";";
                PreparedStatement preparedStmt = con.prepareStatement(query);
		preparedStmt.execute();
	        stt.close();
                con.close();
            }
            catch(Exception e)
            {
            }
        }
        
        public void editGroup(Connection con, String groupID, Group group)
        {
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = new Date();
            String dateString=dateFormat.format(date);
            try{
            	Statement stt = con.createStatement();
                
	        stt.execute("USE kmat");
                String query="UPDATE kmat.group_tbl SET group_name='"+group.getGroup_name()+"', description='"+group.getDescription()+"', privacy_level_idfk='"+group.getPrivacy_level_idfk()+"', update_dt='"+dateString+"' WHERE group_id='"+groupID+"';";
                PreparedStatement preparedStmt = con.prepareStatement(query);
		preparedStmt.execute();
	        stt.close();
                con.close();
            }
            catch(Exception e)
            {
            }
        }
}
