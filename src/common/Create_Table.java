package common;



import java.sql.Connection;
import java.sql.Statement;

import common_use_bean.Sequence_Book_Id;
import common_use_bean.Sequence_Borrow_Id;
import common_use_bean.Sequence_Member_Id;
import common_use_bean.Sequence_Copy_Id;

public class Create_Table {

		public static void call_me() {
			Connection connection=null;
			DBConnection_Portal obj_DBConnection_LMC=new DBConnection_Portal();
			connection=obj_DBConnection_LMC.getConnection();
			Statement st=null;
			try {
				st=connection.createStatement();
				Sequence_Book_Id obj_Sequence_Book_Id=new Sequence_Book_Id();
				
				obj_Sequence_Book_Id.create_table();
				Sequence_Copy_Id obj_Sequence_Copy_Id=new Sequence_Copy_Id();
				
				obj_Sequence_Copy_Id.create_table();
				
				Sequence_Member_Id obj_Sequence_Member_Id=new Sequence_Member_Id();
				
				obj_Sequence_Member_Id.create_table();
				
				st.execute("create table staff(" +
						"sl_no int(255) auto_increment," +
						"user_name varchar(100) not null," +
						"password varchar(100) not null," +
						"primary key(sl_no))");
				
				st.execute("insert into staff(user_name,password) values('staff','staff123')");
				
				st.execute("create table publisher(" +
						"id_no int(255) auto_increment," +
						"publisher_name varchar(300) not null," +
						"added_on varchar(100)," +
						"primary key(id_no))");
				
				st.execute("create table author(" +
						"id_no int(255) auto_increment," +
						"author_name varchar(300) not null," +
						"added_on varchar(100)," +
						"primary key(id_no))");

				st.execute("create table category(" +
						"id_no int(255) auto_increment," +
						"category_name varchar(300) not null unique," +
						"added_on varchar(100)," +
						"primary key(id_no))");
				
				st.execute("create table member(" +
						"member_id varchar(300) unique not null," +
						"member_name varchar(300) not null," +
						"number_id varchar(300) unique not null," +
						"telephone varchar(13) unique not null," +
						"added_by varchar(300)," +
						"added_on varchar(300)," +
						"status int(1) not null," +
						"primary key(member_id))");
				
				st.execute("create table book(" +
						"book_id_no varchar(300) not null," +
						"book_title varchar(300) unique not null," +
						"category_name varchar(300)," +
						"category_num varchar(10)," +
						"author_name varchar(300)," +
						"author_num varchar(10)," +
						"publisher_name varchar(300)," +
						"publisher_num varchar(10)," +
						"isbn varchar(300)," +
						"total_book_in_library int(255)," +
						"total_book_available int(255)," +
						"added_on varchar(100)," +
						"edited_on varchar(100)," +
						"added_by varchar(100)," +
						"edited_by varchar(100)," +
						"primary key(book_id_no))");
				
			
					
				st.execute("create table copy(" +
						"id_no varchar(300) not null," +
						"book_id_no varchar(300) not null," +
						"book_title varchar(500) not null," +
						"count int(255) not null," +
						"added_on varchar(100) not null," +
						"added_by varchar(100)," +
						"primary key(id_no),FOREIGN KEY (book_id_no) REFERENCES book(book_id_no))");
						
				st.execute("create table copy_code(" +
						"id_no int(255) auto_increment," +
						"copy_id_no varchar(300) not null," +
						"book_title varchar(500)," +
						"book_id_no varchar(300) not null," +
						"bar_code varchar(300) unique not null," +
						"book_status varchar(300) not null," +
						"added_on varchar(100) not null," +
						"shelf varchar(300)," +
						"primary key(id_no))");
				
				st.execute("create table last_copy(" +
						"id_no int(255) auto_increment," +
						"bar_code int(255) not null," +
						"book_id_no varchar(500)," +
						"primary key(id_no))");
				
				
				Sequence_Borrow_Id obj_Sequence_Borrow_Id=new Sequence_Borrow_Id();
				
				obj_Sequence_Borrow_Id.create_table();
				
				st.execute("create table borrow(" +
						"borrow_id_no varchar(50) not null unique," +
						"member_id varchar(300) not null," +
						"member_name varchar(300) not null," +
						"book_title varchar(500) not null," +
						"book_id_no varchar(100) not null," +
						"barcode varchar(300) not null," +
						"borrow_date varchar(300) not null," +
						"return_date varchar(300)," +
						"returned_date varchar(300)," +
						"status varchar(300) not null," +
						"primary key(borrow_id_no))");
				
				} catch (Exception e) {
				e.printStackTrace();
			}finally{
				try {
					if(connection!=null){
						connection.close();
					}
				} catch (Exception e2) {
				}
				try {
					if(st!=null){
						st.close();
					}
				} catch (Exception e2) {
				}
			}
			System.out.println("all tables created");
		}
		
		
		
		public static void main(String[] args) {
			call_me();
		}
		
		
		
}
