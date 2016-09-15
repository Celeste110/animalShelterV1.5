<%--
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
        List Animals | <a href="AddOrEditAnimal.jsp.jsp"> Add an Animal </a>
    </div>

    <h2 class="pageTitle">Add / Edit an Animal</h2>
    <h4><sup>*</sup>indicates a required field</h4>

</header>

<section>
    <p>Name<sup>*</sup>: </p>
    <p>Species<sup>*</sup>: </p>
    <p>Breed: </p>
    <p>Description<sup>*</sup>: </p>
    <br><br><br><br><br><br>
    <p id="photo">Photo: </p>
</section>

<section id = "column2">
    <input id="one" type="text" value="Bob">
    <select id="two"> name = "select"
        <option>Cat</option>
    </select>
    <input id="three" type="text">

    <textarea rows="9" id="four">"Big fat and fuzzy"</textarea>

    <br>

    <input for="browse" class="save" type="file">
    <br>
    <button id="save" name="button">Save Animal</button>
</section>
<section>

</section>

</body>

</html>
