package staff_table;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import common.DBConnection_Portal;
import common_use_bean.Staff_Use_Bean;

public class Staff_Profile_Model {
					public Staff_Use_Bean staff_sign_in(Staff_Use_Bean obj_Staff_Use_Bean){
						PreparedStatement ps=null;
						ResultSet rs=null;
						Connection connection=null;
						DBConnection_Portal obj_DBConnection_FLY_HIND=new DBConnection_Portal();
						connection=obj_DBConnection_FLY_HIND.getConnection();
					

						 TimeZone.setDefault(TimeZone.getTimeZone("Asia/Indonesia"));
							SimpleDateFormat format = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss a");
							 
							  Date today4 = new Date();
								
								
						       String date4 = format.format(today4);
						
					try { 
						
						String query="select * from staff where user_name=? and password=?";
						ps = connection.prepareStatement(query);
						ps.setString(1,obj_Staff_Use_Bean.getUser_name());
						ps.setString(2,obj_Staff_Use_Bean.getPassword());
					System.out.println(ps);
							rs=ps.executeQuery();
							
							if(rs.next()){
								obj_Staff_Use_Bean.setId_no(rs.getString("id_no"));
								
								obj_Staff_Use_Bean.setUser_name(rs.getString("user_name"));
							
							}else{
								return null;
							}
					
				    }catch(Exception e){
						e.printStackTrace();
					}finally{
						if(connection!=null){
							try {
									connection.close();
								}
							 catch (Exception e2) {
								e2.printStackTrace();
							}
						}
						
						if(ps!=null){
							try {
								ps.close();
								}
							 catch (Exception e2) {
								 e2.printStackTrace();
							}
						}
						
						
					}
					return obj_Staff_Use_Bean;
				}
					
					public int edit_profile(Staff_Use_Bean obj_Staff_Use_Bean){
						PreparedStatement ps=null;
						ResultSet rs=null;
						Connection connection=null;
						DBConnection_Portal obj_DBConnection_FLY_HIND=new DBConnection_Portal();
						connection=obj_DBConnection_FLY_HIND.getConnection();
					
						       int flag=0;
						
					try { 
						
						String query="update staff set user_name=?,password=? where password=?";
						ps = connection.prepareStatement(query);
						ps.setString(1,obj_Staff_Use_Bean.getUser_name());
						ps.setString(2,obj_Staff_Use_Bean.getNew_password());
						ps.setString(3,obj_Staff_Use_Bean.getPassword());
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
								e2.printStackTrace();
							}
						}
						
						if(ps!=null){
							try {
								ps.close();
								}
							 catch (Exception e2) {
								 e2.printStackTrace();
							}
						}
						
						
					}
					return flag;
				}
					
					public Staff_Use_Bean get_staff_details(Staff_Use_Bean obj_Staff_Use_Bean){
						PreparedStatement ps=null;
						ResultSet rs=null;
						Connection connection=null;
						DBConnection_Portal obj_DBConnection_FLY_HIND=new DBConnection_Portal();
						connection=obj_DBConnection_FLY_HIND.getConnection();
					
					try { 
						
						String query="select * from staff where user_name!='j'";
						ps = connection.prepareStatement(query);
					System.out.println(ps);
							rs=ps.executeQuery();
							
							if(rs.next()){
								obj_Staff_Use_Bean.setId_no(rs.getString("id_no"));
								
								obj_Staff_Use_Bean.setUser_name(rs.getString("user_name"));
								
																
								
							}else{
								return null;
							}
						
				    }catch(Exception e){
						e.printStackTrace();
					}finally{
						if(connection!=null){
							try {
									connection.close();
								}
							 catch (Exception e2) {
								e2.printStackTrace();
							}
						}
						
						if(ps!=null){
							try {
								ps.close();
								}
							 catch (Exception e2) {
								 e2.printStackTrace();
							}
						}
						
						
					}
					return obj_Staff_Use_Bean;
				}
				
}
