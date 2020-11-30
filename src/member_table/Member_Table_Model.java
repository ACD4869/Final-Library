package member_table;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;


import common.DBConnection_Portal;
import common_use_bean.Sequence_Member_Id;
import common_use_bean.Member_Use_Bean;



public class Member_Table_Model {
	public int insert_member(Member_Use_Bean obj_Member_Use_Bean){
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
		
		String query="insert into member_table (" +
				"member_id," +
				"member_name," +
				"number_id," +
				"telephone," +
				"added_by," +
				"added_on,status" +
				") values(?,?,?,?," +
					"?,?,?)";
			ps=connection.prepareStatement(query);
		
			Sequence_Member_Id obj_Sequence_Member_Id=new Sequence_Member_Id();
			
			
			
			ps.setString(1,obj_Sequence_Member_Id.get_member_id());
			ps.setString(2,obj_Member_Use_Bean.getMember_name());
		 
			ps.setString(3,obj_Member_Use_Bean.getNumber_id());
			ps.setString(4,obj_Member_Use_Bean.getTelephone());
		
			ps.setString(5,obj_Member_Use_Bean.getAdded_by());
			
			ps.setString(6,date4);
			ps.setInt(7,obj_Member_Use_Bean.getStatus());
			
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
	
	
	
	public int edit_member(Member_Use_Bean obj_Member_Use_Bean){
		Connection connection=null;
		DBConnection_Portal obj_DBConnection_SMS_Portal=new DBConnection_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		int flag=0;
		
		
		
	try { 
		
		String query="update member set " +
				"member_name=?," +
				"number_id=?," +
				"telephone=?," +
				"status=? where member_id=?";
			ps=connection.prepareStatement(query);
			ps.setString(1,obj_Member_Use_Bean.getMember_name());
			ps.setString(2,obj_Member_Use_Bean.getNumber_id());
			ps.setString(3,obj_Member_Use_Bean.getTelephone());
			ps.setInt(4,obj_Member_Use_Bean.getStatus());
			ps.setString(5,obj_Member_Use_Bean.getMember_id());
			
			    System.out.println(ps);
			    
			    
			 flag=ps.executeUpdate();
			 
			 query="update borrow set " +
				"member_name=? where member_id=?";
				ps=connection.prepareStatement(query);
				
				ps.setString(1, obj_Member_Use_Bean.getMember_name());
				ps.setString(2, obj_Member_Use_Bean.getMember_id());
					
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
	
	public List<Member_Use_Bean> get_all_recently_added_members(){
		Connection connection=null;
		DBConnection_Portal obj_DBConnection_SMS_Portal=new DBConnection_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Member_Use_Bean> list=new ArrayList<Member_Use_Bean>();
	try { 
		
		String query="select * from member_table order by added_on desc limit 10";
		ps=connection.prepareStatement(query);
		
		
		System.out.println(ps);
		rs=ps.executeQuery();
		
		
		while(rs.next()){
			Member_Use_Bean obj_Member_Use_Bean=new Member_Use_Bean();
			obj_Member_Use_Bean.setMember_id(rs.getString("member_id"));
			obj_Member_Use_Bean.setMember_name(rs.getString("member_name"));
			list.add(obj_Member_Use_Bean);
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
	
	public Member_Use_Bean get_complete_details_member(String member_id){
		Connection connection=null;
		DBConnection_Portal obj_DBConnection_SMS_Portal=new DBConnection_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		Member_Use_Bean obj_Member_Use_Bean=new Member_Use_Bean();
	try { 
		
		String query="select * from member where member_id=?";
		ps=connection.prepareStatement(query);
		ps.setString(1, member_id);
		
		System.out.println(ps);
		rs=ps.executeQuery();
		
		
		if(rs.next()){
			
			obj_Member_Use_Bean.setMember_id(rs.getString("member_id"));
			obj_Member_Use_Bean.setMember_name(rs.getString("member_name"));
			obj_Member_Use_Bean.setNumber_id(rs.getString("number_id"));
			obj_Member_Use_Bean.setTelephone(rs.getString("telephone"));
			obj_Member_Use_Bean.setStatus(rs.getInt("status"));
			
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
	
	return obj_Member_Use_Bean;

	}	
	
	
	
	public List<Member_Use_Bean> get_all_members(int lim){
		Connection connection=null;
		DBConnection_Portal obj_DBConnection_SMS_Portal=new DBConnection_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Member_Use_Bean> list=new ArrayList<Member_Use_Bean>();
	try { 
		
		String query="select * from member order by member_name limit "+(lim*100)+",100";
		ps=connection.prepareStatement(query);

		System.out.println(ps);
		rs=ps.executeQuery();
		
		
		while(rs.next()){
			Member_Use_Bean obj_Member_Use_Bean=new Member_Use_Bean();
			obj_Member_Use_Bean.setMember_id(rs.getString("member_id"));
			obj_Member_Use_Bean.setMember_name(rs.getString("member_name"));
			obj_Member_Use_Bean.setNumber_id(rs.getString("number_id"));
			obj_Member_Use_Bean.setTelephone(rs.getString("telephone"));
			obj_Member_Use_Bean.setStatus(rs.getInt("status"));
			list.add(obj_Member_Use_Bean);
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
