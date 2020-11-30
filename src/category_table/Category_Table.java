package category_table;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import common.DBConnection_Portal;
import common_use_bean.Category_Use_Bean;



public class Category_Table {
	
	
	public int insert_category(Category_Use_Bean obj_Category_Use_Bean){
		Connection connection=null;
		DBConnection_Portal obj_DBConnection_SMS_Portal=new DBConnection_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		
		int flag=0;
	try { 
		
		String query="insert into category (" +
						"category_name," +
						"added_on" +
						") values(?,?)";
		ps=connection.prepareStatement(query);

		ps.setString(1,obj_Category_Use_Bean.getCategory_name());
		
		TimeZone.setDefault(TimeZone.getTimeZone("Asia/Indonesia"));
		SimpleDateFormat format = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss a");
		 
		  Date today4 = new Date();
		  String date4 = format.format(today4);
		
		
		ps.setString(2,date4);
		
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
	
	

	
	
	
	public int edit_category(Category_Use_Bean obj_Category_Use_Bean){
		Connection connection=null;
		DBConnection_Portal obj_DBConnection_SMS_Portal=new DBConnection_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		
		int flag=0;
	try { 
		
		String query="update category set category_name=? where id_no=?";
		ps=connection.prepareStatement(query);
		ps.setString(1,obj_Category_Use_Bean.getCategory_name());
		ps.setString(2,obj_Category_Use_Bean.getId_no());
		System.out.println(ps);
		flag=ps.executeUpdate();
		query="update book_table set category_name=? where category_num=?";
		ps=connection.prepareStatement(query);
		ps.setString(1,obj_Category_Use_Bean.getCategory_name());
		ps.setString(2,obj_Category_Use_Bean.getId_no());
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
	

			public List<Category_Use_Bean> get_all_category(){
				Connection connection=null;
				DBConnection_Portal obj_DBConnection_SMS_Portal=new DBConnection_Portal();
				connection=obj_DBConnection_SMS_Portal.getConnection();
				PreparedStatement ps=null;
				ResultSet rs=null;
				List<Category_Use_Bean> list=new ArrayList<Category_Use_Bean>();
			try { 
				
				String query="select * from category order by category_name asc";
				ps=connection.prepareStatement(query);
				
				
				System.out.println(ps);
				rs=ps.executeQuery();
				
				
				while(rs.next()){
					Category_Use_Bean obj_Category_Use_Bean=new Category_Use_Bean();
					obj_Category_Use_Bean.setId_no(rs.getString("id_no"));
					obj_Category_Use_Bean.setCategory_name(rs.getString("category_name"));
					
					list.add(obj_Category_Use_Bean);
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
			public int delete_category(Category_Use_Bean obj_Category_Use_Bean){
				Connection connection=null;
				DBConnection_Portal obj_DBConnection_SMS_Portal=new DBConnection_Portal();
				connection=obj_DBConnection_SMS_Portal.getConnection();
				PreparedStatement ps=null;
				ResultSet rs=null;
				int flag=0;
			try { 
				
							String query="delete from category where id_no=?";
							ps=connection.prepareStatement(query);
							ps.setString(1, obj_Category_Use_Bean.getId_no());
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
				if(rs!=null){
					try {
						
						rs.close();
						}
					 catch (Exception e2) {
					}
				}
			
		}
			
			return flag;

			}		
			
}
