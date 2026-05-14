<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Product</title>

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
    width:430px;
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
    margin-bottom:10px;
    color:#d1d5db;
    font-size:16px;
}

input[type="text"]{
    width:100%;
    padding:13px;
    border:none;
    border-radius:10px;
    background:#111827;
    color:white;
    font-size:15px;
    outline:none;
}

input[type="text"]:focus{
    border:1px solid #8b5cf6;
}

input[type="submit"]{
    width:100%;
    margin-top:22px;
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

<h2>Search Product</h2>

<form action="<%=request.getContextPath()%>/ProductServlet" method="get">

<input type="hidden" name="action" value="search">

<label>Enter Product Name</label>
<input type="text" name="keyword" required>

<input type="submit" value="Search Product">

</form>

<div class="back">
<a href="index.jsp">← Back to Dashboard</a>
</div>

</div>

</body>
</html>