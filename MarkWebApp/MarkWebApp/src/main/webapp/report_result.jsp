<%@ page import="java.util.List" %>
<%@ page import="model.StudentMark" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report Results</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            max-width: 900px;
            margin: 40px auto;
            padding: 20px;
            background-color: #fafafa;
            color: #333;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 25px;
            font-weight: 600;
        }
        p {
            text-align: center;
            font-size: 1.1rem;
        }
        p[style*="color:red"] {
            color: #e74c3c;
            font-weight: 600;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
            box-shadow: 0 1px 4px rgba(0,0,0,0.1);
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px 15px;
            text-align: center;
        }
        th {
            background-color: #3498db;
            color: white;
            font-weight: 700;
        }
        tr:nth-child(even) {
            background-color: #f2f6fc;
        }
        tr:hover {
            background-color: #d1e7ff;
        }
    </style>
</head>
<body>
    <h2><%= request.getAttribute("reportTitle") != null ? request.getAttribute("reportTitle") : "Report Results" %></h2>

    <%
        String message = (String) request.getAttribute("message");
        if (message != null) {
    %>
        <p style="color:red;"><%= message %></p>
    <%
        }

        List<StudentMark> reportData = (List<StudentMark>) request.getAttribute("reportData");
        if (reportData != null && !reportData.isEmpty()) {
    %>
        <table border="1">
            <tr>
                <th>ID</th><th>Name</th><th>Subject</th><th>Marks</th><th>Exam Date</th>
            </tr>
            <%
                for (StudentMark sm : reportData) {
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
        </table>
    <%
        } else {
    %>
        <p>No data found.</p>
    <%
        }
    %>
</body>
</html>
