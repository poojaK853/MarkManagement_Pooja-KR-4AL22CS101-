package dao;

import model.StudentMark;

import java.sql.*;
import java.util.ArrayList;

import java.util.List;

public class MarkDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3307/test";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "";

    private static final String INSERT_MARK_SQL = "INSERT INTO StudentMarks (StudentID, StudentName, Subject, Marks, ExamDate) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_MARK_BY_ID = "SELECT * FROM StudentMarks WHERE StudentID = ?";
    private static final String SELECT_ALL_MARKS = "SELECT * FROM StudentMarks";
    private static final String UPDATE_MARK_SQL = "UPDATE StudentMarks SET StudentName=?, Subject=?, Marks=?, ExamDate=? WHERE StudentID=?";
    private static final String DELETE_MARK_SQL = "DELETE FROM StudentMarks WHERE StudentID=?";

    // Reports queries
    private static final String SELECT_MARKS_ABOVE = "SELECT * FROM StudentMarks WHERE Marks > ?";
    private static final String SELECT_BY_SUBJECT = "SELECT * FROM StudentMarks WHERE Subject = ?";
    private static final String SELECT_TOP_N = "SELECT * FROM StudentMarks ORDER BY Marks DESC LIMIT ?";

    protected Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Ensure driver loaded
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    // Add Mark
    public boolean addMark(StudentMark mark) {
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(INSERT_MARK_SQL)) {

            stmt.setInt(1, mark.getStudentID());
            stmt.setString(2, mark.getStudentName());
            stmt.setString(3, mark.getSubject());
            stmt.setInt(4, mark.getMarks());
            stmt.setDate(5, new java.sql.Date(mark.getExamDate().getTime()));

            return stmt.executeUpdate() > 0;

        } catch (SQLIntegrityConstraintViolationException e) {
            System.out.println("Duplicate StudentID: " + e.getMessage());
            return false;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get Mark by ID
    public StudentMark getMarkById(int id) {
        StudentMark mark = null;
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_MARK_BY_ID)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                mark = new StudentMark();
                mark.setStudentID(rs.getInt("StudentID"));
                mark.setStudentName(rs.getString("StudentName"));
                mark.setSubject(rs.getString("Subject"));
                mark.setMarks(rs.getInt("Marks"));
                mark.setExamDate(rs.getDate("ExamDate"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mark;
    }

    // Get All Marks
    public List<StudentMark> getAllMarks() {
        List<StudentMark> list = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_ALL_MARKS)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                StudentMark mark = new StudentMark();
                mark.setStudentID(rs.getInt("StudentID"));
                mark.setStudentName(rs.getString("StudentName"));
                mark.setSubject(rs.getString("Subject"));
                mark.setMarks(rs.getInt("Marks"));
                mark.setExamDate(rs.getDate("ExamDate"));
                list.add(mark);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Update Mark
    public boolean updateMark(StudentMark mark) {
        String sql = "UPDATE StudentMarks SET StudentName = ?, Subject = ?, Marks = ?, ExamDate = ? WHERE StudentID = ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, mark.getStudentName());
            ps.setString(2, mark.getSubject());
            ps.setInt(3, mark.getMarks());
            ps.setDate(4, new java.sql.Date(mark.getExamDate().getTime()));
            ps.setInt(5, mark.getStudentID());

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }



    // Delete Mark
    public boolean deleteMark(int studentID) {
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(DELETE_MARK_SQL)) {
            ps.setInt(1, studentID);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Report 1: Students with marks above threshold
    public List<StudentMark> getMarksAbove(int threshold) {
        List<StudentMark> list = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_MARKS_ABOVE)) {
            ps.setInt(1, threshold);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                StudentMark mark = new StudentMark();
                mark.setStudentID(rs.getInt("StudentID"));
                mark.setStudentName(rs.getString("StudentName"));
                mark.setSubject(rs.getString("Subject"));
                mark.setMarks(rs.getInt("Marks"));
                mark.setExamDate(rs.getDate("ExamDate"));
                list.add(mark);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Report 2: Students by Subject
    public List<StudentMark> getMarksBySubject(String subject) {
        List<StudentMark> list = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_BY_SUBJECT)) {
            ps.setString(1, subject);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                StudentMark mark = new StudentMark();
                mark.setStudentID(rs.getInt("StudentID"));
                mark.setStudentName(rs.getString("StudentName"));
                mark.setSubject(rs.getString("Subject"));
                mark.setMarks(rs.getInt("Marks"));
                mark.setExamDate(rs.getDate("ExamDate"));
                list.add(mark);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Report 3: Top N students
    public List<StudentMark> getTopNStudents(int n) {
        List<StudentMark> list = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_TOP_N)) {
            ps.setInt(1, n);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                StudentMark mark = new StudentMark();
                mark.setStudentID(rs.getInt("StudentID"));
                mark.setStudentName(rs.getString("StudentName"));
                mark.setSubject(rs.getString("Subject"));
                mark.setMarks(rs.getInt("Marks"));
                mark.setExamDate(rs.getDate("ExamDate"));
                list.add(mark);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}