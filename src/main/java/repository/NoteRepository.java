package repository;

import java.io.IOException;
import java.sql.*;

/**
 * Created by katherine_celeste on 8/31/16.
 */
public class NoteRepository {
    private Connection conn;

    public NoteRepository(String jdbcUrl) throws SQLException {
        this.conn = DriverManager.getConnection(jdbcUrl);
    }

    // list notes for a particular animal
    public ResultSet listNotes(int animalID) throws SQLException {

        PreparedStatement ps = conn.prepareStatement(
                "SELECT * FROM note WHERE animal_id = ?"
        );

        ps.setInt(1, animalID);

        return ps.executeQuery();

    }

    // Creates a new Note and adds it to the list
    public void createNote(String text, int num) throws IOException, SQLException {
        // create a prepared statement

        PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO note" +
                        "(animal_id," +
                        "note_text) " +
                        "VALUES(?, ?)"
        );

        // set parameter values
        ps.setInt(1, num);
        ps.setString(2, text);

        // execute the query
        ps.executeUpdate();
    }

    // Removes an animal from the database
    public void deleteNote(int noteID) throws SQLException {

        // create a prepared statement
        PreparedStatement ps = conn.prepareStatement(

                "DELETE FROM note " +
                        "WHERE note_id = ?"
        );

        // set parameter values
        ps.setInt(1, noteID);

        // execute the query
        ps.executeUpdate();

    }
}





