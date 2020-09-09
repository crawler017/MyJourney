<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改黑名单</title>
</head>
<body>
<script type="text/javascript">
    function checkform()
    {
        var =document.getElementById("id").value; //获取form中的ID
        var num=document.getElementById("num").value; //获取form中的学号
        var name=document.getElementById("name").value; //获取form中的姓名
        var regex=/^[/s]+$/; //声明一个判断用栏目前后是否有空格的正则表达式
        if(regex.test(num)||num.length==0)//判定学号是否前后有空格或者是否为空
        {
            alert("ID不能为空！");
            return false;
        }
        {
            alert("学号不能为空！");
            return false;
        }
        if(regex.test(name)||name.length==0)//同上述内容
        {
            alert("姓名不能为空！");
            return false;
        }
        return true;
    }
</script>
<?php
require "dbconfig.php";

$link = @mysqli_connect(HOST,USER,PASS) or die("提示：数据库连接失败！");
mysqli_select_db($link,'mysql');
mysqli_set_charset($link,'utf8');

$id = $id;
$sql = mysqli_query($link,"SELECT * FROM blacklist WHERE id=$id");
$sql_arr = mysqli_fetch_assoc($sql);

?>

<form action="<?php echo site_url('BlackList/blackEd'); ?>" method="post" onsubmit="return checkform()">
    <label>ID: </label><input type="text" name="id" value="<?php echo $sql_arr['id']?>">
    <label>学号: </label><input type="text" name="num" value="<?php echo $sql_arr['num']?>">
    <label>姓名: </label><input type="text" name="name" value="<?php echo $sql_arr['name']?>">
    <input type="submit" value="提交">
</form>

</body>
</html>