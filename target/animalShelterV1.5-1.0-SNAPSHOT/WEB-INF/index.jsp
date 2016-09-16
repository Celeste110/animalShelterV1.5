<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Animal" %>
<%@ page import="entity.AnimalType" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Animal Shelter</title>
    <link rel="stylesheet" href="../css/main.css">
</head>


<body class="content">

<header>
    <h1>Animal Shelter</h1>

    <div class="two_columns">
        <a href=""> List Animals </a> | <a href="/addOrEditPg"> Add an Animal </a>
    </div>

    <h2 class="pageTitle">List Animals</h2>
    <h4>Search for an animal: </h4>

</header>

<form action = "/" method = "get">

<menu>
    <input type = "text" name = "name" id="name" value="${name}" placeholder="Name">

    <select name = "typeId">
        <% for(AnimalType type: (ArrayList<AnimalType>)request.getAttribute("types"))

            {%>
                <option value = "<%= type.getAnimal_type_id()%>" <%= request.getAttribute("animal_type_id") != null && type.getAnimal_type_id() == (int)request.getAttribute("animal_type_id") ? "selected='true'" : ""%>>
                    <%= type.getSpecies()%>
                </option>
            <%}
            %>
    </select>

    <input type= "text" name="id" id="id" value="${id}" placeholder="Id">

    <button name="button">Search</button>
</menu>

</form>


<!-- main section of my page -->
<section>
    <% for(Animal animal : (ArrayList<Animal>)request.getAttribute("animals")) { %>


    <div class="row">
        <img src="../images/AnimalPics/Bob.jpg">

        <p>
            <h2><a href="/addOrEditPg?id= <%= animal.getID() %>"> <%=animal.getName()%> </a></h2>
            <strong>Type:</strong> <%= animal.getSpeciesStringFormat(animal.getSpecies())%> <br>  <%--MAKE SURE YOU GET SPECIES' string (using the num returned from .getSpecies()!!!!!!--%>
            <strong>Breed:</strong> <%= animal.getBreed()%> <br>
            <strong>Description:</strong> <%= animal.getDescription()%> <br>
            <strong>Notes:</strong> <a href="/note?id=<%= animal.getID() %>"> <%=animal.getNotes().size()%> notes...</a>
         </p>

    </div>

    <% } %>
</section>


</body>

</html>