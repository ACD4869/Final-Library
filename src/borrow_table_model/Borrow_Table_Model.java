package borrow_table_model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import common.DBConnection_Portal;
import common_use_bean.Borrow_Use_Bean;
import common_use_bean.Sequence_Borrow_Id;
public class Borrow_Table_Model {
	
	public int update_borrow(Borrow_Use_Bean obj_Borrow_Use_Bean){
		Connection connection=null;
		DBConnection_Portal obj_DBConnection_SMS_Portal=new DBConnection_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		int flag=0;
	try { 
		
							String query="update borrow set " +
									"borrow_date=?," +
									"return_date=?," +
									"returned_date=?," +
									"status=?";
					
					ps=connection.prepareStatement(query);
					ps.setString(1, obj_Borrow_Use_Bean.getBorrow_date());
					ps.setString(7, obj_Borrow_Use_Bean.getReturn_date());
					ps.setString(8, obj_Borrow_Use_Bean.getReturned_date());
					ps.setString(9, obj_Borrow_Use_Bean.getStatus());
					ps.setString(11, obj_Borrow_Use_Bean.getBorrow_id_no());
					
					
					System.out.println(ps);
					flag=ps.executeUpdate();
			
						if(obj_Borrow_Use_Bean.getStatus()!=null){
							if(obj_Borrow_Use_Bean.getStatus().contains("Returned")){
										query="update copy_code set " +
										"book_status=? " +
										"where bar_code=?";
						
										ps=connection.prepareStatement(query);
										ps.setString(1, "Available");
										ps.setString(2, obj_Borrow_Use_Bean.getBarcode());
										
										
										System.out.println(ps);
										flag=ps.executeUpdate();
							}
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
	
	return flag;

	}	
	
	public String  get_days_delay( String dateStart,String dateStop) {
		
		 	String days=null;
			SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");

			Date d1 = null;
			Date d2 = null;

			try {
				d1 = format.parse(dateStart);
				d2 = format.parse(dateStop);

				//in milliseconds
				long diff = d2.getTime() - d1.getTime();
				long diffDays = diff / (24 * 60 * 60 * 1000);
					
				days=diffDays+"";
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return days;
		 
	 }
	 
	public int borrow(Borrow_Use_Bean obj_Borrow_Use_Bean){
		Connection connection=null;
		DBConnection_Portal obj_DBConnection_SMS_Portal=new DBConnection_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		int flag=0;
	try { 
		
		String query="select * from member where member_id=?";
		ps=connection.prepareStatement(query);
		ps.setString(1, obj_Borrow_Use_Bean.getMember_id());
		System.out.println(ps);
		rs=ps.executeQuery();
		
		if(rs.next()){
			
			if(rs.getInt("status")==0){
				flag=20;
			}else{
			
			obj_Borrow_Use_Bean.setMember_id(rs.getString("member_id"));
			obj_Borrow_Use_Bean.setMember_name(rs.getString("member_name"));
			
			
							query="insert into borrow(" +
							"member_id," +
							"member_name," +
							"book_title," +
							"book_id_no," +
							"barcode," +
							"borrow_date," +
							"return_date," +
							"status,borrow_id_no) values(?,?,?,?,?,?,?,?,?)";
					
					ps=connection.prepareStatement(query);
					ps.setString(1, obj_Borrow_Use_Bean.getMember_id());
					ps.setString(2, obj_Borrow_Use_Bean.getMember_name());
					ps.setString(3, obj_Borrow_Use_Bean.getBook_title());
					ps.setString(4, obj_Borrow_Use_Bean.getBook_id_no());
					ps.setString(5, obj_Borrow_Use_Bean.getBarcode());
					ps.setString(6, obj_Borrow_Use_Bean.getBorrow_date());
					ps.setString(7, obj_Borrow_Use_Bean.getReturn_date());
					ps.setString(8, "Pending");
					
					Sequence_Borrow_Id  obj_Sequence_Borrow_Id=new Sequence_Borrow_Id();
					ps.setString(9, obj_Sequence_Borrow_Id.get_borrow_id());
					
					
					System.out.println(ps);
					flag=ps.executeUpdate();
			
					
					query="update copy_code set book_status='Not Available' where bar_code=?";
					ps=connection.prepareStatement(query);
					ps.setString(1, obj_Borrow_Use_Bean.getBarcode());
					System.out.println(ps);
					ps.executeUpdate();
			}
				}else{
					flag=18;
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
	
	return flag;

	}	
	
	public int borrow_from_member(Borrow_Use_Bean obj_Borrow_Use_Bean){
		Connection connection=null;
		DBConnection_Portal obj_DBConnection_SMS_Portal=new DBConnection_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		int flag=0;
	try { 
		
		
		String query="select book_id_no,book_title,book_status from copy_code where bar_code=?";
		ps=connection.prepareStatement(query);
		ps.setString(1, obj_Borrow_Use_Bean.getBarcode());
		System.out.println(ps);
		rs=ps.executeQuery();
		
		if(rs.next()){
			
			
			obj_Borrow_Use_Bean.setStatus(rs.getString("book_status"));
			
			obj_Borrow_Use_Bean.setBook_id_no(rs.getString("book_id_no"));
			obj_Borrow_Use_Bean.setBook_title(rs.getString("book_title"));
			
			if(!obj_Borrow_Use_Bean.getStatus().equals("Available")){
				flag=20;
			}else{
			
							query="insert into borrow(" +
							"member_id," +
							"member_name," +
							"book_title," +
							"book_id_no," +
							"barcode," +
							"borrow_date," +
							"return_date," +
							"status,borrow_id_no) values(?,?,?,?,?,?,?,?,?)";
					
					ps=connection.prepareStatement(query);
					ps.setString(1, obj_Borrow_Use_Bean.getMember_id());
					ps.setString(2, obj_Borrow_Use_Bean.getMember_name());
					ps.setString(3, obj_Borrow_Use_Bean.getBook_title());
					ps.setString(4, obj_Borrow_Use_Bean.getBook_id_no());
					ps.setString(5, obj_Borrow_Use_Bean.getBarcode());
					ps.setString(6, obj_Borrow_Use_Bean.getBorrow_date());
					ps.setString(7, obj_Borrow_Use_Bean.getReturn_date());
					ps.setString(8, "Pending");
					
					Sequence_Borrow_Id  obj_Sequence_Borrow_Id=new Sequence_Borrow_Id();
					ps.setString(9, obj_Sequence_Borrow_Id.get_borrow_id());
					
					
					System.out.println(ps);
					flag=ps.executeUpdate();
			
					
					query="update copy_code set book_status='Not Available' where bar_code=?";
					ps=connection.prepareStatement(query);
					ps.setString(1, obj_Borrow_Use_Bean.getBarcode());
					System.out.println(ps);
					ps.executeUpdate();
			
			}
					
				}else{
					flag=18;
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
	
	return flag;

	}	
	
	
	public int delete_this_borrow(Borrow_Use_Bean obj_Borrow_Use_Bean){
		Connection connection=null;
		DBConnection_Portal obj_DBConnection_SMS_Portal=new DBConnection_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		int flag=0;
	try { 
		
					String query="delete from borrow where borrow_id_no=?";
					ps=connection.prepareStatement(query);
					ps.setString(1, obj_Borrow_Use_Bean.getBorrow_id_no());
					System.out.println(ps);
					flag=ps.executeUpdate();
					query="update copy_code set book_status='Available' where bar_code=?";
					ps=connection.prepareStatement(query);
					ps.setString(1, obj_Borrow_Use_Bean.getBarcode());
					System.out.println(ps);
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
		
					public List<Borrow_Use_Bean> borrow_history_for_a_barcode(String barcode){
						Connection connection=null;
						DBConnection_Portal obj_DBConnection_SMS_Portal=new DBConnection_Portal();
						connection=obj_DBConnection_SMS_Portal.getConnection();
						PreparedStatement ps=null;
						ResultSet rs=null;
						List<Borrow_Use_Bean> list=new ArrayList<Borrow_Use_Bean>();
						
					try { 
						
						
						String query="select * from borrow where barcode=?  order by borrow_date desc  LIMIT 500";
						ps=connection.prepareStatement(query);
						ps.setString(1,barcode);
						System.out.println(ps);
						rs=ps.executeQuery();
						
						while(rs.next()){
							Borrow_Use_Bean obj_Borrow_Use_Bean=new Borrow_Use_Bean();
							obj_Borrow_Use_Bean.setMember_id(rs.getString("member_id"));
							obj_Borrow_Use_Bean.setMember_name(rs.getString("member_name"));
							obj_Borrow_Use_Bean.setBook_title(rs.getString("book_title"));
							obj_Borrow_Use_Bean.setBorrow_date(rs.getString("borrow_date"));
							obj_Borrow_Use_Bean.setReturn_date(rs.getString("return_date"));
							
							obj_Borrow_Use_Bean.setStatus(rs.getString("status"));
							obj_Borrow_Use_Bean.setBorrow_id_no(rs.getString("borrow_id_no"));
							list.add(obj_Borrow_Use_Bean);
							

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
					
					return list;
				
					}	
					
					public List<Borrow_Use_Bean> borrow_history_for_a_member(String Member_id){
						Connection connection=null;
						DBConnection_Portal obj_DBConnection_SMS_Portal=new DBConnection_Portal();
						connection=obj_DBConnection_SMS_Portal.getConnection();
						PreparedStatement ps=null;
						ResultSet rs=null;
						List<Borrow_Use_Bean> list=new ArrayList<Borrow_Use_Bean>();
						
					try { 
						
						
						String query="select * from borrow where member_id=? order by borrow_date desc LIMIT 500";
						ps=connection.prepareStatement(query);
						ps.setString(1,Member_id);
						System.out.println(ps);
						rs=ps.executeQuery();
						
						while(rs.next()){
							Borrow_Use_Bean obj_Borrow_Use_Bean=new Borrow_Use_Bean();
							obj_Borrow_Use_Bean.setMember_id(rs.getString("member_id"));
							obj_Borrow_Use_Bean.setMember_name(rs.getString("member_name"));
							obj_Borrow_Use_Bean.setBook_title(rs.getString("book_title"));
							obj_Borrow_Use_Bean.setBorrow_date(rs.getString("borrow_date"));
							obj_Borrow_Use_Bean.setReturn_date(rs.getString("return_date"));
							obj_Borrow_Use_Bean.setStatus(rs.getString("status"));
							obj_Borrow_Use_Bean.setBarcode(rs.getString("barcode"));
							obj_Borrow_Use_Bean.setBorrow_id_no(rs.getString("borrow_id_no"));
							list.add(obj_Borrow_Use_Bean);
							

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
					
					return list;
				
					}	
					
					public Borrow_Use_Bean get_complete_details_of_borrow(String borrow_id_no){
						Connection connection=null;
						DBConnection_Portal obj_DBConnection_SMS_Portal=new DBConnection_Portal();
						connection=obj_DBConnection_SMS_Portal.getConnection();
						PreparedStatement ps=null;
						ResultSet rs=null;
						Borrow_Use_Bean obj_Borrow_Use_Bean=new Borrow_Use_Bean();
						
					try { 
						
						
						String query="select * from borrow where borrow_id_no=? LIMIT 500";
						ps=connection.prepareStatement(query);
						ps.setString(1,borrow_id_no);
						System.out.println(ps);
						rs=ps.executeQuery();
						
						if(rs.next()){
							obj_Borrow_Use_Bean.setMember_id(rs.getString("member_id"));
							obj_Borrow_Use_Bean.setMember_name(rs.getString("member_name"));
							obj_Borrow_Use_Bean.setBook_title(rs.getString("book_title"));
							obj_Borrow_Use_Bean.setBorrow_date(rs.getString("borrow_date"));
							obj_Borrow_Use_Bean.setReturn_date(rs.getString("return_date"));
							obj_Borrow_Use_Bean.setStatus(rs.getString("status"));
							obj_Borrow_Use_Bean.setBarcode(rs.getString("barcode"));
							obj_Borrow_Use_Bean.setReturned_date(rs.getString("returned_date"));
							
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
					
					return obj_Borrow_Use_Bean;
				
					}	
					
					public List<Borrow_Use_Bean> get_complete_borrow_history(int lim){
						Connection connection=null;
						DBConnection_Portal obj_DBConnection_SMS_Portal=new DBConnection_Portal();
						connection=obj_DBConnection_SMS_Portal.getConnection();
						PreparedStatement ps=null;
						ResultSet rs=null;
						List<Borrow_Use_Bean> list=new ArrayList<Borrow_Use_Bean>();
						
					try { 
						
						
						String query="select * from borrow order by borrow_date desc LIMIT "+(lim*100)+",100";
						ps=connection.prepareStatement(query);
						System.out.println(ps);
						rs=ps.executeQuery();
						
						while(rs.next()){
							Borrow_Use_Bean obj_Borrow_Use_Bean=new Borrow_Use_Bean();
							obj_Borrow_Use_Bean.setMember_id(rs.getString("member_id"));
							obj_Borrow_Use_Bean.setMember_name(rs.getString("member_name"));
							obj_Borrow_Use_Bean.setBook_title(rs.getString("book_title"));
							obj_Borrow_Use_Bean.setBorrow_date(rs.getString("borrow_date"));
							obj_Borrow_Use_Bean.setReturn_date(rs.getString("return_date"));
							obj_Borrow_Use_Bean.setStatus(rs.getString("status"));
							obj_Borrow_Use_Bean.setBarcode(rs.getString("barcode"));
							obj_Borrow_Use_Bean.setBorrow_id_no(rs.getString("borrow_id_no"));
							list.add(obj_Borrow_Use_Bean);
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
					
					return list;
				
					}	
					
					public List<Borrow_Use_Bean> get_all_pending_borrows(int lim){
						Connection connection=null;
						DBConnection_Portal obj_DBConnection_SMS_Portal=new DBConnection_Portal();
						connection=obj_DBConnection_SMS_Portal.getConnection();
						PreparedStatement ps=null;
						ResultSet rs=null;
						List<Borrow_Use_Bean> list=new ArrayList<Borrow_Use_Bean>();
						
					try { 
						
						String query="select * from borrow where status='Pending' order by borrow_date desc LIMIT "+(lim*100)+",100";
						ps=connection.prepareStatement(query);
						System.out.println(ps);
						rs=ps.executeQuery();
						
						while(rs.next()){
							Borrow_Use_Bean obj_Borrow_Use_Bean=new Borrow_Use_Bean();
							obj_Borrow_Use_Bean.setMember_id(rs.getString("member_id"));
							obj_Borrow_Use_Bean.setMember_name(rs.getString("member_name"));
							obj_Borrow_Use_Bean.setBook_title(rs.getString("book_title"));
							obj_Borrow_Use_Bean.setBorrow_date(rs.getString("borrow_date"));
							obj_Borrow_Use_Bean.setReturn_date(rs.getString("return_date"));
							obj_Borrow_Use_Bean.setStatus(rs.getString("status"));
							obj_Borrow_Use_Bean.setBarcode(rs.getString("barcode"));
							obj_Borrow_Use_Bean.setBorrow_id_no(rs.getString("borrow_id_no"));
							list.add(obj_Borrow_Use_Bean);
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
					
					return list;
				
					}		

}
