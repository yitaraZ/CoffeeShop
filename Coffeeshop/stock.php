<?php

@include 'config.php';

session_start();

$admin_id = $_SESSION['admin_id'];

if(!isset($admin_id)){
   header('location:login.php');
};

if(isset($_POST['add_product'])){

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

   $select_products = $conn->prepare("SELECT * FROM `stock` WHERE name = ?");
   $select_products->execute([$name]);

   if($select_products->rowCount() > 0){
      $message[] = 'stock name already exist!';
   }else{

      $insert_products = $conn->prepare("INSERT INTO `stock`(name, cost, qty, image) VALUES(?,?,?,?)");
      $insert_products->execute([$name, $cost, $qty, $image]);

      if($insert_products){
         if($image_size > 2000000){
            $message[] = 'image size is too large!';
         }else{
            move_uploaded_file($image_tmp_name, $image_folder);
            $message[] = 'new stock added!';
         }

      }

   }

};

if(isset($_GET['delete'])){

   $delete_id = $_GET['delete'];
   $select_delete_image = $conn->prepare("SELECT image FROM `stock` WHERE id = ?");
   $select_delete_image->execute([$delete_id]);
   $fetch_delete_image = $select_delete_image->fetch(PDO::FETCH_ASSOC);
   unlink('uploaded_img/'.$fetch_delete_image['image']);
   $delete_products = $conn->prepare("DELETE FROM `stock` WHERE id = ?");
   $delete_products->execute([$delete_id]);
   header('location:stock.php');


}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>products</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/admin_style.css">

</head>
<body>
   
<?php include 'admin_header.php'; ?>

<section class="add-products">

   <h1 class="title">add new stock</h1>

   <form action="" method="POST" enctype="multipart/form-data">
      <div class="flex">
         <div class="inputBox">
         <input type="text" name="name" class="box" required placeholder="enter item name">
         <input type="number" name="cost" class="box" required placeholder="enter cost per gram/milligram">
         
         </div>
         <div class="inputBox">
         <input type="number" min="0" name="qty" class="box" required placeholder="enter qty">
         <input type="file" name="image" required class="box" accept="image/jpg, image/jpeg, image/png">
         </div>
      </div>
      <input type="submit" class="btn" value="add stock" name="add_product">
   </form>

</section>

<section class="show-products">

   <h1 class="title">stock added</h1>

   <div class="box-container">

   <?php
      $show_products = $conn->prepare("SELECT * FROM `stock`");
      $show_products->execute();
      if($show_products->rowCount() > 0){
         while($fetch_products = $show_products->fetch(PDO::FETCH_ASSOC)){  
   ?>
   <div class="box">
      
      <img src="uploaded_img/<?= $fetch_products['image']; ?>" alt="">
      <div class="name"><?= $fetch_products['name']; ?></div>
      <div class="details"><?= $fetch_products['qty']; ?> gram/milligram</div>
      <div class="details">cost <?= $fetch_products['cost']; ?> per- gram/milligram</div>
      <div class="flex-btn">
         <a href="stock_update.php?update=<?= $fetch_products['id']; ?>" class="option-btn">update</a>
         <a href="stock.php?delete=<?= $fetch_products['id']; ?>" class="delete-btn" onclick="return confirm('delete this product?');">delete</a>
      </div>
   </div>
   <?php
      }
   }else{
      echo '<p class="empty">now stock added yet!</p>';
   }
   ?>

   </div>

</section>











<script src="js/script.js"></script>

</body>
</html>