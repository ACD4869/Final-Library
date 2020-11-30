package librarian_table;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;


import common.DBConnection_Portal;
import common_use_bean.Sequence_Librarian_Id;
import common_use_bean.Librarian_Use_Bean;



public class Librarian_Table_Model {
	public int insert_librarian(Librarian_Use_Bean obj_Librarian_Use_Bean){
		Connection connection=null;
		DBConnection_Portal obj_DBConnection_SMS_Portal=new DBConnection_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		int flag=0;
		
		
		TimeZone.setDefault(TimeZone.getTimeZone("Asia/Indonesia"));
		SimpleDateFormat format = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss a");
		 
		  Date today4 = new Date();
		  String date4 = format.format(today4);
	try { 
		
		String query="insert into librarian_table (" +
				"librarian_id," +
				"librarian_name," +
				"number_id," +
				"telephone," +
				"added_by," +
				"added_on,status" +
				") values(?,?,?,?," +
					"?,?,?)";
			ps=connection.prepareStatement(query);
		
			Sequence_Librarian_Id obj_Sequence_Librarian_Id=new Sequence_Librarian_Id();
			
			
			
			ps.setString(1,obj_Sequence_Librarian_Id.get_librarian_id());
			ps.setString(2,obj_Librarian_Use_Bean.getLibrarian_name());
		 
			ps.setString(3,obj_Librarian_Use_Bean.getNumber_id());
			ps.setString(4,obj_Librarian_Use_Bean.getTelephone());
		
			ps.setString(5,obj_Librarian_Use_Bean.getAdded_by());
			
			ps.setString(6,date4);
			ps.setInt(7,obj_Librarian_Use_Bean.getStatus());
			
			    System.out.println(ps);
			    
			    
			 flag=ps.executeUpdate();
			 
			 
		
		
	 }catch(Exception e){
		e.printStackTrace();
	}finally{
		if(connection!=null){
			try {
					connection.close();
				}
			 	catch (Exception e2) {
			 	}
		}
		if(ps!=null){
			try {
				
				ps.close();
				}
			 catch (Exception e2) {
			}
		}
	
}
	
	return flag;

	}	
	
	
	
	public int edit_librarian(Librarian_Use_Bean obj_Librarian_Use_Bean){
		Connection connection=null;
		DBConnection_Portal obj_DBConnection_SMS_Portal=new DBConnection_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		int flag=0;
		
		
		
	try { 
		
		String query="update librarian set " +
				"librarian_name=?," +
				"number_id=?," +
				"telephone=?," +
				"status=? where librarian_id=?";
			ps=connection.prepareStatement(query);
			ps.setString(1,obj_Librarian_Use_Bean.getLibrarian_name());
			ps.setString(2,obj_Librarian_Use_Bean.getNumber_id());
			ps.setString(3,obj_Librarian_Use_Bean.getTelephone());
			ps.setInt(4,obj_Librarian_Use_Bean.getStatus());
			ps.setString(5,obj_Librarian_Use_Bean.getLibrarian_id());
			
			    System.out.println(ps);
			    
			    
			 flag=ps.executeUpdate();
			 
			 query="update borrow set " +
				"librarian_name=? where librarian_id=?";
				ps=connection.prepareStatement(query);
				
				ps.setString(1, obj_Librarian_Use_Bean.getLibrarian_name());
				ps.setString(2, obj_Librarian_Use_Bean.getLibrarian_id());
					
				ps.executeUpdate();
			 
		
		
	 }catch(Exception e){
		e.printStackTrace();
	}finally{
		if(connection!=null){
			try {
					connection.close();
				}
			 	catch (Exception e2) {
			 	}
		}
		if(ps!=null){
			try {
				
				ps.close();
				}
			 catch (Exception e2) {
			}
		}
	
}
	
	return flag;

	}	
	
	public List<Librarian_Use_Bean> get_all_recently_added_librarians(){
		Connection connection=null;
		DBConnection_Portal obj_DBConnection_SMS_Portal=new DBConnection_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Librarian_Use_Bean> list=new ArrayList<Librarian_Use_Bean>();
	try { 
		
		String query="select * from librarian_table order by added_on desc limit 10";
		ps=connection.prepareStatement(query);
		
		
		System.out.println(ps);
		rs=ps.executeQuery();
		
		
		while(rs.next()){
			Librarian_Use_Bean obj_Librarian_Use_Bean=new Librarian_Use_Bean();
			obj_Librarian_Use_Bean.setLibrarian_id(rs.getString("librarian_id"));
			obj_Librarian_Use_Bean.setLibrarian_name(rs.getString("librarian_name"));
			list.add(obj_Librarian_Use_Bean);
		}
		
	 }catch(Exception e){
		e.printStackTrace();
	}finally{
		if(connection!=null){
			try {
					connection.close();
				}
			 	catch (Exception e2) {
			 	}
		}
		if(ps!=null){
			try {
				
				ps.close();
				}
			 catch (Exception e2) {
			}
		}
	
}
	
	return list;

	}	
	
	public Librarian_Use_Bean get_complete_details_librarian(String librarian_id){
		Connection connection=null;
		DBConnection_Portal obj_DBConnection_SMS_Portal=new DBConnection_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		Librarian_Use_Bean obj_Librarian_Use_Bean=new Librarian_Use_Bean();
	try { 
		
		String query="select * from librarian where librarian_id=?";
		ps=connection.prepareStatement(query);
		ps.setString(1, librarian_id);
		
		System.out.println(ps);
		rs=ps.executeQuery();
		
		
		if(rs.next()){
			
			obj_Librarian_Use_Bean.setLibrarian_id(rs.getString("librarian_id"));
			obj_Librarian_Use_Bean.setLibrarian_name(rs.getString("librarian_name"));
			obj_Librarian_Use_Bean.setNumber_id(rs.getString("number_id"));
			obj_Librarian_Use_Bean.setTelephone(rs.getString("telephone"));
			obj_Librarian_Use_Bean.setStatus(rs.getInt("status"));
			
		}
		
	 }catch(Exception e){
		e.printStackTrace();
	}finally{
		if(connection!=null){
			try {
					connection.close();
				}
			 	catch (Exception e2) {
			 	}
		}
		if(ps!=null){
			try {
				
				ps.close();
				}
			 catch (Exception e2) {
			}
		}
		if(rs!=null){
			try {
				
				rs.close();
				}
			 catch (Exception e2) {
			}
		}
	
}
	
	return obj_Librarian_Use_Bean;

	}	
	
	
	
	public List<Librarian_Use_Bean> get_all_librarians(int lim){
		Connection connection=null;
		DBConnection_Portal obj_DBConnection_SMS_Portal=new DBConnection_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Librarian_Use_Bean> list=new ArrayList<Librarian_Use_Bean>();
	try { 
		
		String query="select * from librarian order by librarian_name limit "+(lim*100)+",100";
		ps=connection.prepareStatement(query);

		System.out.println(ps);
		rs=ps.executeQuery();
		
		
		while(rs.next()){
			Librarian_Use_Bean obj_Librarian_Use_Bean=new Librarian_Use_Bean();
			obj_Librarian_Use_Bean.setLibrarian_id(rs.getString("librarian_id"));
			obj_Librarian_Use_Bean.setLibrarian_name(rs.getString("librarian_name"));
			obj_Librarian_Use_Bean.setNumber_id(rs.getString("number_id"));
			obj_Librarian_Use_Bean.setTelephone(rs.getString("telephone"));
			obj_Librarian_Use_Bean.setStatus(rs.getInt("status"));
			list.add(obj_Librarian_Use_Bean);
		}
		
	 }catch(Exception e){
		e.printStackTrace();
	}finally{
		if(connection!=null){
			try {
					connection.close();
				}
			 	catch (Exception e2) {
			 	}
		}
		if(ps!=null){
			try {
				
				ps.close();
				}
			 catch (Exception e2) {
			}
		}
	
}
	
	return list;

	}	
	
}
