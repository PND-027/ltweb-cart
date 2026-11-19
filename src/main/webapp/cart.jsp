<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>
<h1>Your cart</h1>
<table>
    <tr>
        <th>Quantity</th>
        <th>Description</th>
        <th class="right">Price</th>
        <th class="right">Amount</th>
        <th>&nbsp;</th>
    </tr>
    <c:forEach var="item" items="${cart.items}">
    <tr>
        <td>
            <form action="cart" method="post">
                <input type="hidden" name="productCode"
                       value="<c:out value='${item.product.code}'/>">
                <input type="text" name="quantity"
                       value="<c:out value='${item.quantity}'/>" id="quantity">
                <input type="submit" value="Update">
            </form>
        </td>
        <td><c:out value="${item.product.description}"/></td>
        <td class="right">${item.product.priceCurrencyFormat}</td>
        <td class="right">${item.totalCurrencyFormat}</td>
        <td>
            <a href="cart?productCode=${item.product.code}&quantity=0">Remove Item</a>
        </td>
    </tr>
    </c:forEach>
</table>

<p><b>To change the quantity</b>, enter the new quantity
   and click on the Update button.</p>

<form action="cart" method="post">
    <input type="hidden" name="action" value="shop">
    <input type="submit" value="Continue Shopping">
</form>
<form action="cart" method="post">
    <input type="hidden" name="action" value="checkout">
    <input type="submit" value="Checkout">
</form>
</body>
</html>
