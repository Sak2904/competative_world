<html>
<head>

	<link rel="stylesheet" href="navbar.css">
	
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
             
.red-star {
    color: red;
}

.form-text
{
   color:red;
}
*{
  margin: 0;
  padding: 0;
  font-family: 'Poppins',sans-serif;
}
.abc{
  height: 100vh;
  display: flex;
  align-items: center;
  padding: 300px;
  background: linear-gradient(135deg, #71b7e6, #9b59b6);
}
.container{
  max-width: 700px;
  width: 100%;
  background-color: #fff;
  padding: 25px 30px;
  border-radius: 5px;
  box-shadow: 0 5px 10px rgba(0,0,0,0.15);
}
.container .title{
  font-size: 25px;
  font-weight: 500;
  position: relative;
}
.container .title::before{
  content: "";
  position: absolute;
  left: 0;
  bottom: 0;
  height: 3px;
  width: 30px;
  border-radius: 5px;
  background: linear-gradient(135deg, #71b7e6, #9b59b6);
}
.content form .user-details{
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  margin: 20px 0 12px 0;
}
form .user-details .input-box{
  margin-bottom: 15px;
  width: calc(100% / 2 - 20px);
}
form .input-box span.details{
  display: block;
  font-weight: 500;
  margin-bottom: 5px;
}
.user-details .input-box input{
  height: 45px;
  width: 100%;
  outline: none;
  font-size: 16px;
  border-radius: 5px;
  padding-left: 15px;
  border: 1px solid #ccc;
  border-bottom-width: 2px;
  transition: all 0.3s ease;
}
.user-details .input-box input:focus,
.user-details .input-box input:valid{
  border-color: #9b59b6;
}
 form .gender-details .gender-title{
  font-size: 20px;
  font-weight: 500;
 }
 form .category{
   display: flex;
   width: 80%;
   margin: 14px 0 ;
   justify-content: space-between;
 }
 form .category label{
   display: flex;
   align-items: center;
   cursor: pointer;
 }
 form .category label .dot{
  height: 18px;
  width: 18px;
  border-radius: 50%;
  margin-right: 10px;
  background: #d9d9d9;
  border: 5px solid transparent;
  transition: all 0.3s ease;
}
 #dot-1:checked ~ .category label .one,
 #dot-2:checked ~ .category label .two,
 #dot-3:checked ~ .category label .three{
   background: #9b59b6;
   border-color: #d9d9d9;
 }
 form input[type="radio"]{
   display: none;
 }
 form .button{
   height: 45px;
   margin: 35px 0
 }
 form .button input{
   height: 100%;
   width: 100%;
   border-radius: 5px;
   border: none;
   color: #fff;
   font-size: 18px;
   font-weight: 500;
   letter-spacing: 1px;
   cursor: pointer;
   transition: all 0.3s ease;
   background: linear-gradient(135deg, #71b7e6, #9b59b6);
 }
 form .button input:hover{
  /* transform: scale(0.99); */
  background: linear-gradient(-135deg, #71b7e6, #9b59b6);
  }
 @media(max-width: 584px){
 .container{
  max-width: 100%;
}
form .user-details .input-box{
    margin-bottom: 15px;
    width: 100%;
  }
  form .category{
    width: 100%;
  }
  .content form .user-details{
    max-height: 300px;
    overflow-y: scroll;
  }
  .user-details::-webkit-scrollbar{
    width: 5px;
  }
  }
  @media(max-width: 459px){
  .container .content .category{
    flex-direction: column;
  }
}
	</style>
	<script src="JS/form_val.js">
	
	<script>
	function gotoHome(){
		window.location = "homePage.jsp";
	}
	function gotoContact(){
		window.location = "contactUs.jsp";
	}
	function gotoAbout(){
		window.location = "AboutUs.jsp";
	}
	function gotoLogin(){
		window.location = "ParticipantLogin.jsp";
	}
	function gotoCompi_dash(){
		window.location = "compi_dash.jsp";
	}
	function gotoCompetitions(){
		window.location = "competitions.jsp";
	}
	function samePass(){
		
		let p1 = document.getElementById("p1").value;
		let p2 = document.getElementById("p2").value;
		
		if(p1==p2)
			return true;
		else{
			window.alert("Password not Matching");
			return false;
		}
	}
  
  </script>

</head>
<body>
<!DOCTYPE html>
<!-- Created By CodingLab - www.codinglabweb.com -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <!---<title> Responsive Registration Form | CodingLab </title>--->
    <link rel="stylesheet" href="style.css">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<body>
<nav>
	<ul class="menu">
		<li class="logo"><a onclick="gotoHome()" href="#">Competative World</a></li>
		<li class="item"><a onclick="gotoHome()" href="#">Home</a></li>
		<li class="item"><a onclick="gotoCompetitions()" href="#">Competitions</a></li>
		<li class="item"><a onclick="gotoAbout()" href="#">About</a></li>
		<li class="item"><a onclick="gotoContact()" href="#">Contact</a></li>
		</li>
		<li class="item button"><a  href="ParticipantLogin.jsp?cid=<%= request.getParameter("cid") %>">Existing User</a></li>
		<li class="toggle"><span class="bars"></span></li>
	</ul>
</nav>
  <div class="abc">
  <div class="container">
    <div class="title">Registration</div>
    <div class="content">
      <form action="pariticipantRegServlet" method="post" onsubmit="return samePass()">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Full Name <span class="red-star">*</span></span>
            <input type="text" name="name" placeholder="Enter your name" required Onblur="validateName(this,document.getElementById('CnameErr'),'Enter Valid Name')" >
                 <small id="CnameErr" class="form-text ">  </small>
          </div>
          <div class="input-box">
            <span class="details">Enter Email <span class="red-star">*</span></span>
            <input type="email" name="email" placeholder="Enter your Email" required Onblur="validateEmail(this,document.getElementById('EmailErr'),'Enter Vaild Email')">
              <small id="EmailErr" class="form-text">  </small>
          </div>
          <div class="input-box">
            <span class="details">Competition Code</span>
            <input type="text" name="cid" placeholder=<%= request.getParameter("cid") %> value="<%= request.getParameter("cid")%>" >
          </div>
          <div class="input-box">
            <span class="details">Phone Number <span class="red-star">*</span></span>
            <input type="text" name="mob" placeholder="Enter your number" required Onblur="validateMobile(this,document.getElementById('MobileErr'),'Enter Vaild Mobile number')">
            <small id="MobileErr" class="form-text "> </small>
          </div>
          <div class="input-box">
            <span class="details">Create Password <span class="red-star">*</span></span>
            <input type="password" id="password" name="pass1" placeholder="Enter your password" required Onblur="validatePassword(this,document.getElementById('UpassErr'),'password should be greater than 8 Characters ',' ')">
                <small id="UpassErr" class="form-text "></small>
          </div>
          <div class="input-box">
            <span class="details">Confirm Password <span class="red-star">*</span></span>
            <input type="password" id="p2" name="pass2" placeholder="Confirm your password" required Onblur="validateConfirmPassword(this,document.getElementById('ConfirmErr'),'Incorrect Password')">
               <small id="ConfirmErr" class="form-text "></small>
          </div>
        </div>
        <div class="gender-details">
          <input type="radio" name="gender" id="dot-1">
          <input type="radio" name="gender" id="dot-2">
          <input type="radio" name="gender" id="dot-3">
          <span class="gender-title">Gender</span>
          <div class="category">
            <label for="dot-1">
            <span class="dot one"></span>
            <span class="gender">Male</span>
          </label>
          <label for="dot-2">
            <span class="dot two"></span>
            <span class="gender">Female</span>
          </label>
          <label for="dot-3">
            <span class="dot three"></span>
            <span class="gender">Prefer not to say</span>
            </label>
          </div>
        </div>
        <div class="button">
          <input type="submit" value="Register"></input><br>
        </div>
      </form>
    </div>
  </div>
  </div>
</body>
</html>