<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,700">
</head>
<body>
<div id="background">
  <div id="page">
    <div class="header">
      <div class="footer">
        <div class="body">
          <div id="sidebar"> <a href="#"><img id="logo" src="logo.png" width="170" height="150" alt=""></a>
            <ul class="navigation">
              <li><a href="index.html">HOME</li>
              <li><a href="SIGN UP.asp">SIGN UP</a></li>
              <li class="active"><a href="login.asp"> LOG IN </a></li>
              <li ><a href="Forum.asp">FORUM</a></li>
			  <li><a href="people.html">PEOPLE </a></li>
			  <li><a href="Videos.html">VIDEOS</a></li>
			  <li><a href="Photo.html">PHOTOS</a></li>
			  <li><a href="Contact.asp">CONTACT INFORMATION </a></li>
			 <li class="last"><a href="map.asp">MAP</a></li>
            </ul>
            <div class="connect"> <a href="https://www.facebook.com/aseem.haboo.1" target="_blank" class="facebook"></a> <a href="https://twitter.com/AseemHabo" target="_blank" class="twitter"></a><a href="https://vimeo.com/user65798993" target="_blank" class="vimeo"></a> </div>
            <div class="footenote"> <span> @ASEM HABO.</span> <span>KARABUK UNIVERSITY <br> COMPUTER ENGINEERING</span> </div>
          </div>
          
		  <div class="content">
         <div class="login-page">
  <% 
  msg=""
  if request.form("submit")="login" then
  u=request.form("username")
  p=request.form("password")
  Set oConn = Server.CreateObject("ADODB.Connection")
  oConn.Open("DRIVER={Microsoft Access Driver (*.mdb)}; Dbq=" & Server.MapPath("db.mdb"))
  qry="select * from users where username='"&u&"' and psw='"&p&"'"
  set res=oConn.execute(qry)
  if not res.eof then
  Session("username")=u
  response.redirect("welcome.html")
  else
  msg="wrong username or password"
  end if
  elseif request.form("submit")="logout" then
  Session.contents.removeall()
  end if
  %>
  <div class="form">
  <h1>LOG IN</h1>
    <form action="login.asp" method="post">
      <input type="text" placeholder="Username" name="username"/>
      <input type="password" placeholder="Password" name="password"/>
	  <% if Session("username")="" then%>
      <input type="submit" name="submit" value="login"/>
	  <%else%>
	  <input type="submit" name="submit" value="logout"/>
	  <%end if%>
      <p class="message">Not registered? <a href="SIGN UP.asp">Create an account</a></p>
    </form>
	<%=msg%>
</div>
</div>

<br>
<br>
<br>
<br>
<br>
<br>
</div>
        </div>
      </div>
      <div class="shadow"></div>
    </div>
  </div>
</div>
</div>
</body>
</html>

