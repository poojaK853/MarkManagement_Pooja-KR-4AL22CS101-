<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Add Student Mark</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f7f9fc;
            color: #333;
            display: flex;
            justify-content: center;
            padding: 40px 20px;
        }
        .container {
            background: white;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.1);
            max-width: 450px;
            width: 100%;
        }
        h2 {
            margin-bottom: 25px;
            text-align: center;
            color: #2c3e50;
        }
        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            color: #34495e;
        }
        input[type="text"],
        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 20px;
            border: 1.8px solid #ccc;
            border-radius: 6px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }
        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="date"]:focus {
            border-color: #2980b9;
            outline: none;
        }
        input[type="submit"] {
            width: 100%;
            background-color: #2980b9;
            color: white;
            padding: 12px 0;
            font-size: 1.1rem;
            font-weight: 700;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #1c5980;
        }
        .message {
            text-align: center;
            font-weight: 600;
            margin-top: 15px;
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
        <h2>Add Student Mark</h2>

        <form action="addMark" method="post">
            <label for="studentId">Student ID:</label>
            <input type="number" id="studentId" name="studentId" required />

            <label for="studentName">Student Name:</label>
            <input type="text" id="studentName" name="studentName" required />

            <label for="subject">Subject:</label>
            <input type="text" id="subject" name="subject" required />

            <label for="marks">Marks:</label>
            <input type="number" id="marks" name="marks" min="0" max="100" required />

            <label for="examDate">Exam Date:</label>
            <input type="date" id="examDate" name="examDate" required />

            <input type="submit" value="Add Mark" />
        </form>

        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
            <p class="message success"><%= message %></p>
             <script>
                alert("Successfully added");
            </script>
        <%
            }
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
            <p class="message error"><%= error %></p>
        <%
            }
        %>

        <%
            // Show popup alert if message is present
            if (message != null) {
        %>
            <script>
                alert("<%= message.replace("\"", "\\\"") %>");
            </script>
        <%
            }
        %>
    </div>
</body>
</html>
