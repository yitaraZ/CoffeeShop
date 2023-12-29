<?php

@include 'config.php';

session_start();

if(isset($_POST['submit'])){

   $email = $_POST['email'];
   $email = filter_var($email, FILTER_SANITIZE_STRING);
   $pass = md5($_POST['pass']);
   $pass = filter_var($pass, FILTER_SANITIZE_STRING);

   $sql = "SELECT * FROM `users` WHERE email = ? AND password = ?";
   $stmt = $conn->prepare($sql);
   $stmt->execute([$email, $pass]);
   $rowCount = $stmt->rowCount();  

   $row = $stmt->fetch(PDO::FETCH_ASSOC);

   if($rowCount > 0){

      if($row['user_type'] == 'admin'){ //admin user

         $_SESSION['admin_id'] = $row['id'];
         header('location:admin_page.php');

      }elseif($row['user_type'] == 'user'){ //customer

         $_SESSION['user_id'] = $row['id'];
         header('location:home.php');

      }else{
         $message[] = 'no user found!'; //error no found user
      }

   }else{
      $message[] = 'อีเมลล์ หรือ รหัสผ่านไม่ถูกต้องกรุณากรอกใหม่';
   }

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>login</title>

   <!-- font awesome cdn link  -->


   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/components.css">

</head>
<body>

<?php

if(isset($message)){
   foreach($message as $message){
      echo '
      <div class="message">
         <span>'.$message.'</span>
         <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
      </div>
      ';
   }
}

?>
   
<section class="form-container">

   <form action="" method="POST">
      <h3>ลงชื่อเข้าใช้</h3>
      <input type="email" name="email" class="box" placeholder="ใส่อีเมลล์ของคุณ" required>
      <input type="password" name="pass" class="box" placeholder="ใส่รหัสผ่านของคุณ" required>
      <input type="submit" value="login now" class="btn" name="submit">
      <p>ยังไม่เป็นสมาชิกหรอ?  <a href="register.php">สมัครสมาชิกตรงนี้เลย</a></p>
   </form>

</section>


</body>
</html>