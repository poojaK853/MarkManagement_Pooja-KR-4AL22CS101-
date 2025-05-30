<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Generate Reports</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            max-width: 600px;
            margin: 50px auto;
            padding: 25px;
            background: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            color: #333;
        }
        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-weight: 600;
        }
        label {
            font-weight: 600;
            display: block;
            margin-bottom: 10px;
            font-size: 1rem;
            color: #34495e;
        }
        input[type="radio"] {
            margin-right: 8px;
            cursor: pointer;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px 12px;
            margin: 10px 0 25px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }
        input[type="text"]:focus {
            border-color: #3498db;
            outline: none;
        }
        input[type="submit"] {
            background-color: #3498db;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.1rem;
            font-weight: 600;
            transition: background-color 0.3s ease;
            display: block;
            margin: 0 auto;
        }
        input[type="submit"]:hover {
            background-color: #2980b9;
        }
        /* spacing for the radio buttons */
        form > label + input[type="radio"] {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <h2>Select Report Criteria</h2>
    <form action="reportCriteria" method="post">
        <label>Report Type:</label><br>
        <input type="radio" name="reportType" value="marksAbove" required /> Students with marks above<br>
        <input type="radio" name="reportType" value="subjectScores" /> Students who scored in subject<br>
        <input type="radio" name="reportType" value="topN" /> Top N students<br><br>

        <label>Value:</label>
        <input type="text" name="value" required /><br><br>

        <input type="submit" value="Generate Report" />
    </form>
</body>
</html>
