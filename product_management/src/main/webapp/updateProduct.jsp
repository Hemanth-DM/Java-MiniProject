<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Product</title>

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
    display:flex;
    justify-content:center;
    align-items:center;
    color:white;
}

.container{
    width:450px;
    background:#1f2937;
    padding:35px;
    border-radius:16px;
    box-shadow:0 10px 25px rgba(0,0,0,0.35);
}

h2{
    text-align:center;
    margin-bottom:25px;
    color:#c4b5fd;
    font-size:28px;
}

label{
    display:block;
    margin-top:14px;
    margin-bottom:8px;
    color:#d1d5db;
    font-size:15px;
}

input[type="text"],
input[type="number"]{
    width:100%;
    padding:12px;
    border:none;
    border-radius:10px;
    background:#111827;
    color:white;
    font-size:15px;
    outline:none;
}

input[type="text"]:focus,
input[type="number"]:focus{
    border:1px solid #8b5cf6;
}

input[type="submit"]{
    width:100%;
    margin-top:24px;
    padding:13px;
    border:none;
    border-radius:10px;
    background:#7c3aed;
    color:white;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

input[type="submit"]:hover{
    background:#6d28d9;
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

<h2>Update Product</h2>

<form action="<%=request.getContextPath()%>/ProductServlet" method="post">

<input type="hidden" name="action" value="update">

<label>Product ID</label>
<input type="number" name="id" required>

<label>Category</label>
<input type="text" name="category" required>

<label>Product Name</label>
<input type="text" name="name" required>

<label>Price</label>
<input type="number" step="0.01" name="price" required>

<label>Quantity</label>
<input type="number" name="quantity" required>

<input type="submit" value="Update Product">

</form>

<div class="back">
<a href="index.jsp">← Back to Dashboard</a>
</div>

</div>

</body>
</html>