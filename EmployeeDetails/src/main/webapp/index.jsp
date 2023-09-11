<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Details</title>
<script type="text/javascript" src="dojo-toolkit/dojo/dojo.js"> </script>
<style type="text/css">
 .required:before {
    content:" *";
    color: red;
  }
   input[type=button] {
            background-color: black;
            border: none;
            text-decoration: none;
            color: white;
            padding: 8px 8px;
            margin: 20px 20px;
            cursor: pointer;
         }
   input[type=reset] {
            background-color: black;
            border: none;
            text-decoration: none;
            color: white;
            padding: 8px 8px;
            margin: 20px 20px;
            cursor: pointer;
         }
  input[type=text], select, textarea{
  width: 25%;
  padding: 4px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  resize: vertical;
}
.radio{
	font-family: 'Times New Roman', serif;
 
}
label {
  padding: 4px 4px 4px 0;
  display: inline-block;
  font-family: 'Times New Roman', serif;
  font-size:15px;
}
input::placeholder
{
     font-family: 'Times New Roman', serif;
     font-size:10px;
 
}

input[type=date]{
  width: 25%;
  padding: 6px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  resize: vertical;
}
input[type=number]{
  width: 25%;
  padding: 6px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  resize: vertical;
}
input[type=tel]{
  width: 25%;
  padding: 6px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  resize: vertical;
}
  
</style>
<link href="${pageContext.servletContext.contextPath}/dojo-toolkit/dojox/grid/resources/Grid.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
dojo.require("dojo.data.ItemFileReadStore");
dojo.require("dojox.grid.DataGrid");

dojo.require("dijit.form.DateTextBox");

function validate(){
	
		var fname =
	        document.getElementById("fname").value;
		var lname =
	        document.getElementById("lname").value;
	     var address =
	        document.getElementById("address").value;
	     var dateofbirth =
	        document.getElementById("dateofbirth").value;
	     var zipcode =
		        document.getElementById("zipcode").value;
	     var country =
		        document.getElementById("country").value;
	     var state =
		        document.getElementById("state").value;
	    if (fname == "") {
	       alert("Please enter your name");
	      return false;
	    }
	    if (lname == "") {
		       alert("Please enter your last name");
		      return false;
		    }
	    if (address == "") {
	        alert("Please enter your address");
	       return false;
	    }
	    var x=document.getElementById("phone").value;
	    if (isNaN(x)) 
	    {
	      alert("Must input numbers");
	      return false;
	    }
	    if (dateofbirth == "") {
	        alert("Please enter your date of birth");
	       return false;
	    }
	    if (zipcode == "") {
	        alert("Please enter zipcode");
	        return false;
	    }
	    if(zipcode.length>5&&zipcode.length<2){
	    	alert("please enter valid zipcode");
	    	return false;
	    }
	    if (country == "") {
	        alert("Please enter country");
	        return false;
	    }
	    if (state == "") {
	        alert("Please enter state");
	        return false;
	    }
	    var gender=document.getElementById("gender");
	    var gender1=document.getElementById("gender1");
	    var gender2=document.getElementById("gender2");
		 
	    if ((gender.checked == false) && (gender1.checked == false) && (gender2.checked == false))
	    {
	        alert('Please select gender');
	        return false;
	    }
	   return true;
	
}

function fun(){
	//alert("shivani");
	document.getElementById('fname').value='';
    document.getElementById('lname').value='';
    document.getElementById('dateofbirth').value='';
    document.getElementById('country').value='';
    document.getElementById('zipcode').value='';
    document.getElementById('state').value='';
    document.getElementById('phone').value='';
    document.getElementById('address').value='';
    document.getElementById('education').checked=false;
    document.getElementById('education1').checked=false;
    document.getElementById('education2').checked=false;
    document.getElementById("gender").checked=false;
    document.getElementById("gender1").checked=false;
    document.getElementById("gender2").checked=false;   
    
}


function validation(formid){
//alert("inside function"+formid);

if(validate()){
   var Tenth = document.getElementById("education").checked;  
   var Graduation = document.getElementById("education1").checked;  
   var PostGraduation = document.getElementById("education2").checked;  
      
   	
   var id= document.getElementById("update").value;
   if(id==""){
   	dojo.xhrPost({
    form:formid,
    handleAs:"text",
    handle: function(data,args){
    //alert("data succesful save" +data);
    }	
 	}); 
}else
{

    var newfirstname = document.getElementById("fname").value;
    var newlastname = document.getElementById("lname").value;
    var newdateofbirth = document.getElementById("dateofbirth").value;
  	var newaddress = document.getElementById("address").value;
	var newcountry = document.getElementById("country").value;
	var newstate = document.getElementById("state").value;
	var newzipcode = document.getElementById("zipcode").value;
	var newphone = document.getElementById("phone").value;
	var newgender = document.getElementsByName("gender");
	var newtenth = document.getElementById("education").checked;  
	var newgraduation = document.getElementById("education1").checked; 
	var newpgraduation = document.getElementById("education2").checked;  
	  
		  	if(newtenth){
		   var edu =  document.getElementById("education").value;
		}
		if(newgraduation){
		var edu1=document.getElementById("education1").value;  
		}
		if(newpgraduation){
			var edu2=document.getElementById("education2").value;
		}
      for (var i=0,length=newgender.length; i<length; i++)
      {
          if (newgender[i].checked) 
          {
            var newgender1= newgender[i].value;
            //alert("gender:::"+newgender1);

            break;

            }
         }
         


           console.log("fname"+ newfirstname+"lname"+newlastname+"dateofbirth"+newdateofbirth+"gender"+newgender1+"address"+newaddress+"country"+newcountry+"state"+newstate+"zipcode"+newzipcode+"phone"+newphone+"education"+edu+"education1"+edu1+"education2"+edu2);
           urlpattern="${pageContext.servletContext.contextPath}/ManageEmployeeController?action=updateUser&id="+id+"&fname="+newfirstname+"&lname="+newlastname+"&dateofbirth="+newdateofbirth+"&gender="+newgender1+"&address="+newaddress+"&country="+newcountry+"&state="+newstate+"&zipcode="+newzipcode+"&phone="+newphone+"&education="+edu+"&education1="+edu1+"&education2="+edu2;
           dojo.xhrPost({
                     	url:urlpattern,
                     	handleAs:"text",
                        handle:function (data1,args){
                        //alert("inside dojomethod" +data1);


                         }

                     });
                  }
   				//document.getElementById("loginpage").reset();
   		}
    }

		function searchvalidation(){
			 var firstname = document.getElementById("fname").value;
			var gen = document.getElementById("gender").checked;
			var gen1 = document.getElementById("gender1").checked;
		    var gen2 = document.getElementById("gender2").checked;
			
       urlpattern="${pageContext.servletContext.contextPath}/ManageEmployeeController?action=searchUser&fname="+firstname+"&gender="+gen+"&gender1="+gen1+"&gender2="+gen2;
	 	//alert("inside search function");
	 	//alert("gender:"+gen);
	 	//alert("gender1:"+gen1);
	 	//alert("gender2:"+gen2);
	 	
	 	  dojo.xhrPost({
 	           url:urlpattern,
                handleAs:"json",
                handle:function (response,args){
                //alert("inside dojomethod" +response);
                var searchUserDataStore = new dojo.data.ItemFileReadStore({data:response});
                //alert("searchUserDataStore : " + searchUserDataStore);
            	  searchUserDataStore.fetch({
                onComplete: function(items, result)
                {
	                dojo.forEach(items, function(item){
		            var id=searchUserDataStore.getValue(item,"id");
		            console.log("id : "+id);
		            var fname=searchUserDataStore.getValue(item,"firstname");
		            console.log("fname : "+fname);
		            var lname=searchUserDataStore.getValue(item,"lastname");
		            console.log("lname : "+lname);
		          	var dateofbirth=searchUserDataStore.getValue(item,"dateofbirth");
	            	console.log("dateofbirth : "+dateofbirth);
	           		var gender=searchUserDataStore.getValue(item,"gender");
		            console.log("gender : "+gender);
		          	var address=searchUserDataStore.getValue(item,"address");
		            console.log("address : "+address);
		          	var country=searchUserDataStore.getValue(item,"country");
	                console.log("country : "+country);
	           	    var state=searchUserDataStore.getValue(item,"state");
		            console.log("state : "+state);
		          	var zipcode=searchUserDataStore.getValue(item,"zipcode");
	                console.log("zipcode : "+zipcode);
	                var mobileno=searchUserDataStore.getValue(item,"mobileno");
		            console.log("mobileno : "+mobileno);
		            var education=searchUserDataStore.getValue(item,"education");
		            console.log("education : "+education);
		            var tenth=searchUserDataStore.getValue(item,"tenth");
		            console.log("tenth : "+tenth);
		             var GR=searchUserDataStore.getValue(item,"GR");
			           console.log("GR"+GR);
			          var PG= searchUserDataStore.getValue(item,"PG");
				       console.log("PG"+PG);
				           
	           

	                  });
                   }
               });
                
            	 var layout= "[{field: 'id',name: 'id'},"+
                 "{field: 'firstname',name: 'Firstname'},"+
                 "{field: 'lastname', name: 'Lastname'},"+
                 "{field: 'dateofbirth', name: 'DateOfBirth'},"+
                 "{field: 'gender', name: 'Gender'},"+
                 "{field: 'address', name: 'Address'},"+
                 "{field: 'country', name: 'Country'},"+
                 "{field: 'state', name: 'State'},"+ 
                 "{field: 'zipcode', name: 'Zipcode'},"+
                 "{field: 'mobileno', name: 'Mobileno'},"+
                 "{field: 'education', name: 'Education'},"+
                 "{field: 'id',name: 'Action',formatter:editFormatter}]";


                var Grid = new dojox.grid.DataGrid({
                query: { id: "*" },
                store: searchUserDataStore,
                id:"gridId",
                structure:dojo.fromJson(layout),
                },document.createElement('div'));
				dojo.byId("gridDiv").appendChild(Grid.domNode);
              Grid.startup();
             		}	        
       		 });
    	}
		window.editFormatter = function(data,rowindex){
    	//alert("id:::"+data);
    	//alert("inside edit button"+rowindex);
    	var Edit='<a href=# onClick="ShowData(\''+rowindex+ '\')";>Edit</a>';
    	var Delete='<a href=# onClick="ShowDelete(\'' +rowindex+ '\')";>Delete</a>';
    	modification=Edit+" "+Delete;
    	return modification;
		}
		window.ShowData = function(rowindex){
          // alert("inside edit function"+rowindex);
 
            var data =dijit.byId("gridId").store;
            var id = data.getValue(dijit.byId("gridId").getItem(rowindex),"id");
            
            var firstname = data.getValue(dijit.byId("gridId").getItem(rowindex),"firstname");
            var lastname = data.getValue(dijit.byId("gridId").getItem(rowindex),"lastname");
            var dateofbirth = data.getValue(dijit.byId("gridId").getItem(rowindex),"dateofbirth");
            var gender= data.getValue(dijit.byId("gridId").getItem(rowindex),"gender");
            var address= data.getValue(dijit.byId("gridId").getItem(rowindex),"address");
            var country= data.getValue(dijit.byId("gridId").getItem(rowindex),"country");
            var state= data.getValue(dijit.byId("gridId").getItem(rowindex),"state");
            var zipcode= data.getValue(dijit.byId("gridId").getItem(rowindex),"zipcode");
            var phone= data.getValue(dijit.byId("gridId").getItem(rowindex),"mobileno");
            var education= data.getValue(dijit.byId("gridId").getItem(rowindex),"education");
            var tenth= data.getValue(dijit.byId("gridId").getItem(rowindex),"tenth");
            var GR= data.getValue(dijit.byId("gridId").getItem(rowindex),"GR");
            var PG= data.getValue(dijit.byId("gridId").getItem(rowindex),"PG");
            
            
            //alert("id::"+ id + "firstname::"+firstname +"lastname::"+lastname+ "dateofbirth::"+dateofbirth+"gender::"+gender+"address::"+address+"country::"+country+"state:::"+state+"zipcode::"+zipcode+"phone::"+phone+"education::"+education);
           // alert("outside edit function"+rowindex);
            document.getElementById("update").value=id;
            
    		
            document.getElementById("fname").value=firstname;
            document.getElementById("lname").value=lastname;
            document.getElementById("dateofbirth").value=dateofbirth;
     		document.getElementById("address").value=address;
     		document.getElementById("country").value=country;
    		document.getElementById("state").value=state;
    		document.getElementById("zipcode").value=zipcode;
    		document.getElementById("phone").value=phone;
    			if(tenth){
        		 document.getElementById("education").checked=true;
        		}
        		if(GR){
        		document.getElementById("education1").checked=true;  
        		}
        		if(PG){
      			document.getElementById("education2").checked=true;
        		}
       		   	
    		// alert("tenth : "+tenth+"  GR  :  "+GR+"   PG :  "+PG);
     			   		  
            if(gender=="female") {  
 
                    document.getElementById("gender").checked = true;
 
             }else if(gender=="male") {

                    document.getElementById("gender1").checked = true;

              }  
             else {
                    document.getElementById("gender2").checked = true;   
               }
            }
			
			window.ShowDelete = function(rowindex){
	           //alert("inside delete function"+rowindex);
	           var data =dijit.byId("gridId").store;
           	   var id = data.getValue(dijit.byId("gridId").getItem(rowindex),"id");
               //alert("id::"+id);
               urlpattern="${pageContext.servletContext.contextPath}/ManageEmployeeController?action=deleteUser&id="+id;
		       alert("inside delete function");
               dojo.xhrPost({
                   url:urlpattern,
  	                handleAs:"text",
                    handle:function (data2,args){
                     alert("inside delete method" +data2);
                    }
  
                 });
  
               }

			 
</script>
</head>
<body>
<div>

	<form id="loginpage"
		action="${pageContext.servletContext.contextPath}/ManageEmployeeController?action=createUser"
		method="post"  >
	
		<div class="required">
			<label>FirstName:</label>
			<input dojoType="dijit.form.TextBox" type="text" id="fname"
				name="fname" placeholder="your first name...."/>
       		<label class="required">LastName:</label>
			<input dojoType="dijit.form.TextBox" type="text" id="lname"
				name="lname" placeholder="your last name...."/>
		</div><br>
		
		<div class="required">
			<label>Dateofbirth</label>
			<input dojoType="dijit.form.DateTextBox" type="date"
				name="dateofbirth" id="dateofbirth" constraints="{datePattern:'dd/MM/yyyy'}"
				invalidMessage="Invalid date. Use DD/MM/YYYY format." />
				
			<label class="required">Country</label>
			<select name="country" dojotype="dojo.form.DropDownSelect"
				id="country" >
				<option value="">--Select--</option>
					<option value="india">India</option>
					<option value="canada">Canada</option>
					<option value="australia">Australia</option>
					<option value="china">China</option>
			</select>
		</div><br>

	    <div class="required">
			<label >Gender:</label>
			<input dojoType="dijit.form.RadioButton" type="radio"
				id="gender" value=female name="gender" ><label>female</label>  <input
				dojoType="dijit.form.RadioButton" type="radio" id="gender1"
				value=male name="gender"><label> male </label><input
				dojoType="dijit.form.RadioButton" type="radio" id="gender2"
				value=others name="gender"> <label>others</label>
		</div><br>

		<div class="required">
			<label>Zipcode</label>
			<input dojoType="dijit.form.NumberBox" type="number"
				id="zipcode" name="zipcode" placeholder="your zipcode...."/>
				
			<label class="required">State</label>
			<select name="state" dojotype="dojo.form.DropDownSelect"
				id="state">
				<option value="">--Select--</option>
					<option value="delhi">Delhi</option>
					<option value="rajasthan">Rajasthan</option>
					<option value="haryana">Haryana</option>
					<option value="bihar">Bihar</option>
					<option value="gujarat">Gujarat</option>
			</select>

		</div><br>
		<div>
			<label>Mobile No.</label>
			<input dojoType="dijit.form.NumberTextBox" type="tel"
				id="phone" name="phone" placeholder="your phone number..." maxlength="10" />
		
		</div><br>
		<div> 
			<label>Education</label>
			<input dojoType="dijit.form.CheckBox" type="checkbox" id="education"
				 name="education"/>
				 <label>Tenth</label>
				 <input dojoType="dijit.form.CheckBox" type="checkbox" id="education1"
				name="education1"/>
				<label>Graduation</label> 
				<input dojoType="dijit.form.CheckBox" type="checkbox" id="education2" 
				name="education2"/>
				<label>Post Graduation</label>
		</div><br>
			
		<div class="required">
			<label>Address:</label>
			<textarea dojoType="dijit.form.Textarea" type="textarea"
					id="address" name="address"> </textarea>
		</div><br>
		
		<div>
			<input dojoType="dijit.form.Button" type="reset" id="save"
				value="save" onclick="return validation('loginpage');" >
			<input dojoType="dijit.form.Button" type="button" id="reset"
				value="reset" onclick="fun();">
			<input dojoType="dijit.form.Button" type="button"
				id="search" value="search" onclick="searchvalidation();">
				<input type="reset" value="reset">
		</div><br>

		<div>
		<input type="hidden" id="update" >
		</div><br>
	
	</form>
	</div>

	<div id="gridDiv" style="position:relative;top:30px;width:100%; height:500px;"></div>
</body>
</html>