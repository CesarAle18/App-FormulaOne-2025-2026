package co.com.formula1app.config;
import co.com.config.ConfiguracionTemporada;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.*;

public class ConfiguracionTemporadaTest {

        @Test
        void testEsDespuesDeCongelacion() {
            LocalDate antes = LocalDate.of(2026, 5, 2);
            LocalDate igual = ConfiguracionTemporada.FECHA_CONGELACION;
            LocalDate despues = LocalDate.of(2026, 6, 1);

            assertFalse(ConfiguracionTemporada.esDespuesDeCongelacion(antes));
            assertFalse(ConfiguracionTemporada.esDespuesDeCongelacion(igual));
            assertTrue(ConfiguracionTemporada.esDespuesDeCongelacion(despues));
        }

        @Test
        void testPermiteIngresoManual() {
            LocalDate antes = LocalDate.of(2026, 5, 2);
            LocalDate igual = ConfiguracionTemporada.FECHA_CONGELACION;
            LocalDate despues = LocalDate.of(2026, 6, 1);

            assertFalse(ConfiguracionTemporada.permiteIngresoManual(antes));
            assertFalse(ConfiguracionTemporada.permiteIngresoManual(igual));
            assertTrue(ConfiguracionTemporada.permiteIngresoManual(despues));
        }

        @Test
        void testGetMensajeCongelacion() {
            String mensaje = ConfiguracionTemporada.getMensajeCongelacion();

            assertNotNull(mensaje);
            assertTrue(mensaje.contains("Fecha de congelacion del proyecto"));
            assertTrue(mensaje.contains("2026"));
        }

        @Test
        void testConstantesTemporada() {
            assertEquals(2025, ConfiguracionTemporada.TEMPORADA_2025);
            assertEquals(2026, ConfiguracionTemporada.TEMPORADA_2026);
            assertEquals(ConfiguracionTemporada.TEMPORADA_2026, ConfiguracionTemporada.TEMPORADA_ACTUAL);
        }

        @Test
        void testPermiteModificarResultado() {
            LocalDate antes = LocalDate.of(2026, 5, 2);
            LocalDate despues = LocalDate.of(2026, 6, 1);

            assertFalse(ConfiguracionTemporada.permiteModificarResultado(antes));
            assertTrue(ConfiguracionTemporada.permiteModificarResultado(despues));
        }

        @Test
        void testEsCarreraFutura() {
            LocalDate antes = LocalDate.of(2026, 5, 2);
            LocalDate igual = ConfiguracionTemporada.FECHA_CONGELACION;
            LocalDate despues = LocalDate.of(2026, 6, 1);

            assertFalse(ConfiguracionTemporada.esCarreraFutura(antes));
            assertFalse(ConfiguracionTemporada.esCarreraFutura(igual));
            assertTrue(ConfiguracionTemporada.esCarreraFutura(despues));
        }
    }
