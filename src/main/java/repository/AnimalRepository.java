package repository;

import entity.Animal;

import java.io.IOException;
import java.sql.*;

/**
 * Created by katherine_celeste on 8/20/16.
 */
public class AnimalRepository {

    private Connection conn;

    public AnimalRepository(String jdbcUrl) throws SQLException {
        this.conn = DriverManager.getConnection(jdbcUrl);
    }

    // This method returns a set of all animals
    public ResultSet listAnimal() throws SQLException {
        Statement stmt = conn.createStatement();
        return stmt.executeQuery("SELECT * FROM animal ORDER BY animal_id");
    }

    // Removes an animal from the database
    public void removeAnimal(int animalID) throws SQLException {

        // create a prepared statement
        PreparedStatement ps = conn.prepareStatement(

                "DELETE FROM animal " +
                        "WHERE animal_id = ?"
        );

        // set parameter values
        ps.setInt(1, animalID);

        // execute the query
        ps.executeUpdate();

    }

    // Creates a new Animal and adds it to the list
    public void createAnimal(String name, int species, String breed, String description) throws IOException, SQLException {
        // create a prepared statement
        PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO animal" +
                        "(animal_name, " +
                        "animal_type_id, " +
                        "breed, " +
                        "description) " +
                    "VALUES(?,?,?,?)"
        );

        // set parameter values
        ps.setString(1, name);
        ps.setInt(2, species);
        ps.setString(3, breed);
        ps.setString(4, description);

//        PreparedStatement pp = conn.prepareStatement(
//                "INSERT INTO note(note_text) VALUES (?)"
//        );

        // execute the query
       ps.executeUpdate();

    }

    public ResultSet getResultSet() throws SQLException {

        ResultSet resultSet = this.listAnimal();
        return resultSet;
    }


    public void modifyAnimal(Animal anAnimal) throws IOException, SQLException {
// accept animal as parameter and remove switch statements
        // have database auto-create animal_id (remove random num generator)

        PreparedStatement ps = conn.prepareStatement(
                "UPDATE animal SET animal_name = ?," +
                        "animal_type_id = ?," +
                        "breed = ?," +
                        "description = ?" +
                        "WHERE animal_id = ?"
        );

        // set parameter values
        ps.setString(1, anAnimal.getName());
        ps.setInt(2, anAnimal.getSpecies());
        ps.setString(3, anAnimal.getBreed());
        ps.setString(4, anAnimal.getDescription());
        ps.setInt(5, anAnimal.getID());

        // execute the query
        ps.executeUpdate();

    }
}
