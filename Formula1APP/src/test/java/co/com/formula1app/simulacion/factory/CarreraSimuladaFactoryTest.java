package co.com.formula1app.simulacion.factory;

import co.com.model.Carrera;
import co.com.model.Circuito;
import co.com.model.Temporada;
import co.com.simulacion.factory.CarreraSimuladaFactory;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.*;

class CarreraSimuladaFactoryTest {

    @Test
    void testCrearCarreraSimuladaCreaNuevaInstancia() {
        Carrera base = new Carrera();
        base.setNombreGp("Monaco GP");
        Temporada temporada = new Temporada(2026);
        LocalDate fecha = LocalDate.of(2026, 6, 15);

        CarreraSimuladaFactory factory = new CarreraSimuladaFactory();
        Carrera resultado = factory.crearCarreraSimulada(base, temporada, fecha);

        assertNotNull(resultado);
        assertNotSame(base, resultado);
    }

    @Test
    void testNombreGpAgregaSufijoSimulada() {
        Carrera base = new Carrera();
        base.setNombreGp("Monaco GP");
        Temporada temporada = new Temporada(2026);

        CarreraSimuladaFactory factory = new CarreraSimuladaFactory();
        Carrera resultado = factory.crearCarreraSimulada(base, temporada, LocalDate.now());

        assertEquals("Monaco GP (Simulada)", resultado.getNombreGp());
    }

    @Test
    void testCopiaCircuitoYGpNumero() {
        Circuito circuito = new Circuito("Monaco", "Monte Carlo");
        circuito.setId(1L);

        Carrera base = new Carrera();
        base.setNombreGp("Monaco GP");
        base.setCircuito(circuito);
        base.setGpNumero(7);
        Temporada temporada = new Temporada(2026);

        CarreraSimuladaFactory factory = new CarreraSimuladaFactory();
        Carrera resultado = factory.crearCarreraSimulada(base, temporada, LocalDate.now());

        assertSame(circuito, resultado.getCircuito());
        assertEquals(7, resultado.getGpNumero());
    }

    @Test
    void testAsignaTemporadaYFecha() {
        Carrera base = new Carrera();
        base.setNombreGp("Monaco GP");
        Temporada temporada = new Temporada(2026);
        LocalDate fecha = LocalDate.of(2026, 7, 1);

        CarreraSimuladaFactory factory = new CarreraSimuladaFactory();
        Carrera resultado = factory.crearCarreraSimulada(base, temporada, fecha);

        assertSame(temporada, resultado.getTemporada());
        assertEquals(fecha, resultado.getFecha());
    }

    @Test
    void testCircuitoNuloNoLanzaError() {
        Carrera base = new Carrera();
        base.setNombreGp("Test GP");
        Temporada temporada = new Temporada(2026);

        CarreraSimuladaFactory factory = new CarreraSimuladaFactory();
        Carrera resultado = factory.crearCarreraSimulada(base, temporada, LocalDate.now());

        assertEquals("Test GP (Simulada)", resultado.getNombreGp());
        assertNull(resultado.getCircuito());
    }
}
