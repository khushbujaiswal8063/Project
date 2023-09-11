package Controller;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class Singleton {
	private static Singleton sg = new Singleton();

	//HashMap<Integer, EmployeeDto> savedata = new HashMap<Integer, EmployeeDto>();
	
	private Singleton() {
                 
	}
/*	public void DataAdd(Integer id, EmployeeDto dto) {
		System.out.println("id :" + id + " dto: " + dto.getFirstname());
		savedata.put(id, dto);
		System.out.println("savedata.size()  : " + savedata.size());
		for (Entry<Integer, EmployeeDto> entry : savedata.entrySet()) {
			System.out.println("key:" + entry.getKey() + ",Value:" + entry.getValue());
			System.out.println("key:" + entry.getKey() + ",Value:" + entry.getValue().getFirstname());
		}
	}*/
	public void ReadData(PrintWriter out,  HttpServletRequest request){
		String firstname=request.getParameter("fname");
		String gender = Boolean.valueOf(request.getParameter("gender")) ?
				"female" : Boolean.valueOf(request.getParameter("gender1")) ?
						"male": Boolean.valueOf(request.getParameter("gender2")) ? "others" : "";
		
		System.out.println("Inside ReadData");
		Connection conn=getConnection();
		Statement stmt;
		try {
			stmt = conn.createStatement(); 
			String query = "Select * from UserDB.Employee";
			ResultSet rs =stmt.executeQuery(query);
			
			
			
			JSONObject jsonObject = new JSONObject();
			JSONArray array = new JSONArray();
			
		
		
			while(rs.next()) {
			
				   JSONObject record = new JSONObject();
				 
				   //Inserting key-value pairs into the json object
				
				   record.put("id", rs.getInt("Id"));
				   record.put("firstname", rs.getString("Firstname"));
				   record.put("lastname", rs.getString("Lastname"));
				   record.put("dateofbirth", rs.getString("DateOfBirth"));
				   record.put("country", rs.getString("Country"));
				   record.put("gender", rs.getString("Gender"));
				   record.put("zipcode", rs.getString("Zipcode"));
				   record.put("state", rs.getString("State"));
				   record.put("mobileno", rs.getString("Mobileno"));
				   String Education=rs.getString("Education");
				   record.put("education", Education);
				   record.put("address", rs.getString("Address"));
				   record.put("tenth", Education.contains("10th"));
				   record.put("GR", Education.contains("Gradution")); 
				   record.put("PG", Education.contains("PG"));
				  
				   if(!firstname.isEmpty())  {
					   if(record.get("firstname").toString().toLowerCase().contains(firstname.toLowerCase())) {
						   array.add(record);
					   }
				   }
				   if(!gender.isEmpty() && !array.contains(record)) {
					   if(record.get("gender").toString().equals(gender)) {
						   array.add(record);
					   }
				   }
				   if(firstname.isEmpty() && gender.isEmpty()) {
					   array.add(record);
				   }
				   
//				   boolean tenth=false;
//				   boolean GR=false;
//				   boolean PG=false;
//				   if(Education.contains("10th")) {
//					   tenth=true;
//			        }
//				   
//				   if(Education.contains("Gradution")) {
//					   GR=true;
//			        }if(Education.contains("PG")) {
//					   PG=true;
//			        }
//				   record.put("tenth", tenth);
//				   record.put("GR", GR); 
//				   record.put("PG", PG);
//				  
//				   else if(record.get("firstname").toString().contains(firstname)) {
//					   array.add(record);
//				   }
//				  
			}
			jsonObject.put("items", array);
			out.print(jsonObject);
			System.out.println("JSONDATA====>" + jsonObject);
		
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		
		
	}
	
		
		/*public void ReadData(PrintWriter out) {
		System.out.println("Inside ReadData");
		JSONObject obj=new JSONObject();
		JSONArray userInfoArray=new JSONArray();
		obj.put("identifier", "id");
		for (Entry<Integer, EmployeeDto> entry : savedata.entrySet()) {
			System.out.println("Key:" + entry.getKey() + ", Value:" + entry.getValue());
			JSONObject innerobj = new JSONObject();
			innerobj.put("id", entry.getValue().getId());
			innerobj.put("firstname", entry.getValue().getFirstname());
			innerobj.put("lastname", entry.getValue().getLastname());
			innerobj.put("dateofbirth", entry.getValue().getDateofbirth());
			innerobj.put("gender", entry.getValue().getGender());
			innerobj.put("address", entry.getValue().getAddress());
			innerobj.put("country", entry.getValue().getCountry());
			innerobj.put("state", entry.getValue().getState());
			innerobj.put("zipcode", entry.getValue().getZipcode());
			innerobj.put("phone", entry.getValue().getPhone());
			innerobj.put("education", entry.getValue().getEducation());
			innerobj.put("tenth", entry.getValue().isTenth());
			innerobj.put("GR", entry.getValue().isGR());
			innerobj.put("PG", entry.getValue().isPG());
			
			userInfoArray.add(innerobj);
		}
		obj.put("items", userInfoArray);
		out.print(obj);
		System.out.println("JSONDATA====>" + obj);
		
	}*/
	public boolean updateData(Integer id,EmployeeDto dto) {
		//System.out.println("id:" + id + "dto:" + dto.getFirstname());
		//savedata.put(id, dto);
		try {
		//int result=0;
		 Connection conn=getConnection();
        
        // SQL statement is precompiled and stored in a
        // PreparedStatement object
        PreparedStatement preparedStatement
            = conn.prepareStatement(
                "update UserDB.Employee set FIRSTNAME=?,LASTNAME=?,DATEOFBIRTH=?,COUNTRY=?,GENDER=?,ZIPCODE=?,STATE=?,MOBILENO=?,EDUCATION=?,ADDRESS=? where ID=?;");
        
        // set the parameter to the given Java String value
       
        preparedStatement.setString(1, dto.getFirstname());
        preparedStatement.setString(2, dto.getLastname());
        preparedStatement.setString(3, dto.getDateofbirth());
        preparedStatement.setString(4, dto.getCountry());
        preparedStatement.setString(5, dto.getGender());
        preparedStatement.setString(6, dto.getZipcode());
        preparedStatement.setString(7, dto.getState());
        preparedStatement.setString(8, dto.getPhone());
        preparedStatement.setString(9, dto.getEducation());
        preparedStatement.setString(10, dto.getAddress());
        preparedStatement.setInt(11, dto.getId());
        // execute SQl statement, insert values to the
        // database
         preparedStatement.executeUpdate();
        
        // close the database connection
        conn.close();
       
		}catch (SQLException e) {
			
			e.printStackTrace();
			return false;
		}
		return true;
		
	}
	 public static boolean deleteUser(int id) 
	    {
		 try {
	        int result = 0;
	        
	        // create connection at the call of this method
	        Connection conn=getConnection();
	        // SQL statement is precompiled and stored in a
	        // PreparedStatement object
	        PreparedStatement preparedStatement
	            = conn.prepareStatement(
	                "delete from UserDB.Employee where id =?");
	        preparedStatement.setInt(1, id);
	        
	        // execute SQl statement
	        // database
	        result = preparedStatement.executeUpdate();
	        
	        // close the database connection
	        conn.close();
	        
	      
		 }catch (SQLException e) {
				
				e.printStackTrace();
				return false;
			}
		 return true;
	    }
	public static Singleton getInstance() {
		return sg;
	}
	public boolean insertDataIntoDB(EmployeeDto dto) {
		try {
		Connection conn=getConnection();
		
		String INSERT_QUERY = "Insert into UserDB.Employee(FIRSTNAME,LASTNAME,DATEOFBIRTH,COUNTRY,GENDER,ZIPCODE,STATE,MOBILENO,EDUCATION,ADDRESS) VALUES(?,?,?,?,?,?,?,?,?,?)";
    	
			PreparedStatement ps=conn.prepareStatement(INSERT_QUERY);
			System.out.println("ps  : "+ps);
				ps.setString(1,dto.getFirstname());
	   		    ps.setString(2,dto.getLastname());
	   		    ps.setString(3,dto.getDateofbirth());
	   		    ps.setString(4,dto.getCountry());
	   		    ps.setString(5,dto.getGender());
	   		    ps.setString(6,dto.getZipcode());
	   		    ps.setString(7,dto.getState());
	   		    ps.setString(8,dto.getPhone());
	   		    ps.setString(9,dto.getEducation());
	   		    ps.setString(10,dto.getAddress());
	   		    ps.execute();
	   		
		} catch (SQLException e) {
			
			e.printStackTrace();
			return false;
		}
		return true;
	
	}
	
	     
	private static Connection getConnection() {
		Connection conn=null;
		try {
			
			loadClass();
			String url = "jdbc:mysql://192.168.1.115:3306/UserDB?autoReconnect=true&SSl=false";
			conn=DriverManager.getConnection(url, "root", "root");
			System.out.println("conn : "+conn);
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return conn;
	}
	private static void loadClass() throws ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
	}
}
