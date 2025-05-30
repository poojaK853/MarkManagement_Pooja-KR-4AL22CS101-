package servlet;

import dao.MarkDAO;
import model.StudentMark;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/updateMark")
public class UpdateMarkServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private MarkDAO dao;

    @Override
    public void init() {
        dao = new MarkDAO();
    }

    // Only POST here since no pre-fill on GET (or redirect GET to form)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Just forward to form
        request.getRequestDispatcher("markupdate.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String studentIdStr = request.getParameter("studentId");
            String studentName = request.getParameter("studentName");
            String subject = request.getParameter("subject");
            String marksStr = request.getParameter("marks");
            String examDateStr = request.getParameter("examDate");

            if(studentIdStr == null || studentIdStr.trim().isEmpty()) {
                request.setAttribute("error", "Student ID is required.");
                request.getRequestDispatcher("markupdate.jsp").forward(request, response);
                return;
            }

            int studentId = Integer.parseInt(studentIdStr);
            int marks = Integer.parseInt(marksStr);

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date examDate = sdf.parse(examDateStr);

            // Check if record exists
            StudentMark existing = dao.getMarkById(studentId);
            if (existing == null) {
                request.setAttribute("error", "No record found for Student ID: " + studentId);
                request.getRequestDispatcher("markupdate.jsp").forward(request, response);
                return;
            }

            StudentMark mark = new StudentMark(studentId, studentName, subject, marks, examDate);
            boolean updated = dao.updateMark(mark);

            if (updated) {
                request.setAttribute("message", "Record updated successfully!");
                request.getRequestDispatcher("markupdate.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Failed to update record.");
                request.getRequestDispatcher("markupdate.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid input or error occurred.");
            request.getRequestDispatcher("markupdate.jsp").forward(request, response);
        }
    }
}
