<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color:#00005A;
}

.topnav a {
  float: left;
  color:#f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
background-image: url("5.jpg");
  color:black;
}

.topnav a.active {
 background-image: url("5.jpg");
   background-color: #ddd;
  color:black;
}

.modal {
    position:fixed;
    top: 50%;
    left: 50%;
    margin-top: -9em; /*set to a negative number 1/2 of your height*/
    margin-left: -15em;
	
    height:250px;
    width:35%;
   
}
p.thicker {
  font-weight: 900;
}
</style>
</head>
<body  background="5.jpg">

<div class="topnav">
   <a  href="Home.jsp">Signin</a>
   <a class="active" href="signup.jsp">Signup</a>
  <a href="#contact">Contact</a>
  <a href="#about">About</a>
</div>

<div style="padding-left:16px">
  
</div>

<div align="center">
<div class="modal" >
<font size="4" color="black">
<form method="post" action="UserSignup">
<h2>User Name already exists!!!</h3>
<h3>SignUp</h3>
<table>
<tr>
<th>
User name
</th>
<td>
<input type="text" name="uname" required><br><br>
</td>
</tr>
<tr>
<th>
Full name
</th>
<td>
<input type="text" name="fullname" required><br><br>
</td>
</tr>
<tr>
<th>
gmail
</th>
<td>
<input type="email" name="gmail" required><br>
</td>
</tr>
<tr>
<th>
Gender
</th>
<td>
<input type="radio" name="gender" value="male" required>Male<br><br>
<input type="radio" name="gender" value="female" required>Female<br><br>
</td>
</tr>
<tr>
<th>
Password 
</th>
<td>
<input type="password" name="password" required>
</td>
</tr>
</table>
<br><br>
<input type="submit" value="Sigup">
</form>
</font>
</div>
</div>

</body>
</html>
