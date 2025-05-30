package servlet;

import dao.MarkDAO;
import model.StudentMark;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/displayMarks")
public class DisplayMarkServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private MarkDAO dao;

    @Override
    public void init() {
        dao = new MarkDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String studentIdParam = request.getParameter("studentID");

        if (studentIdParam != null && !studentIdParam.trim().isEmpty()) {
            try {
                int studentId = Integer.parseInt(studentIdParam);
                StudentMark student = dao.getMarkById(studentId);
                if (student != null) {
                    request.setAttribute("student", student);
                } else {
                    request.setAttribute("message", "No record found for Student ID: " + studentId);
                }
            } catch (NumberFormatException e) {
                request.setAttribute("message", "Invalid Student ID format.");
            }
        } else {
            // No ID given, show all marks
            List<StudentMark> marks = dao.getAllMarks();
            request.setAttribute("marksList", marks);
        }

        request.getRequestDispatcher("markdisplay.jsp").forward(request, response);
    }
}
