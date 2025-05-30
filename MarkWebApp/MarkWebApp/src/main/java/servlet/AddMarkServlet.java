package servlet;

import dao.MarkDAO;
import model.StudentMark;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/addMark")
public class AddMarkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    private MarkDAO dao;

    @Override
    public void init() {
        dao = new MarkDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            String studentName = request.getParameter("studentName");
            String subject = request.getParameter("subject");
            int marks = Integer.parseInt(request.getParameter("marks"));
            String examDateStr = request.getParameter("examDate");

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date examDate = sdf.parse(examDateStr);

            StudentMark mark = new StudentMark(studentId, studentName, subject, marks, examDate);
            boolean added = dao.addMark(mark);

            if (added) {
                HttpSession session = request.getSession();
                session.setAttribute("message", "Record added successfully!");
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("error", "Failed to add record. StudentID might already exist.");
                request.setAttribute("mark", mark);
                request.getRequestDispatcher("markadd.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: Invalid input or StudentID already exists.");
            request.getRequestDispatcher("markadd.jsp").forward(request, response);
        }
    }
}