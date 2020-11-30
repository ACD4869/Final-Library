package common_use_bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import common.DBConnection_Portal;

public class Sequence_Borrow_Id {
	
	public static void main(String[] args) {
		
		
		Sequence_Borrow_Id obj_Sequence_Borrow_Id=new Sequence_Borrow_Id();
		
		//obj_Sequence_Borrow_Id.create_table();
		System.out.println("Sequence ISSUE Id is "+obj_Sequence_Borrow_Id.get_borrow_id());
		
	}
	
	public String get_borrow_id(){
		PreparedStatement ps=null;
		Connection connection=null;
		ResultSet rs=null;
		DBConnection_Portal obj_DBConnection_LMS_Portal=new DBConnection_Portal();
		connection=obj_DBConnection_LMS_Portal.getConnection();
		String sequence_id="";
		String query="select id_no from sequence_borrow_id";
		try {
			ps=connection.prepareStatement(query);
			rs=ps.executeQuery();
			rs.last();
			int id_no=rs.getInt(1);
			
			query="update sequence_borrow_id set id_no=id_no+1 where id_no=?";
			ps=connection.prepareStatement(query);
			ps.setInt(1, id_no+0);
			//ps.setInt(2, id_no);
			
			ps.executeUpdate();
			
			sequence_id="IS"+id_no+"";
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
		
		String query="create table sequence_borrow_id(id_no int(255) not null,primary key(id_no))";
		try {
			ps=connection.prepareStatement(query);
			ps.executeUpdate();
			
	        query="insert into sequence_borrow_id values(1)";
			ps=connection.prepareStatement(query);
			
			ps.executeUpdate();
			
			System.out.println("Table created");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
