<%@ page import="entity.Animal" %>
<%@ page import="entity.AnimalNotes" %><%--
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
    <title>Animal Notes</title>
    <link rel="stylesheet" href="../css/note.css">
</head>

<header>
    <h1>Animal Shelter</h1>

    <p class="two_columns"><a href="/"> List Animals </a>
        |
        <a href="/addOrEditPg"> Add an Animal </a></p>

</header>

<% Animal animal = (Animal) request.getAttribute("animal"); %>

<section id="info">
    <p>
    <h2>Animal Notes</h2>
    <img src="../images/AnimalPics/dog_selfie.png">
    <h2><a href="/addOrEditPg?id=${animal.getID()}"><%=animal.getName()%></a></h2>
    <strong>Type:</strong><%=animal.getSpeciesStringFormat(animal.getSpecies())%>
    <br>
    <strong>Breed:</strong> <%=animal.getBreed()%>
    <br>
    <strong>Description:</strong> <%=animal.getDescription()%>
    </p>
</section>

<section>
    <table>
        <tr>
            <th>Date</th>
            <th>Note</th>
        </tr>

        <%
            if(animal.getNotes()!=null)
            {
            for(AnimalNotes note : animal.getNotes()){ %>
        <tr>
            <td>
                <%= note.getDate() %>
            </td>
            <td>
                <%= note.getText() %>
            </td>
            <td>
                <%--CREATE DELETENOTE servlet -> DOESNT EXIST YET!!!!!--%>
                <%--<a href="/deleteNote?animalId=<%= animal.getID() %>&noteId=<%= note.getID() %>"><img src="images/delete.png" alt="Delete" /></a>--%>
            </td>
        </tr>

        <% }} %>


        <%--<tr>--%>
            <%--<td>8/29/16</td>--%>
            <%--<td>Went to visit vet--%>
                <%--<button class="x">X</button>--%>
            <%--</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>8/30/16</td>--%>
            <%--<td>Only eats filet mignon--%>
                <%--<button class="x">X</button>--%>
            <%--</td>--%>
        <%--</tr>--%>
    </table>
</section>

<section>
    <form action="/note" method="post">

        <%
            {%>
            <label>Add a Note:</label><br>
            <textarea rows="8" name="note"></textarea><br>
            <button id="addNote" name="button">Add Note</button>
        <%}
    %>
        <%--value="${animal.getText()}--%>
    </form>


</section>

</html>

