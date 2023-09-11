package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ManageEmployeeController")
public class ManageEmployeeController extends HttpServlet {
	int id = 1;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);

		if (session != null) {
			session.setAttribute("id", id);

		}
		EmployeeDto dto = new EmployeeDto();
		response.setContentType("text/html");
		String action = request.getParameter("action");
		if (action == "createUser" || action.equals("createUser")) {

			
			String firstname = request.getParameter("fname");
			String lastname = request.getParameter("lname");
			String dateofbirth = request.getParameter("dateofbirth");
			String gender = request.getParameter("gender");
			String address = request.getParameter("address");
			String country = request.getParameter("country");
			String state = request.getParameter("state");
			String zipcode = request.getParameter("zipcode");
			String phone = request.getParameter("phone");
			String education="";	
	          System.out.println("10th  : "+request.getParameter("education"));
			System.out.println("Gra  : "+request.getParameter("education1"));
			System.out.println("PG  : "+request.getParameter("education2"));
			
			if(request.getParameter("education")!=null && request.getParameter("education").equalsIgnoreCase("on")) {
				education=education+"10th";
				dto.setTenth(true);
			}
			if(request.getParameter("education1")!=null && request.getParameter("education1").equalsIgnoreCase("on")) {
				education=education+",Gradution";
				dto.setGR(true);
			}
			if(request.getParameter("education2")!=null && request.getParameter("education2").equalsIgnoreCase("on")) {
				education=education+",PG";
				dto.setPG(true);
			}
			String Tenth = request.getParameter("education"); 
			String Graduation = request.getParameter("education1");   
      		String PostGraduation = request.getParameter("education2"); 
			
			 						System.out.println("firstname: " + firstname + " lastname: " + lastname + "dateofbirth: " + dateofbirth
					+ " gender: " + gender + " address: " + address + "country: " + country + " state: " + state
					+ "zipcode: " + zipcode + "phone: " + phone +"education: "+education);

			dto.setId(id);
			dto.setFirstname(firstname);
			dto.setLastname(lastname);
			dto.setDateofbirth(dateofbirth);
			dto.setGender(gender);
			dto.setAddress(address);
			dto.setCountry(country);
			dto.setState(state);
			dto.setZipcode(zipcode);
			dto.setphone(phone);
			dto.setEducation(education);
		
			System.out.println("education : "+education);
			id = (Integer) session.getAttribute("id");
			System.out.println("id:" + id + "username:" + dto.getFirstname());
			//Singleton.getInstance().DataAdd(id, dto);
		
				Singleton.getInstance().insertDataIntoDB(dto);
			 
		
			id++;
		}
	
		if (action == "updateUser" || action.equals("updateUser")) {

			System.out.println("inside update");
			int newid = Integer.parseInt(request.getParameter("id"));
			String firstname = request.getParameter("fname");
			String lastname = request.getParameter("lname");
			String dateofbirth = request.getParameter("dateofbirth");
			String gender = request.getParameter("gender");
			String address = request.getParameter("address");
			String country = request.getParameter("country");
			String state = request.getParameter("state");
			String zipcode = request.getParameter("zipcode");
			String phone = request.getParameter("phone");
			System.out.println("10th  : "+request.getParameter("education"));
			System.out.println("Gra  : "+request.getParameter("education1"));
			System.out.println("PG  : "+request.getParameter("education2"));

      		String education="";
			if(request.getParameter("education")!=null && request.getParameter("education").equalsIgnoreCase("on")) {
				education=education+"10th";
				dto.setTenth(true);
			}
			if(request.getParameter("education1")!=null && request.getParameter("education1").equalsIgnoreCase("on")) {
				education=education+",Gradution";
				dto.setGR(true);
			}
			if(request.getParameter("education2")!=null && request.getParameter("education2").equalsIgnoreCase("on")) {
				education=education+",PG";
				dto.setPG(true);
			}
			String Tenth = request.getParameter("education"); 
			String Graduation = request.getParameter("education1");   
      		String PostGraduation = request.getParameter("education2"); 
			
					
			System.out.println("fname " + firstname + " lname: " + lastname + "dateofbirth:" + dateofbirth + " gender: "
					+ gender + "address: " + address + "country:" + country + " state: " + state + "zipcode:" + zipcode
					+ "phone:" + phone+"education:"+education);

			dto.setId(newid);
			dto.setFirstname(firstname);
			dto.setLastname(lastname);
			dto.setDateofbirth(dateofbirth);
			dto.setGender(gender);
			dto.setAddress(address);
			dto.setCountry(country);
			dto.setState(state);
			dto.setZipcode(zipcode);
			dto.setphone(phone);
			dto.setEducation(education);
			
			Singleton.getInstance().updateData(newid, dto);
		}
		if (action == "deleteUser" || action.equals("deleteUser")) {

			System.out.println("inside delete");
		
		    int id = Integer.parseInt(request.getParameter("id"));
			Singleton.getInstance().deleteUser(id);
			}
		if (action == "searchUser" || action.equals("searchUser")) {
			String firstname=request.getParameter("fname");
			String gender=request.getParameter("gender");
			String gender1=request.getParameter("gender1");
			String gender2=request.getParameter("gender2");
			System.out.println("fname:"+firstname);
			System.out.println("gender:"+gender);
			System.out.println("gender1:"+gender1);
			System.out.println("gender2:"+gender2);
			
			
			Singleton.getInstance().ReadData(out,request);
		}
	}

}
