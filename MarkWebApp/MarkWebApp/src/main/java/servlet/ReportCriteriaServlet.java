package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/reportCriteria")
public class ReportCriteriaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String reportType = request.getParameter("reportType");
        String value = request.getParameter("value");
        HttpSession session = request.getSession();

        if (reportType == null || value == null || value.trim().isEmpty()) {
            session.setAttribute("message", "Please select a report type and provide a value.");
            response.sendRedirect("reports_form.jsp");
            return;
        }

        session.setAttribute("reportType", reportType);

        switch (reportType) {
            case "marksAbove":
                session.setAttribute("threshold", value.trim());
                break;
            case "subjectScores":
                session.setAttribute("subject", value.trim());
                break;
            case "topN":
                session.setAttribute("topN", value.trim());
                break;
            default:
                session.setAttribute("message", "Invalid report type selected.");
                response.sendRedirect("reports_form.jsp");
                return;
        }

        // Redirect to report servlet to show results
        response.sendRedirect("report");
    }
}
