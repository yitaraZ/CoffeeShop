<?php

@include 'config.php';

session_start();

$admin_id = $_SESSION['admin_id'];

if(!isset($admin_id)){
   header('location:login.php');
};

if(isset($_POST['update_stock'])){

   $pid = $_POST['pid'];
   $name = $_POST['name'];
   $name = filter_var($name, FILTER_SANITIZE_STRING);
   $qty = $_POST['qty'];
   $qty = filter_var($qty, FILTER_SANITIZE_STRING);
   $cost = $_POST['cost'];
   $cost = filter_var($cost, FILTER_SANITIZE_STRING);
   
   $image = $_FILES['image']['name'];
   $image = filter_var($image, FILTER_SANITIZE_STRING);
   $image_size = $_FILES['image']['size'];
   $image_tmp_name = $_FILES['image']['tmp_name'];
   $image_folder = 'uploaded_img/'.$image;
   $old_image = $_POST['old_image'];

   $update_product = $conn->prepare("UPDATE `stock` SET name = ?, cost = ?, qty = ? WHERE id = ?");
   $update_product->execute([$name, $cost, $qty, $pid]);

   $message[] = 'product updated successfully!';

   if(!empty($image)){
      if($image_size > 2000000){
         $message[] = 'image size is too large!';
      }else{

         $update_image = $conn->prepare("UPDATE `stock` SET image = ? WHERE id = ?");
         $update_image->execute([$image, $pid]);

         if($update_image){
            move_uploaded_file($image_tmp_name, $image_folder);
            unlink('uploaded_img/'.$old_image);
            $message[] = 'image updated successfully!';
         }
      }
   }

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>update products</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/admin_style.css">

</head>
<body>
   
<?php include 'admin_header.php'; ?>

<section class="update-product">

   <h1 class="title">update stock</h1>   

   <?php
      $update_id = $_GET['update'];
      $select_products = $conn->prepare("SELECT * FROM `stock` WHERE id = ?");
      $select_products->execute([$update_id]);
      if($select_products->rowCount() > 0){
         while($fetch_products = $select_products->fetch(PDO::FETCH_ASSOC)){ 
   ?>
   <form action="" method="post" enctype="multipart/form-data">
      <input type="hidden" name="old_image" value="<?= $fetch_products['image']; ?>">
      <input type="hidden" name="pid" value="<?= $fetch_products['id']; ?>">
      <img src="uploaded_img/<?= $fetch_products['image']; ?>" alt="">
      <input type="text" name="name" placeholder="enter stock name" required class="box" value="<?= $fetch_products['name']; ?>">
      <input type="number" name="qty" min="0" placeholder="enter stock quantity" required class="box" value="<?= $fetch_products['qty']; ?>">
      <input type="number" name="cost" min="0" placeholder="enter stock cost" required class="box" value="<?= $fetch_products['cost']; ?>">
      
      <input type="file" name="image" class="box" accept="image/jpg, image/jpeg, image/png">
      <div class="flex-btn">
         <input type="submit" class="btn" value="update product" name="update_stock">
         <a href="stock.php" class="option-btn">go back</a>
      </div>
   </form>
   <?php
         }
      }else{
         echo '<p class="empty">no products found!</p>';
      }
   ?>

</section>













<script src="js/script.js"></script>

</body>
</html>