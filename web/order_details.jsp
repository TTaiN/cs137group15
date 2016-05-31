<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.jsp.*" %>
<%@ page import="pkg.ConnectionInfo" %>
<%@ page import="pkg.DatabaseResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset='UTF-8'>
    <link type='text/css' rel='stylesheet' href='styles/style.css'>
    <title>Order Details</title>
</head>


<body>
<img class='logo' src='images/logo.png' alt='Logo'/>
<div class='container'>
    <ul>
        <li><a class='active' href='index.html'>Home</a></li>
        <li><a href='shop'>Shop</a></li>
        <li><a href='aboutus.html'>About Us</a></li>
        <li><a href='contactus.html'>Contact</a></li>
        <li><a href='checkout'>Cart/Checkout</a></li>
        <li><a href='checkoutdebug'>Cart/Checkout DEBUG</a></li>
    </ul>
</div>
<h1>Order Details</h1>
<table>
    <tr>
        <th>Product ID</th>
        <th>Name</th>
        <th>Image</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Subtotal</th>
    </tr>
</table>

<%!
    private void outputTableHeader(javax.servlet.jsp.JspWriter jspout) throws IOException{
        jspout.println("testing 123");
    }
%>

<p><% out.println("product number: " + request.getParameter("product_number"));%></p>
<p><%outputTableHeader(out);%></p>
<%
    String order_id = request.getParameter("order_id");

//    String customer_info_sql = "SELECT * FROM products WHERE product_number=" + request.getParameter("product_number")  + ";";
//    String customer_info_sql = "SELECT * FROM products WHERE product_number=1;";
    String customer_info_sql = "SELECT * FROM customer_info WHERE order_id=" + order_id + ";";
    String order_info_sql = "SELECT * FROM order_info WHERE order_id=" + order_id + ";";
    List<String> customer_info_fields = Arrays.asList("order_id", "order_time", "first_name", "last_name", "email", "phone_number", "address", "zipcode", "city", "state", "shipping_method", "credit_card");
    List<String> order_info_fields = Arrays.asList("order_id", "first_name", "last_name", "email", "phone_number", "address", "zipcode", "city", "state", "shipping_method", "credit_card");

    try {

        DatabaseResultSet dbrs = new DatabaseResultSet(customer_info_sql);

        while (dbrs.getResultSet().next()) {

            for (String field : customer_info_fields) {
                out.println("<p><b>" + field + ":</b> " + dbrs.getResultSet().getString(field) + "</p>");
            }
        }
    }
    catch (SQLException e) {
        e.printStackTrace();
    }
%>

</body>
</html>
