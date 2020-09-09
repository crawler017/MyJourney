<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改书籍信息</title>
</head>
<body>
<script type="text/javascript">
    function checkform()
    {
        var book_title=document.getElementById("book_title").value; //获取form中的图书名
        var author=document.getElementById("author").value; //获取form中的作者
        var book_copies=document.getElementById("book_copies").value; //获取form中的数量
        var publisher_name=document.getElementById("publisher_name").value; //获取form中的出版社名
        var isbn=document.getElementById("isbn").value; //获取form中的ISBN
        var copyright_year=document.getElementById("copyright_year").value; //获取form中的出版时间
        var date_added=document.getElementById("date_added").value; //获取form中的收录时间
        var regex=/^[/s]+$/; //声明一个判断用栏目前后是否有空格的正则表达式
        if(regex.test(book_title)||book_title.length==0)//判定图书名是否前后有空格或者是否为空
        {
            alert("图书名称不能为空！");
            return false;
        }
        if(regex.test(author)||author.length==0)//同上述内容
        {
            alert("作者不能为空！");
            return false;
        }
        if(regex.test(book_copies)||book_copies.length==0)//同上述内容
        {
            alert("数量不能为空！");
            return false;
        }
        if(regex.test(publisher_name)||publisher_name.length==0)//同上述内容
        {
            alert("出版社不能为空！");
            return false;
        }
        if(regex.test(isbn)||isbn.length==0)//同上述内容
        {
            alert("ISBN不能为空！");
            return false;
        }
        if(regex.test(copyright_year)||copyright_year.length==0)//同上述内容
        {
            alert("出版时间不能为空！");
            return false;
        }
        if(regex.test(date_added)||date_added.length==0)//同上述内容
        {
            alert("收录时间不能为空！");
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

$book_id = $book_id;
$sql = mysqli_query($link,"SELECT * FROM book WHERE book_id=$book_id");
$sql_arr = mysqli_fetch_assoc($sql);

?>

<form action="<?php echo site_url('BookList/bookEd'); ?>" method="post" onsubmit="return checkform()">
    <label>图书ID: </label><input type="text" name="book_id" value="<?php echo $sql_arr['book_id']?>">
    <label>图书名称: </label><input type="text" name="book_title" value="<?php echo $sql_arr['book_title']?>">
    <label>作者：</label><input type="text" name="author" value="<?php echo $sql_arr['author']?>">
    <label>数量：</label><input type="text" name="book_copies" value="<?php echo $sql_arr['book_copies']?>">
    <label>出版社：</label><input type="text" name="publisher_name" value="<?php echo $sql_arr['publisher_name']?>">
    <label>ISBN：</label><input type="text" name="isbn" value="<?php echo $sql_arr['isbn']?>">
    <label>出版时间：</label><input type="date" name="copyright_year" value="<?php echo $sql_arr['copyright_year']?>">
    <label>收录时间：</label><input type="date" name="date_added" value="<?php echo $sql_arr['date_added']?>">
    <input type="submit" value="提交">
</form>
</body>
</html>