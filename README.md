# MarkManagement_Pooja-KR-4AL22CS101-
MarkWebApp

📘 Project Purpose

MarkWebApp is a Java-based web application designed to manage student examination marks. It provides functionality to:

Add, update, delete, and display student mark records

Generate various reports based on student performance

🗂️ Database Structure
The application uses a single table named StudentMarks:
CREATE TABLE StudentMarks (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Subject VARCHAR(50),
    Marks INT,
    ExamDate DATE
);
🔧 Modules & Functionalities

✅ Mark Management

MarkAdd – Add new student marks

MarkUpdate – Update existing student marks

MarkDelete – Delete student records

MarkDisplay – Display all records or search by StudentID

📊 Report Generation

Students with marks above a specified value

Students who scored in a specific subject

Top N students based on marks

🧱 Project Structure
MarkWebApp/
├── WebContent/
│   ├── index.jsp
│   ├── markadd.jsp
│   ├── markupdate.jsp
│   ├── markdelete.jsp
│   ├── markdisplay.jsp
│   ├── reports.jsp
│   ├── report_form.jsp
│   └── report_result.jsp
├── src/
│   ├── com/
│   ├── dao/
│   │   └── MarkDAO.java             
│   ├── model/
│   │   └── StudentMark.java          
│   └── servlet/
│       ├── AddMarkServlet.java       
│       ├── UpdateMarkServlet.java    
│       ├── DeleteMarkServlet.java   
│       ├── DisplayMarksServlet.java  
│       ├── ReportServlet.java        
│       └── ReportCriteriaServlet.java
└── WEB-INF/
    └── web.xml  
    
🚀 Getting Started

Import the project into an IDE (e.g., Eclipse or IntelliJ)

Set up your web server (e.g., Apache Tomcat)

Configure database connectivity in MarkDAO.java

Deploy the application and access it via index.jsp

📌 Notes

Ensure the database and StudentMarks table are created before running the application

You can modify web.xml for URL mappings and servlet configuration

Add validation as needed in JSPs and Servlets for production use
