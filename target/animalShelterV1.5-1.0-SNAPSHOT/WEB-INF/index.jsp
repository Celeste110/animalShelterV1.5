<%@ page import="entity.Animal" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: katherine_celeste
  Date: 9/13/16
  Time: 13:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Animal Shelter</title>
    <link rel="stylesheet" href="../css/main.css">
</head>


<body class="content">
<%--${animals}--%>
<header>
    <h1>Animal Shelter</h1>

    <div class="two_columns">
        List Animals | <a href="AddOrEditAnimal.jsp.jsp"> Add an Animal </a>
    </div>

    <h2 class="pageTitle">List Animals</h2>
    <h4>Search for an animal: </h4>

</header>

<menu>
    <input placeholder="Name">
    <select> name = "select"

        <% for (String type : (ArrayList<String>) request.getAttribute("typesList")) { %>
        <option value ="">
            <%= type %>
        </option>

    </select>
    <input type = "text" placeholder="id">
    <button name="button">Search</button>
</menu>

<div class="row">

    <img src="http://www.freeimages.com/download/file/848cc5f9f3b969cb864a83e305d57151/640x480">
    <p>
    <h2><a href="AnimalNote.jsp">Bob</a></h2>
    <strong>Type:</strong>Cat
    <br>
    <strong>Breed:</strong> Tabby
    <br>
    <strong>Description:</strong> Big fat and fuzzy
    <br>
    <strong>Notes:</strong> <a href="#">5 notes </a></div>
</p>

</div>

<div class="row">
    <img src="http://www.freeimages.com/download/file/76abaddde57868155441e4f99d686110/640x425">
    <p>
    <h2><a href="AnimalNote.jsp">Wanda</a></h2>
    <strong>Type:</strong>Dog
    <br>
    <strong>Breed:</strong>Bulldog
    <br>
    <strong>Description:</strong> A handsome beast
    <br>
    <strong>Notes:</strong> <a href="#">3 notes </a>

    </p>
</div>

<div class="row">
    <img src="http://www.freeimages.com/download/file/92a12e07767908a49a70c735dbb09776/640x480">
    <p>
    <h2><a href="AnimalNote.jsp">Peter Parker</a></h2>
    <strong>Type:</strong>Spider
    <br>
    <strong>Breed:</strong>Tarantula
    <br>
    <strong>Description:</strong>Seriously, who gets a pet spider?!
    <br>
    <strong>Notes:</strong> <a href="#">0 notes </a>

    </p>
</div>

<div class="row">
    <img src="http://www.freeimages.com/download/file/81a43f4876e30da344c323f94847f0f3/639x604">
    <p>
    <h2><a href="AnimalNote.jsp">Thor</a></h2>
    <strong>Type:</strong>Fish
    <br>
    <strong>Breed:</strong>Goldfish
    <br>
    <strong>Description:</strong>It's orange
    <br>
    <strong>Notes:</strong> <a href="#">1 note </a>

    </p>
</div>

</body>

</html>
