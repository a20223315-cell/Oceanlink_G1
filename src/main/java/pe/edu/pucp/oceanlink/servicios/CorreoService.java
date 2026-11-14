package pe.edu.pucp.oceanlink.servicios;



import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.nio.charset.StandardCharsets;
import java.util.Properties;

import jakarta.mail.MessagingException;
import jakarta.mail.Session;

import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;



public final class CorreoService {
    private CorreoService() { }

    public static void enviarCredenciales(String destinatario, String nombreCompleto,
            String codigoUsuario, String correoCorporativo, String contrasenaTemporal)
            throws MessagingException {
        String host = requerido("SMTP_HOST");
        String puerto = System.getenv().getOrDefault("SMTP_PORT", "587");
        String usuario = requerido("SMTP_USER");
        String clave = requerido("SMTP_PASSWORD");
        String remitente = System.getenv().getOrDefault("SMTP_FROM", usuario);
        String urlLogin = System.getenv().getOrDefault("APP_LOGIN_URL",
                "http://localhost:8080/oceanlink/LoginServlet");

        Properties propiedades = new Properties();
        propiedades.put("mail.smtp.auth", "true");
        propiedades.put("mail.smtp.starttls.enable", "true");
        propiedades.put("mail.smtp.starttls.required", "true");
        propiedades.put("mail.smtp.host", host);
        propiedades.put("mail.smtp.port", puerto);
        propiedades.put("mail.smtp.connectiontimeout", "10000");
        propiedades.put("mail.smtp.timeout", "10000");
        propiedades.put("mail.smtp.writetimeout", "10000");

        Session sesion = Session.getInstance(propiedades, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(usuario, clave);
            }
        });

        MimeMessage mensaje = new MimeMessage(sesion);
        mensaje.setFrom(new InternetAddress(remitente));
        mensaje.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destinatario, false));
        mensaje.setSubject("Bienvenido a OceanLink - Credenciales de acceso", StandardCharsets.UTF_8.name());

        String cuerpo = "Hola " + nombreCompleto + ",\n\n"
                + "Tu cuenta de OceanLink ha sido creada. Estos son tus datos de acceso:\n\n"
                + "Código de usuario: " + codigoUsuario + "\n"
                + "Correo corporativo: " + correoCorporativo + "\n"
                + "Contraseña temporal: " + contrasenaTemporal + "\n\n"
                + "Ingresa desde: " + urlLogin + "\n\n"
                + "Tu cuenta está pendiente de activación. Podrás iniciar sesión cuando el administrador active tu cuenta.\n\n"
                + "Saludos,\nEquipo OceanLink";
        mensaje.setText(cuerpo, StandardCharsets.UTF_8.name());
        Transport.send(mensaje);
    }

    private static String requerido(String variable) {
        String valor = System.getenv(variable);
        if (valor == null || valor.isBlank()) {
            throw new IllegalStateException("Falta configurar la variable de entorno " + variable + ".");
        }
        return valor.trim();
    }
}
