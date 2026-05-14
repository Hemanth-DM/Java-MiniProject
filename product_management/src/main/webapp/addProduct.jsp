<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>

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
    display:flex;
    justify-content:center;
    align-items:center;
    color:white;
}

.container{
    width:420px;
    background:rgba(255,255,255,0.05);
    padding:35px;
    border-radius:18px;
    border:1px solid rgba(255,255,255,0.08);
    box-shadow:0 8px 20px rgba(0,0,0,0.35);
    backdrop-filter:blur(10px);
}

h2{
    text-align:center;
    color:#c4b5fd;
    margin-bottom:25px;
    font-size:28px;
}

label{
    display:block;
    margin-top:15px;
    margin-bottom:8px;
    color:#d1d5db;
    font-size:15px;
}

input[type="text"],
input[type="number"]{
    width:100%;
    padding:12px;
    border:none;
    outline:none;
    border-radius:10px;
    background:#1f2937;
    color:white;
    font-size:15px;
}

input[type="text"]:focus,
input[type="number"]:focus{
    border:1px solid #8b5cf6;
}

input[type="submit"]{
    width:100%;
    margin-top:25px;
    padding:13px;
    border:none;
    border-radius:10px;
    background:linear-gradient(90deg,#7c3aed,#9333ea);
    color:white;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

input[type="submit"]:hover{
    transform:translateY(-2px);
    box-shadow:0 0 15px rgba(139,92,246,0.6);
}

.back{
    text-align:center;
    margin-top:18px;
}

.back a{
    color:#9ca3af;
    text-decoration:none;
}

.back a:hover{
    color:white;
}
</style>

</head>
<body>

<div class="container">

<h2>Add Product</h2>

<form action="<%=request.getContextPath()%>/ProductServlet" method="post">

<input type="hidden" name="action" value="add">

<label>Category</label>
<input type="text" name="category">

<label>Product Name</label>
<input type="text" name="name">

<label>Price</label>
<input type="number" step="0.01" name="price">

<label>Quantity</label>
<input type="number" name="quantity">

<input type="submit" value="Add Product">

</form>

<div class="back">
<a href="index.jsp">← Back to Dashboard</a>
</div>

</div>

</body>
</html>