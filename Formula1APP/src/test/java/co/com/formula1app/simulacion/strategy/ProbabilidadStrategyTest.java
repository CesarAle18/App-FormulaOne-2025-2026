package co.com.formula1app.simulacion.strategy;

import co.com.model.Piloto;
import co.com.simulacion.strategy.ProbabilidadStrategy;
import org.junit.jupiter.api.Test;

import java.math.BigDecimal;
import java.util.*;

import static org.junit.jupiter.api.Assertions.*;

class ProbabilidadStrategyTest {

    @Test
    void testSimularResultadosListaNula() {
        ProbabilidadStrategy strategy = new ProbabilidadStrategy(Collections.emptyMap());
        List<Piloto> resultado = strategy.simularResultados(null);
        assertTrue(resultado.isEmpty());
    }

    @Test
    void testSimularResultadosListaVacia() {
        ProbabilidadStrategy strategy = new ProbabilidadStrategy(Collections.emptyMap());
        List<Piloto> resultado = strategy.simularResultados(Collections.emptyList());
        assertTrue(resultado.isEmpty());
    }

    @Test
    void testSimularResultadosUnPiloto() {
        Piloto p = new Piloto("Hamilton", "GBR", "44");
        p.setId(1L);
        Map<Long, BigDecimal> puntos = new HashMap<>();
        puntos.put(1L, new BigDecimal("25"));

        ProbabilidadStrategy strategy = new ProbabilidadStrategy(puntos);
        List<Piloto> resultado = strategy.simularResultados(List.of(p));

        assertEquals(1, resultado.size());
        assertSame(p, resultado.get(0));
    }

    @Test
    void testSimularResultadosMuestreoSinReemplazo() {
        Piloto p1 = new Piloto("Hamilton", "GBR", "44"); p1.setId(1L);
        Piloto p2 = new Piloto("Verstappen", "NED", "1"); p2.setId(2L);
        Piloto p3 = new Piloto("Leclerc", "MON", "16"); p3.setId(3L);

        Map<Long, BigDecimal> puntos = new HashMap<>();
        puntos.put(1L, new BigDecimal("25"));
        puntos.put(2L, new BigDecimal("18"));
        puntos.put(3L, new BigDecimal("15"));

        ProbabilidadStrategy strategy = new ProbabilidadStrategy(puntos, 42L, 1.0);
        List<Piloto> resultado = strategy.simularResultados(List.of(p1, p2, p3));

        assertEquals(3, resultado.size());
        assertEquals(3, new HashSet<>(resultado).size());
    }

    @Test
    void testSimularResultadosDeterministaConMismaSeed() {
        Piloto p1 = new Piloto("Hamilton", "GBR", "44"); p1.setId(1L);
        Piloto p2 = new Piloto("Verstappen", "NED", "1"); p2.setId(2L);

        Map<Long, BigDecimal> puntos = new HashMap<>();
        puntos.put(1L, new BigDecimal("25"));
        puntos.put(2L, new BigDecimal("18"));

        ProbabilidadStrategy s1 = new ProbabilidadStrategy(puntos, 123L, 1.0);
        ProbabilidadStrategy s2 = new ProbabilidadStrategy(puntos, 123L, 1.0);

        List<Piloto> r1 = s1.simularResultados(List.of(p1, p2));
        List<Piloto> r2 = s2.simularResultados(List.of(p1, p2));

        assertEquals(r1, r2);
    }

    @Test
    void testFloorPesoParaPilotosSinPuntos() {
        Piloto p1 = new Piloto("Hamilton", "GBR", "44"); p1.setId(1L);
        Piloto p2 = new Piloto("PilotoSinPuntos", "", "99"); p2.setId(2L);

        Map<Long, BigDecimal> puntos = new HashMap<>();
        puntos.put(1L, new BigDecimal("25"));
        puntos.put(2L, BigDecimal.ZERO);

        ProbabilidadStrategy strategy = new ProbabilidadStrategy(puntos, 42L, 0.5);
        List<Piloto> resultado = strategy.simularResultados(List.of(p1, p2));

        assertEquals(2, resultado.size());
    }

    @Test
    void testMapaPuntosNuloUsaVacio() {
        Piloto p = new Piloto("Hamilton", "GBR", "44"); p.setId(1L);

        ProbabilidadStrategy strategy = new ProbabilidadStrategy(null, 42L, 1.0);
        List<Piloto> resultado = strategy.simularResultados(List.of(p));

        assertEquals(1, resultado.size());
    }

    @Test
    void testFloorPesoMinimo0_1() {
        ProbabilidadStrategy strategy = new ProbabilidadStrategy(Collections.emptyMap(), null, -5.0);
        List<Piloto> resultado = strategy.simularResultados(Collections.emptyList());
        assertTrue(resultado.isEmpty());
    }

    @Test
    void testSumaTotalCeroUsaShuffle() {
        Piloto p1 = new Piloto("A", "", "1"); p1.setId(1L);
        Piloto p2 = new Piloto("B", "", "2"); p2.setId(2L);

        Map<Long, BigDecimal> puntos = new HashMap<>();
        puntos.put(1L, BigDecimal.ZERO);
        puntos.put(2L, BigDecimal.ZERO);

        ProbabilidadStrategy strategy = new ProbabilidadStrategy(puntos, 42L, 0.0);
        List<Piloto> resultado = strategy.simularResultados(List.of(p1, p2));

        assertEquals(2, resultado.size());
    }

    @Test
    void testConstructorSinSeed() {
        Piloto p = new Piloto("Hamilton", "GBR", "44"); p.setId(1L);
        Map<Long, BigDecimal> puntos = new HashMap<>();
        puntos.put(1L, new BigDecimal("25"));

        ProbabilidadStrategy strategy = new ProbabilidadStrategy(puntos);
        List<Piloto> resultado = strategy.simularResultados(List.of(p));

        assertEquals(1, resultado.size());
    }
}
