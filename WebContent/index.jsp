<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
  <link rel="stylesheet" href="css/sms.css" type="text/css" />
  <link rel="stylesheet" type="text/css" href="css/layout4_setup.css" />         
  <link rel="stylesheet" type="text/css" href="css/layout4_text.css" />
  <link rel="icon" type="image/x-icon" href="img/favicon2.ico1" />
  <link rel="stylesheet" type="text/css" href="css/sms.css" />

  <title>Application Management System</title>

</head>

<body>

  <!-- Main Page Container -->
  <div class="page-container">

    <div class="header">

      <!-- A.1 HEADER TOP -->
      <div class="header-top">
        <a class="sitelogo" href="#" title="Go to Home page"><img src="images/gn_philips.gif"/></a>
        <div class="sitename">
          <h2>Application Management System</h2>
        </div>

        <!-- Navigation Level 1 -->
        <div class="nav0">
          <ul><li></li></ul>
        </div>              
      </div>    

      <!-- A.3 HEADER BOTTOM -->
      <!-- <div class="header-bottom"></div> -->


		<ul id="nav">
			<li><a href="#">Home</a></li>
			<li><a href="#">Applications</a></li>
			<li><a href="#">Releases</a></li>
			<li><a href="#">Technologies</a></li>
			<li><a href="#">Resources</a></li>
		</ul>
    <!-- For alternative headers END PASTE here -->

	</div>
	
	<br>
	<br>
	
    <!-- B. MAIN -->
    <div class="main">
 
	 	<div class="main-content" style="margin: 30px 0 0 250px;">
	     <div class="main-subcontent" style="float: none;">
	        <div class="subcontent-unit-border-blue" style="float: none; width:250px; padding:20px 20px 20px 90px">
	        <!-- <h1 class="blue" style="float: left; width:150px; padding:0px 0px 10px 40px;margin: 0px 0 0 0px;">Sign in</h1> -->
	          <div class="loginform">
	            <form method="post" action="jsps/home.jsp"> 
	                <p><label for="userid" class="top"><strong>Username:</strong></label><br />
	                  <input type="text" name="userid" id="userid" tabindex="1" class="field" onkeypress="return webLoginEnter(document.loginfrm.password);" value="" /></p>
	    	        <p><label for="passwd" class="top"><strong>Password:</strong></label><br />
	                  <input type="password" name="passwd" id="passwd" tabindex="2" class="field" onkeypress="return webLoginEnter(document.loginfrm.cmdweblogin);" value="" /></p>
	    	        <p><input type="submit" name="signin" value="Sign in"  /> <a href="#" onclick="webLoginShowForm(2);return false;" id="forgotpwd">Forgot Password?</a></p>
	            </form>
	          </div>
	        </div>
	       </div>
	      </div>
  
    </div>
    
    
  </div>
    
  
</body>
</html>
