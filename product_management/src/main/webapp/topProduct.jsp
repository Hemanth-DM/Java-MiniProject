<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="product_management.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Top Product</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Segoe UI, sans-serif;
}

body{
    background:linear-gradient(135deg,#0f0f0f,#111827);
    min-height:100vh;
    color:white;
    padding:40px;
}

.container{
    width:95%;
    margin:auto;
    background:#1f2937;
    padding:30px;
    border-radius:16px;
    box-shadow:0 10px 25px rgba(0,0,0,0.35);
}

h2{
    text-align:center;
    margin-bottom:25px;
    color:#c4b5fd;
    font-size:30px;
}

table{
    width:100%;
    border-collapse:collapse;
    border-radius:12px;
    overflow:hidden;
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
    background:#111827;
    color:#e5e7eb;
    border-bottom:1px solid #374151;
}

tr:hover td{
    background:#2a3344;
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

<h2>Top Product</h2>

<table>

<tr>
<th>ID</th>
<th>Product Name</th>
<th>Category</th>
<th>Price</th>
<th>Quantity</th>
</tr>

<%
try{
    Connection con = DBConnection.getConnection();

    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM products ORDER BY quantity DESC LIMIT 1"
    );

    ResultSet rs = ps.executeQuery();

    while(rs.next()){
%>

<tr>
<td><%= rs.getInt("id") %></td>
<td><%= rs.getString("name") %></td>
<td><%= rs.getString("category") %></td>
<td><%= rs.getDouble("price") %></td>
<td><%= rs.getInt("quantity") %></td>
</tr>

<%
    }

    con.close();

}catch(Exception e){
    out.println("<tr><td colspan='5'>" + e + "</td></tr>");
}
%>

</table>

<div class="back">
<a href="index.jsp">← Back to Dashboard</a>
</div>

</div>

</body>
</html>