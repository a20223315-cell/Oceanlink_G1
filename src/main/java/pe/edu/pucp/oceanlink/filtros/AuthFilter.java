package pe.edu.pucp.oceanlink.filtros;

import pe.edu.pucp.oceanlink.beans.Usuario;
import pe.edu.pucp.oceanlink.daos.UsuarioDAO;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

@WebFilter("/*")
public class AuthFilter implements Filter {
    private static final Map<String, String> CRUD = Map.of(
        "/UsuarioServlet", "ADMIN", "/EstacionServlet", "ADMIN", "/SegmentoServlet", "ADMIN",
        "/ClienteServlet", "CAPACITY", "/SolicitudServlet", "CAPACITY", "/ServicioServlet", "CAPACITY",
        "/IncidenciaServlet", "NETWORK", "/MantenimientoServlet", "MAINTENANCE");

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest r = (HttpServletRequest) request;
        HttpServletResponse s = (HttpServletResponse) response;
        String path = r.getServletPath();
        boolean dynamic = path.endsWith("Servlet") || path.endsWith(".jsp") || path.endsWith(".html") || path.equals("/");
        if (!dynamic) { chain.doFilter(r, s); return; }
        s.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
        s.setHeader("Pragma", "no-cache");
        s.setDateHeader("Expires", 0);
        if (path.equals("/login.jsp")) {
            s.sendRedirect(r.getContextPath() + "/LoginServlet");
            return;
        }
        if (path.equals("/LogoutServlet")) { chain.doFilter(r, s); return; }
        HttpSession session = r.getSession(false);
        Usuario user = session != null && session.getAttribute("usuarioSesion") instanceof Usuario u ? u : null;
        if (user != null && user.getId() > 0) {
            try {
                Usuario current = new UsuarioDAO().buscar(user.getId());
                if (current == null || current.getEstado() != 1 || current.getRolId() != user.getRolId()) {
                    session.invalidate();
                    user = null;
                }
            } catch (SQLException ex) {
                throw new ServletException("No se pudo comprobar la sesión", ex);
            }
        }
        if (path.equals("/LoginServlet")) { chain.doFilter(r, s); return; }
        if (user == null || user.getId() <= 0) {
            s.sendRedirect(r.getContextPath() + "/LoginServlet");
            return;
        }
        if (path.endsWith("Servlet") && !permitido(r, user.getRolCodigo())) {
            s.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        chain.doFilter(r, s);
    }

    private boolean permitido(HttpServletRequest r, String role) {
        String path = r.getServletPath(), action = Objects.toString(r.getParameter("action"), "lista");
        boolean read = r.getMethod().equals("GET") || r.getMethod().equals("HEAD");
        if (CRUD.containsKey(path)) {
            return CRUD.get(path).equals(role) || ("SUPERVISOR".equals(role) && read && action.equals("detalle")
                && Set.of("/IncidenciaServlet", "/MantenimientoServlet").contains(path));
        }
        return switch (path) {
            case "/PerfilServlet" -> true;
            case "/EstadoUsuarioServlet", "/CorreoUsuarioServlet" -> "ADMIN".equals(role);
            case "/RutasServlet" -> "CAPACITY".equals(role) && read;
            case "/ConsultaDetalleServlet" -> Set.of("CAPACITY", "NETWORK", "SUPERVISOR").contains(role) && read;
            case "/ReporteServlet" -> "SUPERVISOR".equals(role);
            case "/ConsultaServlet" -> read && switch (Objects.toString(r.getParameter("vista"), "general")) {
                case "general" -> Set.of("ADMIN", "SUPERVISOR").contains(role);
                case "capacidad", "historialCapacidad" -> Set.of("CAPACITY", "SUPERVISOR").contains(role);
                case "red", "afectados" -> Set.of("NETWORK", "SUPERVISOR").contains(role);
                case "incidencias", "mantenimientos", "historicos", "reportes" -> "SUPERVISOR".equals(role);
                default -> false;
            };
            case "/HistorialServlet" -> read && switch (Objects.toString(r.getParameter("tipo"), "incidencias")) {
                case "incidencias" -> Set.of("NETWORK", "SUPERVISOR").contains(role);
                case "mantenimientos" -> Set.of("MAINTENANCE", "SUPERVISOR").contains(role);
                default -> false;
            };
            case "/ImpactoServlet" -> read && ("incidencia".equals(r.getParameter("tipo"))
                ? Set.of("NETWORK", "SUPERVISOR").contains(role)
                : Set.of("MAINTENANCE", "SUPERVISOR").contains(role));
            default -> false;
        };
    }
}
