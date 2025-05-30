package servlet;

import dao.MarkDAO;
import model.StudentMark;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/report")
public class ReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private MarkDAO dao;

    @Override
    public void init() {
        dao = new MarkDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("reports_form.jsp");
            return;
        }

        String reportType = (String) session.getAttribute("reportType");
        List<StudentMark> results = null;

        try {
            if ("marksAbove".equals(reportType)) {
                String thresholdStr = (String) session.getAttribute("threshold");
                if (thresholdStr != null) {
                    int threshold = Integer.parseInt(thresholdStr);
                    results = dao.getMarksAbove(threshold);
                    request.setAttribute("reportTitle", "Students scoring above " + threshold);
                }
            } else if ("subjectScores".equals(reportType)) {
                String subject = (String) session.getAttribute("subject");
                if (subject != null) {
                    results = dao.getMarksBySubject(subject);
                    request.setAttribute("reportTitle", "Students in Subject: " + subject);
                }
            } else if ("topN".equals(reportType)) {
                String topNStr = (String) session.getAttribute("topN");
                if (topNStr != null) {
                    int topN = Integer.parseInt(topNStr);
                    results = dao.getTopNStudents(topN);
                    request.setAttribute("reportTitle", "Top " + topN + " Students");
                }
            }

            if (results != null) {
                request.setAttribute("reportData", results); // match JSP attribute name
                request.getRequestDispatcher("report_result.jsp").forward(request, response);
            } else {
                session.setAttribute("message", "Invalid or missing report criteria.");
                response.sendRedirect("reports_form.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("message", "An error occurred while generating the report.");
            response.sendRedirect("reports_form.jsp");
        }
    }
}
