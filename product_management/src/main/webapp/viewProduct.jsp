<%@ page import="javax.sql.rowset.CachedRowSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Products</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{
    background:linear-gradient(135deg,#0f0f0f,#1b1b1b,#111827);
    min-height:100vh;
    color:white;
    padding:40px;
}

.container{
    width:95%;
    margin:auto;
    background:rgba(255,255,255,0.05);
    padding:30px;
    border-radius:18px;
    border:1px solid rgba(255,255,255,0.08);
    box-shadow:0 8px 20px rgba(0,0,0,0.35);
    backdrop-filter:blur(10px);
}

h2{
    text-align:center;
    color:#c4b5fd;
    margin-bottom:25px;
    font-size:30px;
}

table{
    width:100%;
    border-collapse:collapse;
    overflow:hidden;
    border-radius:12px;
}

th{
    background:#7c3aed;
    color:white;
    padding:14px;
    font-size:16px;
}

td{
    padding:14px;
    text-align:center;
    background:rgba(255,255,255,0.03);
    border-bottom:1px solid rgba(255,255,255,0.06);
    color:#e5e7eb;
}

tr:hover td{
    background:rgba(139,92,246,0.12);
}

.delete-btn{
    text-decoration:none;
    color:white;
    background:#dc2626;
    padding:8px 14px;
    border-radius:8px;
    transition:0.3s;
}

.delete-btn:hover{
    background:#b91c1c;
}

.back{
    text-align:center;
    margin-top:25px;
}

.back a{
    color:#9ca3af;
    text-decoration:none;
    font-size:15px;
}

.back a:hover{
    color:white;
}
</style>

</head>
<body>

<div class="container">

<h2>View Products</h2>

<table>

<tr>
<th>ID</th>
<th>Name</th>
<th>Category</th>
<th>Price</th>
<th>Quantity</th>
<th>Delete</th>
</tr>

<%
CachedRowSet rs = (CachedRowSet)request.getAttribute("rs");

while(rs.next()){
%>

<tr>
<td><%=rs.getInt("id")%></td>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("category")%></td>
<td><%=rs.getDouble("price")%></td>
<td><%=rs.getInt("quantity")%></td>

<td>
<a class="delete-btn"
href="<%=request.getContextPath()%>/ProductServlet?action=delete&id=<%=rs.getInt("id")%>">
Delete
</a>
</td>
</tr>

<%
}
%>

</table>

<div class="back">
<a href="index.jsp">← Back to Dashboard</a>
</div>

</div>

</body>
</html>