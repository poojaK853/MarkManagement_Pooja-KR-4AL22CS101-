<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Update Student Mark</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f9fb;
            color: #333;
            display: flex;
            justify-content: center;
            padding: 40px 20px;
        }
        .container {
            background: #fff;
            max-width: 500px;
            width: 100%;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.1);
        }
        h2 {
            color: #2c3e50;
            margin-bottom: 25px;
            text-align: center;
        }
        form label {
            display: block;
            font-weight: 600;
            margin-top: 15px;
        }
        form input[type="text"],
        form input[type="number"],
        form input[type="date"] {
            width: 100%;
            padding: 10px 12px;
            margin-top: 6px;
            border: 1.8px solid #ccc;
            border-radius: 6px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }
        form input[type="text"]:focus,
        form input[type="number"]:focus,
        form input[type="date"]:focus {
            border-color: #2980b9;
            outline: none;
        }
        form input[type="submit"] {
            margin-top: 25px;
            width: 100%;
            background-color: #2980b9;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-weight: 700;
            font-size: 1.1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        form input[type="submit"]:hover {
            background-color: #1f6391;
        }
        .message {
            text-align: center;
            font-weight: 600;
            margin-bottom: 15px;
        }
        .message.success {
            color: #27ae60;
        }
        .message.error {
            color: #c0392b;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Student Mark</h2>

        <%
            String error = (String) request.getAttribute("error");
            String message = (String) request.getAttribute("message");
            String studentId = request.getParameter("studentId") != null ? request.getParameter("studentId") : "";
            String studentName = request.getParameter("studentName") != null ? request.getParameter("studentName") : "";
            String subject = request.getParameter("subject") != null ? request.getParameter("subject") : "";
            String marks = request.getParameter("marks") != null ? request.getParameter("marks") : "";
            String examDate = request.getParameter("examDate") != null ? request.getParameter("examDate") : "";
        %>

        <% if (message != null) { %>
            <p class="message success"><%= message %></p>
        <% } %>

        <% if (error != null) { %>
            <p class="message error"><%= error %></p>
        <% } %>

        <form action="updateMark" method="post">
            <label for="studentId">Student ID:</label>
            <input type="number" name="studentId" value="<%= studentId %>" required />

            <label for="studentName">Student Name:</label>
            <input type="text" name="studentName" value="<%= studentName %>" required />

            <label for="subject">Subject:</label>
            <input type="text" name="subject" value="<%= subject %>" required />

            <label for="marks">Marks:</label>
            <input type="number" name="marks" value="<%= marks %>" required />

            <label for="examDate">Exam Date:</label>
            <input type="date" name="examDate" value="<%= examDate %>" required />

            <input type="submit" value="Update Mark" />
        </form>
    </div>
</body>
</html>
