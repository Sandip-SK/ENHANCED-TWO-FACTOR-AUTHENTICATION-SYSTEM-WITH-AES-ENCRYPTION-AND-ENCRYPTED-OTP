<?php
// Start the session
session_start();
?>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Enter OTP</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="./style.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

</head>
<body>
<!-- partial:index.partial.html -->
<div class="container" onclick="onclick">
  <div class="top"></div>
  <div class="bottom"></div>
  <div class="center">
    <h2>Enter OTP</h2>
    <form name="loginform" method="post" action="verifyOTP.php">
    <!-- <input type="email" placeholder="email" name="email" /> -->
    <input type="password" placeholder="OTP" name="otp" />
    <h2>&nbsp;</h2>
    <input type="submit" name="login" value="login">
    </form>
    <a href="signup.html">Dont have an account? Signup?</a>
  </div>
</div>
<!-- partial -->
  <script src='https://codepen.io/banik/pen/3f837b2f0085b5125112fc455941ea94.js'></script>
</body>
<?php
if (isset($_REQUEST["login"])) {
  $uname = $_SESSION['username'];
  $otp=$_POST["otp"];
  $conn=mysqli_connect('localhost','root','');
  mysqli_select_db($conn,'nis');
  
  $res=mysqli_query($conn,"select username,code from otp where username='$uname'");
  $row=mysqli_fetch_array($res);
  $enccode=$row["code"];

  echo "$uname";
  echo "$enccode";

  if(password_verify($otp, $enccode))
  {
    mysqli_query($conn,"DELETE FROM `otp` WHERE username='$uname'");
    header("Location:home.html", true, 301);
  }
  else
  {
    mysqli_query($conn,"DELETE FROM `otp` WHERE username='$uname'");
    header("Location:error.html", true, 301);
  }
}
?>
</html>