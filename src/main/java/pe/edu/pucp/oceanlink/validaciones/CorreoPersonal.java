package pe.edu.pucp.oceanlink.validaciones;

import java.util.Locale;

public final class CorreoPersonal {
    private CorreoPersonal() {}

    public static String normalizar(String valor, boolean obligatorio) {
        String correo = valor == null ? "" : valor.trim().toLowerCase(Locale.ROOT);
        if (correo.isEmpty() && !obligatorio) return null;
        if (correo.length() > 254 || !correo.matches("[a-z0-9._%+\\-]+@[a-z0-9](?:[a-z0-9\\-]*[a-z0-9])?(?:\\.[a-z0-9](?:[a-z0-9\\-]*[a-z0-9])?)+")
                || correo.startsWith(".") || correo.contains("..") || correo.contains(".@")) {
            throw new IllegalArgumentException("Ingresa un correo personal válido.");
        }
        return correo;
    }
}
