<%--
  Created by IntelliJ IDEA.
  User: 洪buff
  Date: 2019/5/9
  Time: 20:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <link rel="stylesheet" href="edit.css">
    <script src="webapp/js/jquery.min.js"></script>
    <title>查询数据</title>
<%--    <script type="text/javascript">--%>
<%--        document.location="/SpringMvcPractice_war_exploded/queryById.action";--%>
<%--    </script>--%>
</head>
<body load  >
<script src="paging.js"></script>
        <form action="/SpringMvcPractice_war_exploded/queryCustomerAll.action" method="post">
            <input id="goTo" type="submit" value="搜索" style="background-color: #173e65;color: #ffffff"; width="70px">
        </form>

          <c:if test="${list!=null}">

              <table id="t_customer" style="margin-top: 10px;width: 700px;text-align:center " border="1" >
              <tr>
                  <td>ID</td><td>姓名</td><td>手机号</td><td>邮箱</td><td>中意房号</td><td>创建日期</td><td>操作</td>
              </tr>
              <c:forEach items="${list}" var="item" >
                  <tr>

                    <td>${item.id}</td> <td>${item.name}</td> <td>${item.tel}</td> <td>${item.email}</td>
                     <td>${item.houseId}</td> <td>${item.date}</td> <td><a onclick="editCustomer('${item.id}')"style="color: #f0ad4e">编辑</a>|<a>删除</a></td>
                  </tr>
              </c:forEach>
          </table>
              <div class="mask">
                  <div class="c">
                      <div style="background-color: #f0ad4e;height: 20px;color: #fff;font-size: 12px;padding-left: 7px;">
                          修改信息<font style="float: right;padding-right: 10px;"onclick="cancelEdit()">x</font>
                      </div>
                      <form id="editForm" action="updateById.action" method="post">
                          姓名 <input type="text" id="editName" name="name" style="width: 120px"><br>
                          手机号<input type="text" id="editTel" name="tel" style="width: 120px"><br>
                          邮箱<input type="text" id="editEmail" name="email" style="width: 120px"><br>
                          中意房号<input type="text" id="editHouse" name="houseId" style="width: 120px"><br>
                          <input type="hidden" name="customerId",id="customerId">
                          <input type="hidden" name="startPage",id="eStartPage">
                          <input type="hidden" name="currentPage",id="eCurrentPage">
                          <input type="hidden" name="pageSize" id="ePageSize">
                          <input type="submit" value="提交" style="background-color: #173e65;color:#ffffff;width:70px;">
                      </form>
                  </div>
              </div>


          </c:if>
          <c:if test="${list==null}">
              <b>搜索结果为空</b>
          </c:if>
          <div class="gridItem" style="padding: 5px; width: 250px; float: left; text-align: left; height: 20px; font-size: 15px;" >
              共有<span id="spanTotalListNum"></span>条记录
              当前第<span id="spanCurPageNum"></span>页
              共<span id="spanTotalPage"></span>页
          </div>
          <div class="gridItem" style="margin-left: 50px;padding: 5px;width: 400px;float: left;text-align: center;height: 20px;vertical-align: middle;font-size: 15px">
                <span id="spanFirst"><a onclick="hide()">首页</a> </span>
                <span id="spanPre">上一页</span>
                <span id="spanInput" style="margin: 0px;padding: 0px 0px 4px 0px;height: 100%">
                    第<input id="goPageText" type="number" class="TextBox" onkeyup="changePage()" style="height: 20px;text-align: center;width: 50px"/>页
                </span>
                <span id="spanNext">下一页</span>
                <span id="spanLast">尾页</span>

          </div>
<%--          list不为null才初始化表格，不然表格的id不存在--%>
         <script>hide();</script>
<%--         编辑的js代码   --%>
         <script type="text/javascript">
             var theTable=document.getElementById("t_customer");
             var  txtValue=document.getElementById("goPageText").value;
             function changePage() {
                 var txtValue2=document.getElementById("goPageText").value;
                 if(txtValue!=txtValue2){
                     //填写的数字比最大数目大就不做任何处理
                     if(txtValue2>pageCount()){

                     }
                     else if(txtValue2<1){

                     }
                     else if(txtValue2==1){
                         first();
                     }
                     else if(txtValue2==pageCount()){
                         last();
                     }else{
                         hideTable();
                         page=txtValue2;
                         go_pageNum.value=page;
                         var currentRow=pageSize*page;
                         var maxRow=currentRow-pageSize;
                         if(currentRow>numberRowsInTable)currentRow=numberRowsInTable;
                         for(var i=maxRow;i<currentRow;i++){
                             theTable.rows[i].style.display='';

                         }
                         if(maxRow==0){

                         }
                         showPage();
                         nextLink();
                         lastLink();
                         firstLink();
                         preLink();
                     }
                 }
             }
             function print(){
                 alert("hello");
             }
         </script>
         <script type="text/javascript">
             function editCustomer(id) {
                 var message="{'id:'"+id+"}";
                 console.log(id);
                 $.ajax({
                     type:'post',
                     url:'${pageContext.request.contextPath}/editCustomer.action',
                     contentType:'application/json;charset=utf-8',
                     data:  'id:10001',//message,//数据是json串
                     success:function (data) {//返回json结果
                            console.log(data);
                            $("#editName").val(data["name"]);
                            $("#editTel").val(data["tel"]);
                            $("#editEmail").val(data["email"]);
                            $("#editHouseId").val(data["houseId"]);
                            //显示弹出框
                            $(".mask").css("display","block");
                            //引入分页信息到表单
                            $("#eStartPage").val($("#startPage").val());
                            $("#eCurrentPage").val($("#currentPage").val());
                            $("#ePageSize").val($("#pageSize").val());
                     }
                 });
             }
         </script>


</body>
</html>
