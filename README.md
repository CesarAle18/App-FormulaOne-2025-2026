# Formula1APP 

## 1. Descripción del Proyecto

Aplicación de consola en **Java 21** con **Maven** que utiliza **Jakarta Persistence (JPA 3.0)** con **Hibernate 6.4** y **MySQL 8.3**. Gestiona información de Fórmula 1: pilotos, constructores, circuitos, carreras, resultados y clasificaciones, además de un módulo de simulación de carreras basado en probabilidades.

## 2. Stack de Pruebas

| Herramienta | Versión | Propósito |
|---|---|---|
| JUnit 5 (Jupiter) | 5.11.0 | Framework principal de pruebas |
| Mockito | 5.11.0 | Mocking para pruebas unitarias |
| Maven Surefire Plugin | 3.2.5 | Ejecutor de pruebas |
| JaCoCo | 0.8.12 | Reportes de cobertura de código |

## 3. Resumen de Resultados

**240 pruebas ejecutadas — 0 fallos, 0 errores, 0 ignorados.**

| Categoría | Archivos | Pruebas |
|---|---|---|
| Modelo | 7 | 43 |
| DAO | 6 | 116 |
| Servicio | 3 | 62 |
| Configuración y Constantes | 2 | 12 |
| Simulación | 3 | 21 |
| Utilidades | 2 | 11 |
| **Total** | **23** | **240** |

---

## 4. Explicación Detallada por Archivo

---

### 4.1 Pruebas de Modelo (7 archivos, 43 pruebas)

Validan que las entidades JPA funcionen correctamente: constructores, getters/setters, relaciones bidireccionales, valores por defecto y `toString`.

#### `carreraModelTest` (5 pruebas)

Prueba la entidad `Carrera`:
- Creación mediante constructor vacío y constructor con parámetros
- Getters y setters de todos los atributos
- Métodos `addResultado` y `removeResultado` para la relación con `Resultado`
- Método `toString`

#### `circuitoModelTest` (4 pruebas)

Prueba la entidad `Circuito`:
- Constructor vacío y constructor con nombre
- Getters y setters de todos los atributos
- Inicialización de la lista de carreras (`carreras`)
- Relación con `Carrera`

#### `constructorModelTest` (6 pruebas)

Prueba la entidad `Constructor`:
- Constructor vacío y constructor con nombre y nacionalidad
- Getters y setters de todos los atributos
- Métodos `addPiloto` y `removePiloto` para la relación con `Piloto`
- Método `toString`

#### `pilotoModelTest` (6 pruebas)

Prueba la entidad `Piloto`:
- Constructor vacío y constructor con parámetros
- Getters y setters de todos los atributos
- Asignación de `Constructor` a `Piloto` y viceversa
- Inicialización de la lista de resultados (`resultados`)
- Método `toString`

#### `resultadomodelTest` (12 pruebas)

Prueba la clase `ResultadoDAO` usando **Mockito** con `MockedStatic` para simular `JPAUtil` y `JDBCUtil`:
- `findByCarrera` con datos existentes y con carrera inexistente
- `save` de resultado exitoso y simulación de error en transacción
- `getClasificacionPilotos` con datos y con temporada vacía
- `getClasificacionConstructores` con datos y con temporada vacía
- Manejo de `EntityManager` nulo

#### `resultadoSprintModelTest` (3 pruebas)

Prueba la entidad `ResultadoSprint`:
- Valores por defecto al crear instancia
- Getters y setters
- Método `toString`

#### `temporadaModelTest` (6 pruebas)

Prueba la entidad `Temporada`:
- Constructor vacío y constructor con año
- Getters y setters
- Métodos `addCarrera` y `removeCarrera` para la relación con `Carrera`
- Método `toString`

---

### 4.2 Pruebas de DAO (6 archivos, 116 pruebas)

Pruebas de integración contra una base de datos MySQL real. Crean datos de prueba con año `2099` y los limpian en `@AfterAll`.

#### `CarreraDAOTest` (18 pruebas)

Prueba `CarreraDAO`:
- Guardar carrera y verificar generación de ID
- `findById`, `findByTemporada`, `findByNombreGp`
- Actualizar nombre de carrera
- `count` y `findAll`
- Eliminar carrera existente
- `findById` con ID inexistente
- Eliminar carrera inexistente (debe devolver `false`)
- Simulación de errores en `save`, `update`, `delete`, `count` mediante clases anónimas
- `findByNombreGp` sin resultados y con entrada nula/vacía
- Guardar con datos inválidos (`null`)
- Fallo de transacción en delete

#### `CircuitoDAOTest` (22 pruebas)

Prueba `CircuitoDAO`:
- Guardar circuito y verificar ID
- `findById`, `findByNombre`, `findByUbicacion`
- `findByTemporada` (circuitos usados en una temporada)
- Actualizar nombre y ubicación
- `count` y `findAll`
- Eliminar circuito y verificar eliminación
- Casos inexistentes en todas las búsquedas
- Simulación de errores en `save`, `update`, `delete`, `count`
- Búsquedas con nombre y ubicación nulos/vacíos
- Eliminar circuito con restricción de integridad referencial
- Rollback de transacción simulado

#### `ConstructorDAOTest` (21 pruebas)

Prueba `ConstructorDAO`:
- Guardar constructor y verificar ID
- `findById`, `findByNombre`, `findByNacionalidad`
- Actualizar nombre y nacionalidad
- `count` y `findAll`
- Eliminar constructor
- Casos inexistentes en todas las búsquedas
- Simulación de errores en `save`, `update`, `delete`, `count`
- Búsquedas con nombre y nacionalidad nulos/vacíos
- Restricción de integridad referencial al eliminar

#### `PilotoDAOTest` (23 pruebas)

Prueba `PilotoDAO`:
- Guardar piloto y verificar ID
- `findById`, `findByNombre`, `findByNacionalidad`, `findByDorsal`
- `findByConstructor` (pilotos de un constructor)
- Actualizar nombre, nacionalidad, dorsal
- `count` y `findAll`
- Eliminar piloto
- Casos inexistentes en todas las búsquedas
- Entradas nulas y vacías
- Simulación de errores en `save`, `update`, `delete`, `count`
- Guardar con datos inválidos
- Rollback de transacción

#### `ResultadoDAOTest` (11 pruebas)

Prueba `ResultadoDAO`:
- Guardar resultado y verificar ID
- `findById`, `findByCarrera`
- `getClasificacionPilotos` y `getClasificacionConstructores`
- Actualizar resultado
- Eliminar resultado
- Casos inexistentes
- Simulación de errores en `save`, `update`, `delete`

#### `TemporadaDAOTest` (21 pruebas)

Prueba `TemporadaDAO`:
- Guardar temporada y verificar ID
- `findById`, `findByAnio`
- `exists` por año
- `findByRangoAnios` (rango de años)
- `findMasReciente`
- Actualizar año
- `count`
- Eliminar temporada
- Estadísticas (total carreras, pilotos, constructores)
- Casos inexistentes
- Años inválidos (negativos, cero)
- `saveWithoutValidation`
- Simulación de errores en `save`, `update`, `delete`, `count`

---

### 4.3 Pruebas de Servicio (3 archivos, 62 pruebas)

Pruebas de integración que validan la lógica de negocio del servicio.

#### `F1ServicioTest` (24 pruebas)

Prueba `F1Servicio`:
- `getCarreras` para temporada 2025 (debe devolver lista no vacía)
- `getPilotos` (lista no vacía)
- `getResultadosCarrera` para una carrera existente
- `getClasificacionPilotos` y `getClasificacionConstructores` para 2025
- `getConstructores` y `getCircuitos`
- `getCarreraById` existente
- `getCarrerasConResultados` para 2025
- Casos frontera: temporada inexistente (9999), año inválido (-5), año cero, ID nulo, ID negativo, carrera inexistente

#### `ResultadoServiceTest` (22 pruebas)

Prueba `ResultadoService`:
- `ingresarResultado` exitoso
- `ingresarResultado` con error de base de datos
- `eliminarResultado` exitoso e inexistente
- `permiteIngresoManual` antes y después de la fecha de congelación
- `obtenerCarrerasEditables` con y sin datos
- `obtenerResultadosPorCarrera` con y sin datos
- `obtenerClasificacionCompletaPilotos` y `obtenerClasificacionCompletaConstructores`
- `obtenerPilotos` y `obtenerConstructores`
- Casos frontera: IDs inválidos, fechas límite, temporadas sin datos
- Rollback ante fallos en transacciones

#### `TemporadaServiceTest` (16 pruebas)

Prueba `TemporadaService`:
- `inicializarTemporada2025` (creación de la temporada base)
- `copiarEstructuraTemporada` de 2025 a 2026 (copia circuitos y carreras)
- `obtenerTemporada` por año existente e inexistente
- `obtenerTodasLasTemporadas`
- `existeTemporada` para años válidos e inválidos
- `obtenerProximoNumeroGP` para una temporada
- Manejo de errores: año nulo, temporada inexistente
- Rollback en caso de fallo durante inicialización

---

### 4.4 Pruebas de Configuración y Constantes (2 archivos, 12 pruebas)

#### `ConfiguracionTemporadaTest` (6 pruebas)

Prueba la clase `ConfiguracionTemporada`:
- `esDespuesDeCongelacion`: fechas antes, en y después de la fecha de congelación
- `permiteIngresoManual`: antes y después de la congelación
- `getMensajeCongelacion`: mensaje no nulo, contiene texto esperado y año
- `constantes de temporada`: valores correctos para `TEMPORADA_2025`, `TEMPORADA_2026`, `TEMPORADA_ACTUAL`
- `permiteModificarResultado`: antes y después de congelación
- `esCarreraFutura`: fechas antes, en y después de la congelación

#### `F1PointsSystemTest` (6 pruebas)

Prueba el sistema de puntuación oficial de F1:
- `calculatePoints` para posiciones válidas (1º=25, 2º=18, 10º=1)
- `calculatePoints` para posiciones inválidas (>10, 0, negativas = 0)
- `calculatePoints` con vuelta rápida (+1 punto extra en top 10)
- Vuelta rápida sin puntos si está fuera del top 10
- `getPointsForPosition` para todas las posiciones (1-10 y fuera de puntuación)
- `isPointScoringPosition` para posiciones dentro y fuera de la zona de puntos

---

### 4.5 Pruebas de Simulación (3 archivos, 21 pruebas)

#### `CarreraSimuladaFactoryTest` (5 pruebas)

Prueba `CarreraSimuladaFactory`:
- Crear carrera simulada con sufijo " (Simulado)" en el nombre
- Copia correcta del circuito original a la carrera simulada
- Asignación correcta de la temporada
- Verificación de que los datos base se mantienen (fecha, número de GP)
- Manejo de entradas nulas

#### `ResultadoBuilderTest` (6 pruebas)

Prueba el patrón Builder para `Resultado`:
- Construcción completa con todos los campos
- Encadenamiento de métodos (`set` que retornan `this`)
- Construcción parcial (solo campos obligatorios)
- Manejo del campo `retirado` (DNF)
- Verificación de que el builder crea objetos independientes
- Error al obtener resultado sin construir

#### `ProbabilidadStrategyTest` (10 pruebas)

Prueba la estrategia de simulación probabilística:
- Lista nula y lista vacía (debe retornar lista vacía)
- Un solo piloto (debe retornarlo siempre)
- Muestreo sin reemplazo (misma cantidad de pilotos, sin duplicados)
- Determinismo con misma semilla (`seed` igual produce mismo orden)
- `floorPeso` para pilotos sin puntos (peso mínimo)
- Mapa de puntos nulo (se trata como vacío)
- `floorPeso` mínimo de 0.1 (peso negativo se normaliza)
- Suma total cero usa `shuffle` (orden aleatorio sin pesos)
- Constructor sin semilla (genera aleatoriedad no determinista)

---

### 4.6 Pruebas de Utilidades (2 archivos, 11 pruebas)

#### `JDBCUtilTest` (7 pruebas)

Prueba `JDBCUtil`:
- Obtener conexión a la base de datos
- Cerrar conexión correctamente
- Cerrar `ResultSet`, `Statement` y `Connection`
- Rollback de transacción
- Estadísticas del pool de conexiones (HikariCP)
- Constructor privado (no instanciable)

#### `JPAUtilTest` (4 pruebas)

Prueba `JPAUtil`:
- `isAvailable`: el `EntityManagerFactory` está disponible
- Crear, usar y cerrar un `EntityManager`
- `executeInTransaction` con commit exitoso
- `executeInTransaction` con rollback ante excepción

---

## 5. Patrones y Técnicas Empleadas

### Ejecución Ordenada
Uso de `@TestMethodOrder(MethodOrderer.OrderAnnotation.class)` + `@Order(n)` en DAO y Service tests para garantizar el flujo secuencial (crear → consultar → actualizar → eliminar).

### Datos de Prueba Aislados
- Año `2099` para identificar datos de prueba en DAOs
- Prefijo `"JUnit"` en nombres de circuitos y carreras
- Limpieza automática en métodos `@AfterAll`

### Simulación de Errores
Clases anónimas que sobrescriben métodos DAO para lanzar excepciones controladas (`RuntimeException`) y verificar la robustez del sistema ante fallos.

### Mocking con Mockito
Uso de `MockedStatic<JPAUtil>` y `MockedStatic<JDBCUtil>` para simular capas de persistencia sin base de datos real en pruebas unitarias.

### Cobertura de Casos Frontera
Pruebas con valores `null`, listas vacías, IDs negativos, años inexistentes (9999), años inválidos (-5, 0), y entradas vacías (`""`).

---

## 6. Cómo Ejecutar las Pruebas

```bash
# Ejecutar todas las pruebas
mvn test

# Ejecutar pruebas con reporte de cobertura JaCoCo
mvn verify

# Ejecutar una clase de prueba específica
mvn test -Dtest=CarreraDAOTest

# Ejecutar un método específico
mvn test -Dtest=CarreraDAOTest#testGuardarCarrera

# Generar reporte JaCoCo (en target/site/jacoco/)
mvn clean verify site
```

**Importante:** Las pruebas de DAO y Servicio requieren una instancia de MySQL corriendo en `localhost:3306` con la base de datos `f1_manager` configurada según `persistence.xml`.

---

*Documentación generada a partir de 240 pruebas ejecutadas exitosamente.*
