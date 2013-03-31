<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/sms.css" type="text/css" />
<link rel="stylesheet" href="css/layout4_text.css" type="text/css" />
<link rel="stylesheet" href="css/layout4_setup.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/public.css" />

</head>
<body>  
<br/>
	<div class="main-content">
     <div class="main-subcontent">
        <div class="subcontent-unit-border">
          <h1>Sign in</h1>
          <div class="loginform">
            <form method="post" action="index.html"> 
                <p><label for="userid" class="top"><strong>Username:</strong></label><br />
                  <input type="text" name="userid" id="userid" tabindex="1" class="field" onkeypress="return webLoginEnter(document.loginfrm.password);" value="" /></p>
    	        <p><label for="passwd" class="top"><strong>Password:</strong></label><br />
                  <input type="password" name="passwd" id="passwd" tabindex="2" class="field" onkeypress="return webLoginEnter(document.loginfrm.cmdweblogin);" value="" /></p>
    	        <p><input type="submit" name="signin" class="sms-button sms-button-submit" value="Sign in"  /></p>
	            <p><a href="#" onclick="webLoginShowForm(2);return false;" id="forgotpwd">Forgot Password?</a></p>
            </form>
          </div>
        </div>
       </div>
      </div>
     
</body>
</html>

