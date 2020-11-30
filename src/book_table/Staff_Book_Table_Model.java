package book_table;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import category_author_publisher_model.Category_Author_Publisher_Model;

import common.DBConnection_Portal;
import common_use_bean.Book_Use_Bean;
import common_use_bean.Sequence_Book_Id;
import common_use_bean.Sequence_Copy_Id;
import common_use_bean.Member_Use_Bean;


public class Staff_Book_Table_Model {
	public int insert_book(Book_Use_Bean obj_Book_Use_Bean){
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
		
		String query="insert into book (" +
				"book_title," +
				"category_name," +
				"category_num," +
				"author_name," +
				"author_num," +
				"publisher_name," +
				"publisher_num," +
				"total_book_in_library," +
				"total_book_available," +
				"added_on," +
				"edited_on," +
				"added_by,isbn,book_id_no" +
				") values(?,?,?,?," +
					"?,?,?,?," +
					"?,?,?,?," +
					"?,?)";
			ps=connection.prepareStatement(query);
		
			ps.setString(1,obj_Book_Use_Bean.getBook_title());
			ps.setString(2,obj_Book_Use_Bean.getCategory_name());
			
			Category_Author_Publisher_Model obj_Category_Table_Model=new Category_Author_Publisher_Model();
			
			int categroy_id_no=obj_Category_Table_Model.insert_category(obj_Book_Use_Bean.getCategory_name(), "",date4);
			 
			ps.setInt(3,categroy_id_no);
			ps.setString(4,obj_Book_Use_Bean.getAuthor_name());
			
			int author_id_no=obj_Category_Table_Model.insert_author(obj_Book_Use_Bean.getAuthor_name(),date4);
			
			
			ps.setInt(5,author_id_no);
		
			ps.setString(6,obj_Book_Use_Bean.getPublisher_name());
			
			
			ps.setString(7,obj_Category_Table_Model.insert_publisher(obj_Book_Use_Bean.getPublisher_name(),date4)+"");
			
			ps.setInt(8,obj_Book_Use_Bean.getTotal_book_in_library());
			ps.setInt(9,0);
			 
			
			ps.setString(10,date4);
			ps.setString(11,null);
			ps.setString(12,"ADMIN");
			ps.setString(13,obj_Book_Use_Bean.getIsbn());			
			
			Sequence_Book_Id obj_Sequence_Book_Id=new Sequence_Book_Id();
			
			String book_id_no=obj_Sequence_Book_Id.get_book_id();
			
			ps.setString(14,book_id_no);
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
	
	public int edit_book(Book_Use_Bean obj_Book_Use_Bean){
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
		
		String query="update book set " +
				"book_title=?," +
				"category_name=?," +
				"category_num=?," +
				"author_name=?," +
				"author_num=?," +
				"publisher_name=?," +
				"publisher_num=?," +
				"total_book_in_library=?," +
				"total_book_available=?," +
				"edited_on=?," +
				"isbn=?," +
				"where book_id_no=?";
			ps=connection.prepareStatement(query);
		
			ps.setString(1,obj_Book_Use_Bean.getBook_title());
			ps.setString(2,obj_Book_Use_Bean.getCategory_name());
			
			Category_Author_Publisher_Model obj_Category_Table_Model=new Category_Author_Publisher_Model();
			
			int categroy_id_no=obj_Category_Table_Model.insert_category(obj_Book_Use_Bean.getCategory_name(), "",date4);
			 
			ps.setInt(3,categroy_id_no);
			ps.setString(4,obj_Book_Use_Bean.getAuthor_name());
			
			int author_id_no=obj_Category_Table_Model.insert_author(obj_Book_Use_Bean.getAuthor_name(),date4);
			
			
			ps.setInt(5,author_id_no);
		
			ps.setString(6,obj_Book_Use_Bean.getPublisher_name());
			
			
			ps.setString(7,obj_Category_Table_Model.insert_publisher(obj_Book_Use_Bean.getPublisher_name(),date4)+"");
			
			ps.setInt(8,obj_Book_Use_Bean.getTotal_book_in_library());
			ps.setInt(9,0);
			ps.setString(10,date4);
			ps.setString(11,obj_Book_Use_Bean.getIsbn());
			
			ps.setString(12,obj_Book_Use_Bean.getBook_id_no());
			 System.out.println(ps);
			 flag=ps.executeUpdate();
			 
			 query="update copy set " +
				"book_title=? where book_id_no=?";
				ps=connection.prepareStatement(query);
				
				ps.setString(1,obj_Book_Use_Bean.getBook_title());
				ps.setString(2, obj_Book_Use_Bean.getBook_id_no());
				
				ps.executeUpdate();
			 
				query="update copy_code set " +
				"book_title=? where book_id_no=?";
				ps=connection.prepareStatement(query);
				
				ps.setString(1,obj_Book_Use_Bean.getBook_title());
				ps.setString(2, obj_Book_Use_Bean.getBook_id_no());
				
				ps.executeUpdate();
			 
				query="update borrow set " +
				"book_title=? where book_id_no=?";
				ps=connection.prepareStatement(query);
				
				ps.setString(1,obj_Book_Use_Bean.getBook_title());
				ps.setString(2, obj_Book_Use_Bean.getBook_id_no());
				
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
	
	public List<Book_Use_Bean> get_all_recently_added_books(){
		Connection connection=null;
		DBConnection_Portal obj_DBConnection_SMS_Portal=new DBConnection_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Book_Use_Bean> list=new ArrayList<Book_Use_Bean>();
	try { 
		
		String query="select * from book order by added_on desc limit 10";
		ps=connection.prepareStatement(query);
		
		System.out.println(ps);
		rs=ps.executeQuery();
		
		while(rs.next()){
			Book_Use_Bean obj_Book_Use_Bean=new Book_Use_Bean();
				obj_Book_Use_Bean.setBook_title(rs.getString("book_title"));
				obj_Book_Use_Bean.setBook_id_no(rs.getString("book_id_no"));
			
			list.add(obj_Book_Use_Bean);
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
							public Book_Use_Bean get_Complete_details_of_book(String book_id_no){
							Connection connection=null;
							DBConnection_Portal obj_DBConnection_SMS_Portal=new DBConnection_Portal();
							connection=obj_DBConnection_SMS_Portal.getConnection();
							PreparedStatement ps=null;
							ResultSet rs=null;
							Book_Use_Bean obj_Book_Use_Bean=new Book_Use_Bean();
						try { 
							
							String query="select * from book where book_id_no=?";
							ps=connection.prepareStatement(query);
							
							ps.setString(1, book_id_no);
							System.out.println(ps);
							rs=ps.executeQuery();
							
							
							while(rs.next()){
								
									obj_Book_Use_Bean.setBook_title(rs.getString("book_title"));
									obj_Book_Use_Bean.setBook_id_no(rs.getString("book_id_no"));
									obj_Book_Use_Bean.setCategory_num(rs.getString("category_num"));
									obj_Book_Use_Bean.setCategory_name(rs.getString("category_name"));
									obj_Book_Use_Bean.setAuthor_name(rs.getString("author_name"));
									obj_Book_Use_Bean.setPublisher_name(rs.getString("publisher_name"));
									obj_Book_Use_Bean.setIsbn(rs.getString("isbn"));
									obj_Book_Use_Bean.setTotal_book_in_library(rs.getInt("total_book_in_library"));
									
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
						
						return obj_Book_Use_Bean;
					
						}	
						
						public List<Book_Use_Bean> view_all_books(int lim){
							Connection connection=null;
							DBConnection_Portal obj_DBConnection_SMS_Portal=new DBConnection_Portal();
							connection=obj_DBConnection_SMS_Portal.getConnection();
							PreparedStatement ps=null;
							ResultSet rs=null;
							List<Book_Use_Bean> list=new ArrayList<Book_Use_Bean>();
						try { 
							
							String query="select * from book order by book_title limit "+(lim*100)+",100";
							ps=connection.prepareStatement(query);
							
							
							System.out.println(ps);
							rs=ps.executeQuery();
							
							
							while(rs.next()){
								Book_Use_Bean obj_Book_Use_Bean=new Book_Use_Bean();
								obj_Book_Use_Bean.setBook_title(rs.getString("book_title"));
								obj_Book_Use_Bean.setBook_id_no(rs.getString("book_id_no"));
								obj_Book_Use_Bean.setCategory_num(rs.getString("category_num"));
								obj_Book_Use_Bean.setCategory_name(rs.getString("category_name"));
								obj_Book_Use_Bean.setAuthor_name(rs.getString("author_name"));
								obj_Book_Use_Bean.setPublisher_name(rs.getString("publisher_name"));
								obj_Book_Use_Bean.setIsbn(rs.getString("isbn"));
								obj_Book_Use_Bean.setTotal_book_in_library(rs.getInt("total_book_in_library"));
								list.add(obj_Book_Use_Bean);
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
