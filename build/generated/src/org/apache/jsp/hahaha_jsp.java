package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class hahaha_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!-- blog23:34-->\n");
      out.write("    <head>\n");
      out.write("        \n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=0\">\n");
      out.write("\n");
      out.write("        <link rel=\"shortcut icon\" type=\"image/x-icon\" href=\"assets/img/logo-dark.png\">\n");
      out.write("        <title>PHR - Manage Personal Health Record</title>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"assets/css/bootstrap.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"assets/css/font-awesome.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"assets/css/style.css\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"assets/css/customStyle.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js\"></script>\n");
      out.write("        <script src=\"//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js\"></script>\n");
      out.write("\n");
      out.write("<!-- CSS -->\n");
      out.write("<link rel=\"stylesheet\" href=\"//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css\"/>\n");
      out.write("<!-- Default theme -->\n");
      out.write("<link rel=\"stylesheet\" href=\"//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css\"/>\n");
      out.write("<!-- Semantic UI theme -->\n");
      out.write("<link rel=\"stylesheet\" href=\"//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css\"/>\n");
      out.write("<!-- Bootstrap theme -->\n");
      out.write("<link rel=\"stylesheet\" href=\"//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css\"/>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <style>\n");
      out.write("            .error {\n");
      out.write("                border-color: #FF0000 !important;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("                                <body>\n");
      out.write("                                   \n");
      out.write("                                    <div class=\"main-wrapper account-wrapper\">\n");
      out.write("                                        <form id=\"form\" action=\"parse\">\n");
      out.write("                                            <textarea id=\"jwtEn\" name=\"jwt\"></textarea>\n");
      out.write("                                            <textarea id=\"jwtDe\" name=\"out\"></textarea>\n");
      out.write("                                        <input type=\"submit\" value=\"parse\" />\n");
      out.write("                                    </form>\n");
      out.write("\n");
      out.write("                                    </div>\n");
      out.write("                                    <script src=\"assets/js/jquery-3.2.1.min.js\"></script>\n");
      out.write("                                    <script src=\"assets/js/popper.min.js\"></script>\n");
      out.write("                                    <script src=\"assets/js/bootstrap.min.js\"></script>\n");
      out.write("                                    <script src=\"assets/js/app.js\"></script>\n");
      out.write("                                    <script src=\"http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js\"></script>\n");
      out.write("                                    <script type=\"text/javascript\">\n");
      out.write("                                        $(document).ready(function () {\n");
      out.write("                                            alertify.alert('Ready!');\n");
      out.write("                                        });\n");
      out.write("                                    </script>\n");
      out.write("\n");
      out.write("                                </body>\n");
      out.write("\n");
      out.write("                                <!-- login23:12-->\n");
      out.write("                                </html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
