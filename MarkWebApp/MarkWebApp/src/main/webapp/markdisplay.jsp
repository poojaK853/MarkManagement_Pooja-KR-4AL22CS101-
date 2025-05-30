<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.StudentMark" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Display Student Marks</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f8;
            color: #333;
            padding: 40px 20px;
            display: flex;
            justify-content: center;
        }
        .container {
            background: white;
            max-width: 800px;
            width: 100%;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }
        h2 {
            margin-bottom: 25px;
            color: #2c3e50;
            text-align: center;
        }
        form {
            margin-bottom: 30px;
            text-align: center;
        }
        input[type="number"] {
            width: 200px;
            padding: 10px 12px;
            border: 1.8px solid #ccc;
            border-radius: 6px;
            font-size: 1rem;
            margin-right: 10px;
            transition: border-color 0.3s ease;
        }
        input[type="number"]:focus {
            border-color: #2980b9;
            outline: none;
        }
        input[type="submit"] {
            background-color: #2980b9;
            color: white;
            padding: 10px 25px;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #1f6391;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            padding: 10px 15px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #2980b9;
            color: white;
        }
        .message {
            text-align: center;
            font-weight: 600;
            color: #c0392b;
            margin-top: 15px;
        }
        .student-details p {
            font-size: 1.1rem;
            margin: 6px 0;
            text-align: center;
        }
        h3 {
            color: #34495e;
            margin-bottom: 15px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Display Student Marks</h2>

        <form action="displayMarks" method="get">
            <label for="studentID">Enter Student ID (leave blank to show all):</label>
            <input type="number" id="studentID" name="studentID" />
            <input type="submit" value="Search" />
        </form>

        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
            <p class="message"><%= message %></p>
        <%
            }
            StudentMark student = (StudentMark) request.getAttribute("student");
            if (student != null) {
        %>
            <h3>Student Record:</h3>
            <div class="student-details">
                <p><strong>ID:</strong> <%= student.getStudentID() %></p>
                <p><strong>Name:</strong> <%= student.getStudentName() %></p>
                <p><strong>Subject:</strong> <%= student.getSubject() %></p>
                <p><strong>Marks:</strong> <%= student.getMarks() %></p>
                <p><strong>Date:</strong> <%= student.getExamDate() %></p>
            </div>
        <%
            } else {
                List<StudentMark> allMarks = (List<StudentMark>) request.getAttribute("marksList");
                if (allMarks != null && !allMarks.isEmpty()) {
        %>
            <h3>All Student Records:</h3>
            <table>
                <thead>
                    <tr>
                        <th>ID</th><th>Name</th><th>Subject</th><th>Marks</th><th>Exam Date</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    for (StudentMark sm : allMarks) {
                %>
                    <tr>
                        <td><%= sm.getStudentID() %></td>
                        <td><%= sm.getStudentName() %></td>
                        <td><%= sm.getSubject() %></td>
                        <td><%= sm.getMarks() %></td>
                        <td><%= sm.getExamDate() %></td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        <%
                } else if (request.getParameter("studentID") != null) {
        %>
            <p class="message">No record found.</p>
        <%
                }
            }
        %>
    </div>
</body>
</html>
