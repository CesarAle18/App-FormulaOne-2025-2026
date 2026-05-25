package co.com.formula1app.constantsTest;
import co.com.constants.F1PointsSystem;
import org.junit.jupiter.api.Test;

import java.math.BigDecimal;

import static org.junit.jupiter.api.Assertions.*;

public class F1PointsSystemTest {

        @Test
        void testCalculatePointsForValidPositions() {
            // 1er lugar debe tener 25 puntos
            assertEquals(BigDecimal.valueOf(25), F1PointsSystem.calculatePoints(1, false));

            // 2do lugar debe tener 18 puntos
            assertEquals(BigDecimal.valueOf(18), F1PointsSystem.calculatePoints(2, false));

            // 10mo lugar debe tener 1 punto
            assertEquals(BigDecimal.valueOf(1), F1PointsSystem.calculatePoints(10, false));
        }

        @Test
        void testCalculatePointsForInvalidPosition() {
            // Posiciones > 10 no dan puntos
            assertEquals(BigDecimal.ZERO, F1PointsSystem.calculatePoints(11, false));
            assertEquals(BigDecimal.ZERO, F1PointsSystem.calculatePoints(20, false));
            assertEquals(BigDecimal.ZERO, F1PointsSystem.calculatePoints(0, false));
            assertEquals(BigDecimal.ZERO, F1PointsSystem.calculatePoints(-3, false));
        }

        @Test
        void testCalculatePointsWithFastestLap() {
            // El piloto con vuelta rápida suma +1 punto si está en top 10
            BigDecimal puntosConFastLap = F1PointsSystem.calculatePoints(5, true);
            BigDecimal puntosSinFastLap = F1PointsSystem.calculatePoints(5, false);

            assertEquals(puntosSinFastLap.add(BigDecimal.ONE), puntosConFastLap);
        }

    @Test
    void testFastestLapNoPointsIfOutsideTop10() {
        assertEquals(BigDecimal.ZERO, F1PointsSystem.calculatePoints(11, true));
    }

    @Test
    void testGetPointsForPosition() {
        assertEquals(new BigDecimal("25"), F1PointsSystem.getPointsForPosition(1));
        assertEquals(new BigDecimal("18"), F1PointsSystem.getPointsForPosition(2));
        assertEquals(new BigDecimal("15"), F1PointsSystem.getPointsForPosition(3));
        assertEquals(new BigDecimal("12"), F1PointsSystem.getPointsForPosition(4));
        assertEquals(new BigDecimal("10"), F1PointsSystem.getPointsForPosition(5));
        assertEquals(new BigDecimal("8"), F1PointsSystem.getPointsForPosition(6));
        assertEquals(new BigDecimal("6"), F1PointsSystem.getPointsForPosition(7));
        assertEquals(new BigDecimal("4"), F1PointsSystem.getPointsForPosition(8));
        assertEquals(new BigDecimal("2"), F1PointsSystem.getPointsForPosition(9));
        assertEquals(new BigDecimal("1"), F1PointsSystem.getPointsForPosition(10));
        assertEquals(BigDecimal.ZERO, F1PointsSystem.getPointsForPosition(11));
        assertEquals(BigDecimal.ZERO, F1PointsSystem.getPointsForPosition(0));
        assertEquals(BigDecimal.ZERO, F1PointsSystem.getPointsForPosition(-1));
    }

    @Test
    void testIsPointScoringPosition() {
        assertTrue(F1PointsSystem.isPointScoringPosition(1));
        assertTrue(F1PointsSystem.isPointScoringPosition(10));
        assertFalse(F1PointsSystem.isPointScoringPosition(11));
        assertFalse(F1PointsSystem.isPointScoringPosition(0));
        assertFalse(F1PointsSystem.isPointScoringPosition(-1));
    }
}
