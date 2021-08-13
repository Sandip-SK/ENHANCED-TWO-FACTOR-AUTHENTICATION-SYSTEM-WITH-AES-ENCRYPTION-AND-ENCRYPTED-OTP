<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "nis";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$username = $_POST['username'];  
$email = $_POST['email'];
$password = $_POST['password'];


//Define cipher 
$cipher = "aes-256-cbc"; 
// Generate an initialization vector 
$iv_size = openssl_cipher_iv_length($cipher); 
$iv = openssl_random_pseudo_bytes($iv_size); 
//Generate a 256-bit encryption key 
$encryption_key = openssl_random_pseudo_bytes(32);
//Data to encrypt 
$encrypted_data = openssl_encrypt($password, $cipher, $encryption_key, 0, $iv); 

$sql = "INSERT INTO credentials (email, kys, iv)
VALUES ('$email','$encryption_key','$iv')";

if ($conn->query($sql) === TRUE) {
  echo "New record created successfully";
} else {
  echo "Error: " . $sql . "<br>" . $conn->error;
} 


$sql = "INSERT INTO userinfo (email, username, password)
VALUES ('$email','$username','$encrypted_data')";

if ($conn->query($sql) === TRUE) {
  echo "New record created successfully";
  
  header("Location:index.html", true, 301);
} else {
  echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>