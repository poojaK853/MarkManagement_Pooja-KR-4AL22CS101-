<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Delete Student Mark</title>
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
            max-width: 400px;
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
        input[type="number"] {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 20px;
            border: 1.8px solid #ccc;
            border-radius: 6px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }
        input[type="number"]:focus {
            border-color: #c0392b;
            outline: none;
        }
        input[type="submit"] {
            width: 100%;
            background-color: #c0392b;
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
            background-color: #962d22;
        }
        .message {
            text-align: center;
            font-weight: 600;
            margin-top: 15px;
            color: #c0392b;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Delete Student Mark</h2>

        <form action="deleteMark" method="post">
            <label for="studentID">Student ID:</label>
            <input type="number" id="studentID" name="studentID" required />

            <input type="submit" value="Delete Mark" />
        </form>

        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
            <p class="message"><%= message %></p>
        <%
            }
        %>
    </div>
</body>
</html>
