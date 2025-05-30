package servlet;

import dao.MarkDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/deleteMark")
public class DeleteMarkServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private MarkDAO dao;

    @Override
    public void init() {
        dao = new MarkDAO();
    }

    // Show delete form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("markdelete.jsp").forward(request, response);
    }

    // Process deletion
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Use "studentID" to match form parameter name
            int studentId = Integer.parseInt(request.getParameter("studentID"));

            boolean deleted = dao.deleteMark(studentId);
            HttpSession session = request.getSession();

            if (deleted) {
                session.setAttribute("message", "Record deleted successfully!");
            } else {
                session.setAttribute("message", "No record found for StudentID: " + studentId);
            }
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid input or error occurred.");
            request.getRequestDispatcher("markdelete.jsp").forward(request, response);
        }
    }
}
