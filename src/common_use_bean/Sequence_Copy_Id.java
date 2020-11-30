package common_use_bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import common.DBConnection_Portal;

public class Sequence_Copy_Id {
	
	public static void main(String[] args) {
		
		
		Sequence_Copy_Id obj_Sequence_Book_Id=new Sequence_Copy_Id();
		
		obj_Sequence_Book_Id.create_table();
		System.out.println("Sequence book_id Id is "+obj_Sequence_Book_Id.get_cp_id());
		
	}
	
	public String get_cp_id(){
		PreparedStatement ps=null;
		Connection connection=null;
		ResultSet rs=null;
		DBConnection_Portal obj_DBConnection_LMS_Portal=new DBConnection_Portal();
		connection=obj_DBConnection_LMS_Portal.getConnection();
		String sequence_id="";
		String query="select id_no from sequence_Copy_id";
		try {
			ps=connection.prepareStatement(query);
			rs=ps.executeQuery();
			rs.last();
			int id_no=rs.getInt(1);
			
			query="update sequence_Copy_id set id_no=id_no+1 where id_no=?";
			ps=connection.prepareStatement(query);
			ps.setInt(1, id_no+0);
			//ps.setInt(2, id_no);
			
			ps.executeUpdate();
			
			sequence_id=id_no+"";
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return sequence_id;
		
	}
	
	public  void create_table(){
		PreparedStatement ps=null;
		Connection connection=null;
		
		DBConnection_Portal obj_DBConnection_College_Portal=new DBConnection_Portal();
		connection=obj_DBConnection_College_Portal.getConnection();
				
		String query="create table sequence_Copy_id(id_no int(255) not null,primary key(id_no))";
		try {
			ps=connection.prepareStatement(query);
			ps.executeUpdate();
			
	        query="insert into sequence_Copy_id values(1)";
			ps=connection.prepareStatement(query);
			
			ps.executeUpdate();
			
			System.out.println("Table created");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
