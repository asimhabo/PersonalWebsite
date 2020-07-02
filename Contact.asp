<html>
<head>
<title>PROJECT</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
h1.info{color:white}</style>
</head>
<body>
<% 
if Session("username")="" then
response.redirect("index.html")
end if
%>
<div id="background">
  <div id="page">
    <div class="header">
      <div class="footer">
        <div class="body">
          <div id="sidebar"> <a href="#"><img id="logo" src="logo.png" width="170" height="150" alt=""></a>
            <ul class="navigation">
              <li><a href="index.html">HOME</li>
              <li><a href="SIGN UP.asp">SIGN UP</a></li>
              <li><a href="login.asp">LOG IN </a></li>
              <li><a href="Forum.asp">FORUM</a></li>
			  <li><a href="people.html">PEOPLE </a></li>
			  <li><a href="Videos.html">VIDEOS</a></li>
			  <li><a href="Photo.html">PHOTOS</a></li>
			  <li class="active"><a href="Contact.asp">CONTACT INFORMATION </a></li>
			 <li class="last"><a href="map.asp">MAP</a></li>
            </ul>
            <div class="connect"> <a href="https://www.facebook.com/aseem.haboo.1" target="_blank" class="facebook"></a> <a href="https://twitter.com/AseemHabo" target="_blank" class="twitter"></a><a href="https://vimeo.com/user65798993" target="_blank" class="vimeo"></a> </div>
            <div class="footenote"> <span> @ASEM HABO </span> <span>KARABUK UNIVERSITY <br> COMPUTER ENGINEERING</span> </div>
          </div>
          <div class="content">
		  <h1 class="info"> Contact Information Page</h1>
		  <br>
		  <h1 class="info"> The Personal Information :</h1>
		  <table class="tab" border="1" width="100%" style="word-break:break-word;">
        <tbody><tr class="ro">
        <td >ID</td><td class="td">Username</td><td class="td">email</td><td class="td">Sex</td><td>Job</td><td>interestes</td><td>Bio</td>
        </tr>
		<% 
		Set oConn = Server.CreateObject("ADODB.Connection")
		oConn.Open("DRIVER={Microsoft Access Driver (*.mdb)}; Dbq=" & Server.MapPath("db.mdb"))
		qry="select * from users"
		set res=oConn.execute(qry)
		counter=0
		do while not res.eof
		if counter mod 2 =0 then
		%>
        <tr class="ro1"><td><%=counter+1%></td><td><%=res("username")%></td><td><%=res("email")%> </td><td><%=res("sex")%></td><td><%=res("job")%></td><td><%=res("inte")%></td><td><%=res("bio")%></td></tr>
		<%else%>
        <tr class="ro2"><td><%=counter+1%></td><td><%=res("username")%></td><td><%=res("email")%></td><td><%=res("sex")%></td><td><%=res("job")%></td><td><%=res("inte")%></td><td><%=res("bio")%></td></tr>
		<%
		end if
		counter=counter+1
		res.movenext
		loop
		%>

		
		
        </tbody></table>    
				 <br>
				 <br>
				 <br>
				 <br>
				 <br>
				 <br>
				 <br>
				 <br>
				 <br>
				 <br>
				 <br>
				 <br>
				 <br>
				 <br>
				 <br>
				 <br>
				 <br>
            </div>
          </div>
        </div>
      </div>
      <div class="shadow"></div>
    </div>
  </div>
</div>
</body>
</html>