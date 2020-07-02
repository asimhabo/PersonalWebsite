<html>
<head>
<title></title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
h2.info{color:white}</style>
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
			  <li><a href="Videos.html">VIDEOS</a></li>
			  <li><a href="Photo.html">PHOTOS</a></li>
			  <li><a href="Contact.asp">CONTACT INFORMATION </a></li>
			 <li  class="active" class="last" > <a href="map.asp">MAP</a></li>
            </ul>
            <div class="connect"> <a href="https://www.facebook.com/aseem.haboo.1" target="_blank" class="facebook"></a> <a href="https://twitter.com/AseemHabo" target="_blank" class="twitter"></a><a href="https://vimeo.com/user65798993" target="_blank" class="vimeo"></a> </div>
            <div class="footenote"> <span> @ASEM HABO.</span> <span>KARABUK UNIVERSITY <br> COMPUTER ENGINEERING</span> </div>
          </div>
          <div id="content">
          <div class="content">
			<%
if request.form("reset")<>"" then
Session("w")=""
end if 
max_width=500
max_hieght=375
if Session("w")="" then 
Session("zoom")=1
Session("w")=9655 
Session("h")=5300 
Session("l")=-3240
Session("t")=-625
Session("pix")=100
end if
%>
<%
msg=""
zoom_bt=request.form("zoom_bt")
zoom=request.form("zoom")
sf=request.form("shift_pixel")
if zoom_bt<>""  then 
Session("zoom")=CDbl(zoom)
w=Session("w")
h=Session("h")
Session("w")=9655 * CDbl(zoom)
Session("h")=5300 * CDbl(zoom)
xx=(-Session("l"))/(w-500)
yy=(-Session("t"))/(h-375)
xx=-xx
yy=-yy
Session("l")=xx*(Session("w")-500)
Session("t")=yy*(Session("h")-375)
if IsNumeric(sf) then
Session("pix")=cint(sf)
else
msg="please enter a numeric value"
end if
end if
%>
<% 
l=request.form("left")
r=request.form("right")
t=request.form("up")
b=request.form("down")
tl=request.form("top_left")
tr=request.form("top_right")
bl=request.form("down_left")
br=request.form("down_right")
if l<>"" then 
if Session("pix")+Session("l")<0 then
Session("l")=Session("l")+Session("pix")
else
Session("l")=0
msg="you cant go left any more"
end if
elseif r<>"" then
if -(Session("l")-Session("pix"))<(Session("w")-500) then
Session("l")=Session("l")-Session("pix")
else
Session("l")=-(Session("w")-500)
msg="you cant go right any more"
end if
elseif t<>"" then
if Session("pix")+Session("t")<0 then
Session("t")=Session("t")+Session("pix")
else
Session("t")=0
msg="you cant go up any more"
end if
elseif b<>"" then
if -(Session("t")-Session("pix"))<(Session("h")-375) then
Session("t")=Session("t")-Session("pix")
else
Session("t")=-(Session("h")-375)
msg="you cant go down any more"
end if
elseif tl<>"" then
if Session("pix")+Session("t")<0 then
Session("t")=Session("t")+Session("pix")
else
Session("t")=0
msg="you cant go up any more"
end if
if Session("pix")+Session("l")<0 then
Session("l")=Session("l")+Session("pix")
else
Session("l")=0
msg="you cant go left any more"
end if
elseif tr<>"" then
if Session("pix")+Session("t")<0 then
Session("t")=Session("t")+Session("pix")
else
Session("t")=0
msg="you cant go up any more"
end if
if -(Session("l")-Session("pix"))<(Session("w")-500) then
Session("l")=Session("l")-Session("pix")
else
Session("l")=-(Session("w")-500)
msg="you cant go right any more"
end if
elseif bl<>"" then
if -(Session("t")-Session("pix"))<(Session("h")-375) then
Session("t")=Session("t")-Session("pix")
else
Session("t")=-(Session("h")-375)
msg="you cant go down any more"
end if
if Session("pix")+Session("l")<0 then
Session("l")=Session("l")+Session("pix")
else
Session("l")=0
msg="you cant go left any more"
end if
elseif br<>"" then
if -(Session("t")-Session("pix"))<(Session("h")-375) then
Session("t")=Session("t")-Session("pix")
else
Session("t")=-(Session("h")-375)
msg="you cant go down any more"
end if
if -(Session("l")-Session("pix"))<(Session("w")-500) then
Session("l")=Session("l")-Session("pix")
else
Session("l")=-(Session("w")-500)
msg="you cant go right any more"
end if
end if
%>
<div class="map_main_div">
<div class="cc_map">
<form action="map.asp" method="post">
  <input type="hidden" value="left" name="left" />
  <input type="submit" value="" id="map_left" class="map_bt"/>
</form>
<form action="map.asp" method="post">
  <input type="hidden" value="right" name="right" />
  <input type="submit" value="" id="map_right" class="map_bt"/>
</form>
<form action="map.asp" method="post">
  <input type="hidden" value="up" name="up" />
  <input type="submit" value="" id="map_up" class="map_bt"/>
</form>
<form action="map.asp" method="post">
  <input type="hidden" value="down" name="down" />
  <input type="submit" value="" id="map_down" class="map_bt"/>
</form>
<form action="map.asp" method="post">
  <input type="hidden" value="top_left" name="top_left" />
  <input type="submit" value="" id="map_top_left" class="map_bt"/>
</form>
<form action="map.asp" method="post">
  <input type="hidden" value="top_right" name="top_right" />
  <input type="submit" value="" id="map_top_right" class="map_bt"/>
</form>
<form action="map.asp" method="post">
  <input type="hidden" value="down_left" name="down_left" />
  <input type="submit" value="" id="map_down_left" class="map_bt"/>
</form>
<form action="map.asp" method="post">
  <input type="hidden" value="down_right" name="down_right" />
  <input type="submit" value="" id="map_down_right" class="map_bt"/>
</form>
<div class="container_map">
  <img style="margin-left:<%=Session("l")%>px;margin-top:<%=Session("t")%>px;width:<%=Session("w")%>px;height:<%=Session("h")%>px;" src="http://www.kgm.gov.tr/SiteCollectionImages/KGMimages/Haritalar/turistik.jpg" />
</div>
</div>
<form action="map.asp" method="post" class="zoom_form">
ZOOM: 
<select name="zoom" id="combo" style="width:100px;">
<%  
for x=1 to 10
z=""
if Session("zoom")=x/10 then
z="option selected='selected'"
end if
response.write("<option value='"&x/10&"' "&z&">"&x/10&"</option>")
next
%>
</select><br/><br/>
<input type="submit" value="apply" name="zoom_bt" id="comment_bt" style="margin:0;width:120px;padding:0;font-size:16px;height:40px;"/>
</form>
</div>
			
		
		
		
		
 <div> </a>


   
  
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
