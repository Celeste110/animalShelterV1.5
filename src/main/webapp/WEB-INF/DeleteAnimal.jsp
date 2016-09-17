<%@ page import="entity.AnimalType" %>
<%@ page import="java.util.ArrayList" %><%--
<%--
  Created by IntelliJ IDEA.
  User: win808mac
  Date: 9/16/16
  Time: 4:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Delete Animal</title>
</head>
<body>
<header>
    <h1>Delete Animal</h1>
    <div class="two_columns">
        List Animals | <a href="/addOrEditPg"> Add an Animal </a>
    </div>

    <h2 class="pageTitle">Search Animal To Delete</h2>
    <h4><sup>*</sup>indicates a required field</h4>

</header>

<form action="/delete" method="post">
    <section>
        <p>
            <label>
                Name<sup>*</sup>:
            </label>
        </p>
        <p>
            <label>
                Species<sup>*</sup>:
            </label>
        </p>

    </section>

    <section id = "column2">
        <input type="text" name="name" id="one" value="${animal.getName()}">


        <select name = "typeId" id="two">
            <% for(AnimalType type: (ArrayList<AnimalType>)request.getAttribute("types"))
            {%>
            <option value = "<%= type.getAnimal_type_id()%>" <%= request.getAttribute("animal_type_id") != null && type.getAnimal_type_id() == (int)request.getAttribute("animal_type_id") ? "selected='true'" : ""%>>
                <%= type.getSpecies()%>
            </option>
            <%} %>
        </select>
        <br>
        <button id="save" name="button">Delete Animal</button>
    </section>

</form>

</body>

</html>
