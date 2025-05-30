<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Student Marks Management</title>
    <style>
        /* Reset some default */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f4f7fa;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
            padding: 40px 20px;
        }

        .container {
            background: white;
            max-width: 480px;
            width: 100%;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.12);
            padding: 30px 40px;
        }

        h1 {
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 25px;
            text-align: center;
        }

        ul {
            list-style: none;
        }

        ul li {
            margin-bottom: 18px;
        }

        ul li a {
            display: block;
            text-decoration: none;
            font-weight: 600;
            font-size: 1.1rem;
            color: #2980b9;
            padding: 12px 20px;
            border: 2px solid transparent;
            border-radius: 8px;
            background-color: #eaf4fc;
            transition: all 0.3s ease;
            box-shadow: 0 3px 6px rgba(41, 128, 185, 0.15);
        }

        ul li a:hover,
        ul li a:focus {
            background-color: #2980b9;
            color: white;
            box-shadow: 0 5px 15px rgba(41, 128, 185, 0.4);
            border-color: #1c5980;
            outline: none;
        }

        /* Responsive tweaks */
        @media (max-width: 520px) {
            body {
                padding: 20px 10px;
            }
            .container {
                padding: 25px 20px;
            }
            ul li a {
                font-size: 1rem;
                padding: 10px 15px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Student Marks Management System</h1>

        <ul>
            <li><a href="markadd.jsp">Add Student Mark</a></li>
            <li><a href="markupdate.jsp">Update Student Mark</a></li>
            <li><a href="markdelete.jsp">Delete Student Mark</a></li>
            <li><a href="displayMarks">Display/Search Student Marks</a></li>
            <li><a href="report_form.jsp">Generate Reports</a></li>
        </ul>
    </div>
</body>
</html>
