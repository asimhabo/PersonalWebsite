<html>
<head>
 <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up Form</title>
        <link rel="stylesheet" href="css/normalize.css">
        <link href='http://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/main.css">
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<% 
if request.form("submit")<>"" then
u=request.form("user_name")
e=request.form("user_email")
p=request.form("user_password")
s=request.form("user_sex")
i=request.form("user_interest")
j=request.form("user_job")
b=request.form("user_bio")
if u<>"" and p<>"" and e<>"" then 
Set oConn = Server.CreateObject("ADODB.Connection")
oConn.Open("DRIVER={Microsoft Access Driver (*.mdb)}; Dbq=" & Server.MapPath("db.mdb"))
qry="select * from users where username='"&u&"'"
set res=oConn.execute(qry)
if res.eof then
qry="insert into users(username,email,psw,job,bio,sex,inte)values('"&u&"','"&e&"','"&p&"','"&j&"','"&b&"','"&s&"','"&i&"')"
oConn.execute(qry)
oConn.close
response.redirect("login.asp")
else
msg="this username is taken"
end if
end if
end if
%>
<body>
<div id="background">
  <div id="page">
    <div class="header">
      <div class="footer">
        <div class="body">
          <div id="sidebar"> <a href="#"><img id="logo" src="logo.png" width="170" height="150" alt=""></a>
            <ul class="navigation">
              <li><a href="index.html">HOME</li>
              <li class="active"><a href="SIGN UP.asp">SIGN UP</a></li>
              <li><a href="login.asp">LOG IN </a></li>
              <li><a href="Forum.asp">FORUM</a></li>
			  <li><a href="people.html">PEOPLE </a></li>
			  <li><a href="Videos.html">VIDEOS</a></li>
			  <li><a href="Photo.html">PHOTOS</a></li>
			  <li><a href="Contact.asp">CONTACT INFORMATION </a></li>
			 <li class="last"><a href="map.asp">MAP</a></li>
            </ul>
            <div class="connect"> <a href="https://www.facebook.com/aseem.haboo.1" target="_blank" class="facebook"></a> <a href="https://twitter.com/AseemHabo" target="_blank" class="twitter"></a><a href="https://vimeo.com/user65798993" target="_blank" class="vimeo"></a> </div>
            <div class="footenote"> <span> @ASEM HABO.</span> <span>KARABUK UNIVERSITY <br> COMPUTER ENGINEERING</span> </div>
          </div>
          <div id="content" > <p>  </p>
		  <div class="content">
            
                 <form action="SIGN UP.asp" method="post">
      
        <h1>Sign Up</h1>
        
        <fieldset>
          <legend><span class="number">1</span>Your basic info</legend>
          <label for="name">Name:</label>
          <input type="text" id="name" name="user_name">
          
          <label for="mail">Email:</label>
          <input type="email" id="mail" name="user_email">
          
          <label for="password">Password:</label>
          <input type="password" id="password" name="user_password">
          <label>Sex:</label>
          <input type="radio" id="male" value="MALE" name="user_sex"><label for="male" class="light">MALE</label><br>
          <input type="radio" id="female" value="FEMALE" name="user_sex"><label for="female" class="light">FEMALE</label>
		  
        </fieldset>
        
        <fieldset>
          <legend><span class="number">2</span>Your profile</legend>
          <label for="bio">Biography:</label>
          <textarea id="bio" name="user_bio"></textarea>
        </fieldset>
        <fieldset>
        <label for="job">Job Role:</label>
        <select id="job" name="user_job">
          <optgroup label="Web">
            <option value="Games developer">Games Developer</option>
            <option value="php developor">PHP Developer</option>
            <option value="python developer">Python Developer</option>
            <option value="Programmes developer"> Programmes Developer</option>
            <option value="web designer">Web Designer</option>
            <option value="WordPress developer">WordPress Developer</option>
          </optgroup>
          <optgroup label="Mobile">
            <option value="Android developer">Android Developer</option>
            <option value="iOS developer">iOS Developer</option>
            <option value="mobile designer">Mobile Designer</option>
          </optgroup>
          <optgroup label="Business">
            <option value="business owner">Business Owner</option>
            <option value="freelancer">Freelancer</option>
          </optgroup>
          <optgroup label="Other">
            <option value="Gamer">Gamer</option>
            <option value="Youtuber">Youtuber</option>
          </optgroup>
        </select>
         <label>Interests:</label>
          <input type="checkbox" id="sports" value="SPORTS" name="user_interest"><label class="light" for="development">SPORTS</label><br>
            <input type="checkbox" id="gaming" value="GAMING" name="user_interest"><label class="light" for="design">GAMING</label><br>
          <input type="checkbox" id="development" value="DEVELOPMENT" name="user_interest"><label class="light" for="business">DEVELOPMENT</label>
          
        </fieldset>
        <input value="submit" name="submit" type="submit" style="display:block;margin:auto;"/>
      </form>
           
			 
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