<%--
  Created by IntelliJ IDEA.
  User: sy
  Date: 2019/1/6
  Time: 0:06
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    #table_show td{
        width: 50%;
        height: 36px;
    }
</style>
<table id="table_show" cellpadding="0" cellspacing="0" border="1px solid black" style="text-align: center;margin: auto;width: 100%" >
    <tr><td>用户</td><td>${tbUser.username}</td></tr>
    <tr><td>手机</td><td>${tbUser.phone}</td></tr>
    <tr><td>邮箱</td><td>${tbUser.email}</td></tr>
    <tr><td>创建时间</td><td><fmt:formatDate value="${tbUser.created}" pattern="yyyy-MM-dd HH:mm"/></td></tr>
    <tr><td>修改时间</td><td><fmt:formatDate value="${tbUser.updated}" pattern="yyyy-MM-dd HH:mm"/></td></tr>

</table>