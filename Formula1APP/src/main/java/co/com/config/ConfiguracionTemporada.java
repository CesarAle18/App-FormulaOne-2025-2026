package co.com.config;

import java.time.LocalDate;

public class ConfiguracionTemporada {

    public static final int TEMPORADA_2025 = 2025;
    public static final int TEMPORADA_2026 = 2026;
    public static final int TEMPORADA_ACTUAL = TEMPORADA_2026;

    public static final LocalDate FECHA_CONGELACION = LocalDate.of(2026, 5, 3);

    public static boolean esDespuesDeCongelacion(LocalDate fecha) {
        return fecha.isAfter(FECHA_CONGELACION);
    }

    public static boolean permiteIngresoManual(LocalDate fechaCarrera) {
        return esDespuesDeCongelacion(fechaCarrera);
    }

    public static boolean permiteModificarResultado(LocalDate fechaCarrera) {
        return esDespuesDeCongelacion(fechaCarrera);
    }

    public static boolean esCarreraFutura(LocalDate fechaCarrera) {
        return fechaCarrera.isAfter(FECHA_CONGELACION);
    }

    public static String getMensajeCongelacion() {
        return String.format(
                "Fecha de congelacion del proyecto: %s\n" +
                        "Ultimo evento con resultados: 2026-05-03 (Miami GP - Ronda 4)\n" +
                        "Solo se pueden gestionar carreras posteriores a esta fecha.",
                FECHA_CONGELACION
        );
    }
}