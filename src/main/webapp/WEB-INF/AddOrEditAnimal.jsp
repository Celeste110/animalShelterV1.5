<%@ page import="entity.AnimalType" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: katherine_celeste
  Date: 9/13/16
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Add / Edit an Animal</title>
    <link rel="stylesheet" href="../css/addOrEdit.css">
</head>

<body>

<header>
    <h1>Animal Shelter</h1>

    <div class="two_columns">
        List Animals | <a href="/addOrEditPg"> Add an Animal </a>
    </div>

    <h2 class="pageTitle">Add / Edit an Animal</h2>
    <h4><sup>*</sup>indicates a required field</h4>

</header>

<form action="/addOrEditPg" method="post">
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

    <p>
        <label>
            Breed<sup>*</sup>:
        </label>
    </p>

    <p>
        <label>
            Description<sup>*</sup>:
        </label>
    </p>
    <br><br><br><br><br><br>
    <p id="photo">Photo: </p>
</section>

<section id = "column2">
    <input type="text" name="name" id="one" value="${animal.getName()}">
    <%--<input id="one" type="text" value="Bob">--%>

    <select name = "typeId" id="two">
        <% for(AnimalType type: (ArrayList<AnimalType>)request.getAttribute("types"))

        {%>
        <option value = "<%= type.getAnimal_type_id()%>" <%= request.getAttribute("animal_type_id") != null && type.getAnimal_type_id() == (int)request.getAttribute("animal_type_id") ? "selected='true'" : ""%>>
            <%= type.getSpecies()%>
        </option>
        <%} %>
    </select>

    <%--<select id="two"> name = "select"--%>
        <%--<option>Cat</option>--%>
    <%--</select>--%>

    <input type="text" name="breed" id="three" value="${animal.getBreed()}">
    <%--<input id="three" type="text">--%>

    <textarea rows="9" name = "description" id="four" value="${animal.getDescription()}"> </textarea>

    <br>

    <input for="browse" class="save" type="file">
    <br>
    <button id="save" name="button">Save Animal</button>
</section>

</form>

</body>

</html>


