<?php 
require('connect.php');
$con = initDB(); 
$id = $_POST["id_order"];
$query1 = "delete from order_detail where id_order = $id";
$result = mysqli_query($con, $query1); 
$query2 = "delete from order_ where id_order = $id";
$result1 = mysqli_query($con, $query2); 
mysqli_close($con);
if($result){
    $check = "ทำรายการสำเร็จ";
}else{
    $check = "ไม่สามารถทำรายการได้";
}
?>