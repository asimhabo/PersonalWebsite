<html>
<head>
<title>WEBSITE</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<% 
if Session("username")="" then
response.redirect("index.html")
end if
%>
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
              <li><a href="login.asp">LOG IN </a></li>
              <li><a href="Forum.asp">FORUM</a></li>
			  <li><a href="people.html">PEOPLE </a></li>
			  <li class="active"><a href="Videos.html">VIDEOS</a></li>
			  <li><a href="Photo.html">PHOTOS</a></li>
			  <li><a href="Contact.asp">CONTACT INFORMATION </a></li>
			 <li class="last"><a href="map.asp">MAP</a></li>
            </ul>
            <div class="connect"> <a href="https://www.facebook.com/aseem.haboo.1" target="_blank" class="facebook"></a> <a href="https://twitter.com/AseemHabo" target="_blank" class="twitter"></a><a href="https://vimeo.com/user65798993" target="_blank" class="vimeo"></a> </div>
            <div class="footenote"> <span> @ASEM HABO </span> <span>KARABUK UNIVERSITY <br> COMPUTER ENGINEERING</span> </div>
          </div>
          <div class="content" >
		  <form action="Video2.asp" method="post">
		  <h1>Maher Zain insallah :</h1>
		  <iframe width="480px" height="300px" frameborder="0" allowfullscreen="allowfullscreen" src="https://www.youtube.com/embed/KfXIF2Mm2Kc" scrolling="no"></iframe>
		  <fieldset>
          <label for="bio">Write a comment about it: </label>
          <textarea id="bio" name="user_bio"></textarea>
		  <input type="submit" name="submit" value="submit" style="display:block;margin:auto;"/>
        </fieldset>
		</form>
		<%
		com=request.form("user_bio")
		if com<>"" and request.form("submit")<>"" then
		Set oConn = Server.CreateObject("ADODB.Connection")
		oConn.Open("DRIVER={Microsoft Access Driver (*.mdb)}; Dbq=" & Server.MapPath("db.mdb"))
		qry="insert into comment (username,comment,comment_date,user_id)values('"&Session("username")&"','"&com&"','"&now&"',4)"
		oConn.execute(qry)
		oConn.close
		end if
		%>
		 <table class="tab" border="1" width="100%">
        <tbody><tr class="ro">
        <td class="td">Name</td><td class="td">Comment</td><td class="td">Date</td>
        </tr>
		<% 
		Set oConn = Server.CreateObject("ADODB.Connection")
		oConn.Open("DRIVER={Microsoft Access Driver (*.mdb)}; Dbq=" & Server.MapPath("db.mdb"))
		qry="select * from comment where user_id=4"
		set res=oConn.execute(qry)
		counter=0
		do while not res.eof
		if counter mod 2 =0 then
		%>
        <tr class="ro1"><td><%=res("username")%></td><td><%=res("comment")%> </td><td><%=res("comment_date")%></td></tr>
		<%else%>
        <tr class="ro2"><td><%=res("username")%></td><td><%=res("comment")%></td><td><%=res("comment_date")%></td></tr>
		<%
		end if
		counter=counter+1
		res.movenext
		loop
		%>
		</tbody></table>
		  
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