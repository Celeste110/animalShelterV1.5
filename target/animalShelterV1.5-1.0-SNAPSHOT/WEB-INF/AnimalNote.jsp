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
    <title>Animal Notes</title>
    <link rel="stylesheet" href="../css/note.css">
</head>

<header>
    <h1>Animal Shelter</h1>

    <p class="two_columns"><a href="index.jsp"> List Animals </a>
        |
        <a href="AddOrEditAnimal.jsp"> Add an Animal </a></p>

</header>

<section id="info">
    <p>
    <h2>Animal Notes</h2>
    <img src="http://www.freeimages.com/download/file/848cc5f9f3b969cb864a83e305d57151/640x480">
    <h2><a href="AnimalNote.jsp">Bob</a></h2>
    <strong>Type:</strong>Cat
    <br>
    <strong>Breed:</strong> Tabby
    <br>
    <strong>Description:</strong> Big fat and fuzzy
    </p>
</section>

<section>
    <table>
        <tr>
            <th>Date</th>
            <th>Note</th>
        </tr>
        <tr>
            <td>8/29/16</td>
            <td>Went to visit vet
                <button class="x">X</button>
            </td>
        </tr>
        <tr>
            <td>8/30/16</td>
            <td>Only eats filet mignon
                <button class="x">X</button>
            </td>
        </tr>
    </table>
</section>

<section>
    <label>Add a Note:</label><br>
    <textarea rows="8">This cat seriously needs a bath. This means we need to buy some chainmail.</textarea><br>
    <button id="addNote" name="button">Add Note</button>
</section>

</html>

