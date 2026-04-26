<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="product_management.DBConnection" %>

<%
int totalProducts = 0;
int totalCategories = 0;
String dbStatus = "Online";

try{
    Connection con = DBConnection.getConnection();

    PreparedStatement ps1 = con.prepareStatement(
        "SELECT COUNT(*) FROM products"
    );
    ResultSet rs1 = ps1.executeQuery();

    if(rs1.next()){
        totalProducts = rs1.getInt(1);
    }

    PreparedStatement ps2 = con.prepareStatement(
        "SELECT COUNT(DISTINCT category) FROM products"
    );
    ResultSet rs2 = ps2.executeQuery();

    if(rs2.next()){
        totalCategories = rs2.getInt(1);
    }

    con.close();

}catch(Exception e){
    dbStatus = "Offline";
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Dashboard</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Segoe UI, sans-serif;
}

body{
    background:linear-gradient(135deg,#0f0f0f,#111827);
    color:white;
}

/* Sidebar */
.sidebar{
    width:250px;
    height:100vh;
    position:fixed;
    background:#111111;
    padding:25px 18px;
    box-shadow:4px 0 15px rgba(0,0,0,0.4);
}

.logo{
    text-align:center;
    font-size:24px;
    font-weight:bold;
    color:#8b5cf6;
    margin-bottom:30px;
}

.sidebar a{
    display:block;
    color:#d1d5db;
    text-decoration:none;
    padding:14px 16px;
    margin:8px 0;
    border-radius:10px;
    transition:0.3s;
    font-size:17px;
}

.sidebar a:hover{
    background:#7c3aed;
    color:white;
    transform:translateX(5px);
}

/* Main */
.main{
    margin-left:250px;
    padding:30px;
}

.header{
    background:#1f2937;
    padding:20px;
    border-radius:14px;
    margin-bottom:25px;
}

.cards{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
    gap:20px;
}

.card{
    background:#1f2937;
    padding:25px;
    border-radius:14px;
    transition:0.3s;
}

.card:hover{
    transform:translateY(-5px);
}

.card h3{
    color:#c4b5fd;
    margin-bottom:10px;
}

.card p{
    font-size:28px;
    font-weight:bold;
}

.footer{
    margin-top:30px;
    color:#9ca3af;
    text-align:center;
}
</style>

</head>
<body>

<div class="sidebar">

<div class="logo">Dashboard</div>

<a href="addProduct.jsp">Add Product</a>
<a href="<%=request.getContextPath()%>/ProductServlet">View Product</a>
<a href="searchProduct.jsp">Search Product</a>
<a href="updateProduct.jsp">Update Product</a>
<a href="deleteProduct.jsp">Delete Product</a>
<a href="categoryReport.jsp">Category Report</a>
<a href="topProduct.jsp">Top Product</a>
<a href="priceReport.jsp">Price Report</a>

</div>

<div class="main">

<div class="header">
<h1>Product Management System</h1>
</div>

<div class="cards">

<div class="card">
<h3>Total Products</h3>
<p><%= totalProducts %></p>
</div>

<div class="card">
<h3>Categories</h3>
<p><%= totalCategories %></p>
</div>

<div class="card">
<h3>Features</h3>
<p>8</p>
</div>

<div class="card">
<h3>Database</h3>
<p><%= dbStatus %></p>
</div>

</div>

<div class="footer">
JSP | Servlet | JDBC | Tomcat 9
</div>

</div>

</body>
</html>