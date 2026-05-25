package co.com.formula1app.simulacion.factory;

import co.com.model.Carrera;
import co.com.model.Piloto;
import co.com.model.Resultado;
import co.com.simulacion.factory.ResultadoBuilder;
import org.junit.jupiter.api.Test;

import java.math.BigDecimal;

import static org.junit.jupiter.api.Assertions.*;

class ResultadoBuilderTest {

    @Test
    void testBuildConValoresPorDefecto() {
        Resultado r = new ResultadoBuilder().build();
        assertNotNull(r);
        assertNull(r.getCarrera());
        assertNull(r.getPiloto());
        assertNull(r.getPosicionFinal());
        assertNull(r.getPuntosObtenidos());
    }

    @Test
    void testBuildConEncadenamientoCompleto() {
        Carrera c = new Carrera();
        c.setId(1L);
        Piloto p = new Piloto("Hamilton", "GBR", "44");
        p.setId(1L);

        Resultado r = new ResultadoBuilder()
                .carrera(c)
                .piloto(p)
                .posicion(1)
                .puntos(new BigDecimal("25"))
                .vueltas(50)
                .tiempo("1:30:00.000")
                .build();

        assertSame(c, r.getCarrera());
        assertSame(p, r.getPiloto());
        assertEquals(1, r.getPosicionFinal());
        assertEquals(new BigDecimal("25"), r.getPuntosObtenidos());
        assertEquals(50, r.getVueltas());
        assertEquals("1:30:00.000", r.getTiempo());
        assertFalse(r.getRetirado());
    }

    @Test
    void testBuildConRetirado() {
        Resultado r = new ResultadoBuilder()
                .posicion(20)
                .retirado(true, "Falla mecánica")
                .build();

        assertTrue(r.getRetirado());
        assertEquals("Falla mecánica", r.getMotivoRetiro());
    }

    @Test
    void testMetodosRetornanThis() {
        ResultadoBuilder builder = new ResultadoBuilder();
        assertSame(builder, builder.carrera(new Carrera()));
        assertSame(builder, builder.piloto(new Piloto("A", "B", "C")));
        assertSame(builder, builder.posicion(1));
        assertSame(builder, builder.puntos(BigDecimal.TEN));
        assertSame(builder, builder.vueltas(10));
        assertSame(builder, builder.retirado(false, null));
        assertSame(builder, builder.tiempo("1:00:00"));
    }

    @Test
    void testBuildRetiradoSinMotivo() {
        Resultado r = new ResultadoBuilder()
                .retirado(true, null)
                .build();
        assertTrue(r.getRetirado());
        assertNull(r.getMotivoRetiro());
    }

    @Test
    void testBuildParcial() {
        Carrera c = new Carrera();
        c.setId(10L);

        Resultado r = new ResultadoBuilder()
                .carrera(c)
                .posicion(5)
                .build();

        assertSame(c, r.getCarrera());
        assertEquals(5, r.getPosicionFinal());
        assertNull(r.getPiloto());
        assertNull(r.getTiempo());
    }
}
