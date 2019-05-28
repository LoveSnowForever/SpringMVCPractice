<%--
  Created by IntelliJ IDEA.
  User: 洪buff
  Date: 2019/5/28
  Time: 8:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body >
    <input type="button" value="AJAX" onclick="checkValue()">
    <script type="text/javascript">
        function JQtest() {
            alert("Start");
            $.ajax({
                type:'post',
                url:'${pageContext.request.contextPath}/editCustomer.action',
            })
        }
        function createHR() {
            var xhr=null;
            if(window.ActiveXObject){
                xhr=new ActiveXObject("microsoft.xmlhttp");

            }else{
                xhr=new XMLHttpRequest();
            }
            return xhr;
        }
        function checkValue() {
            //创建引擎对象
            var xhr=createHR();
            //用于存储返回信息
            var msg="";
            alert("Start")
            var username="LCH";
            alert(username)
            //准备以post方式请求
            xhr.open("post","${pageContext.request.contextPath}/JQTest.action?time="+new Date().getTime());
            xhr.setRequestHeader("content-type","application/x-www-form-urlencoded");
            //设置为 post时，就可以在send函数中添加参数列表。当为get时，下面的send中参数为null。
            xhr.send("username="+username);
            xhr.onreadystatechange=function () {
                alert(xhr.readyState+",,"+xhr.status);
                if(xhr.readyState==4){
                    if(xhr.status==200){
                        //接收返回字符串
                        msg=xhr.responseText;
                        //使用返回的字符串信息
                        alert(msg);
                    }
                }
            }
        }
    </script>
</body>
</html>
