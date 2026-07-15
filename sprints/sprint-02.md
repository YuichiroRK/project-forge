# Sprint 02 - Resource Processing

**Estado:** 🟡 Planned

**Versión objetivo:** Alpha v0.0.2

**Duración:** 2 semanas

**Fecha inicio:** _(Completar)_

**Fecha fin:** _(Completar)_

---

# Objetivo

Expandir el gameplay de recolección incorporando nuevos recursos, herramientas básicas y el primer sistema de procesamiento de materiales.

Al finalizar este sprint, el jugador deberá ser capaz de obtener madera, carbón y minerales, procesarlos en un horno y producir lingotes.

Este sprint representa el primer paso hacia el sistema de herrería.

---

# Historia de Usuario

Como jugador...

- Quiero talar árboles para obtener madera.
- Quiero fabricar o conseguir un pico básico.
- Quiero obtener carbón.
- Quiero fundir minerales.
- Quiero producir mis primeros lingotes.

---

# Alcance

## Herramientas

Implementar las primeras herramientas.

- [ ] Pico
- [ ] Hacha

Cada herramienta deberá:

- Tener durabilidad.
- Poder utilizarse múltiples veces.
- Mostrar una animación básica.

No implementar reparación todavía.

---

## Nuevos Recursos

Agregar:

- [ ] Árbol
- [ ] Tronco
- [ ] Carbón

Los recursos deberán:

- Aparecer en el mundo.
- Poder recolectarse.
- Desaparecer al agotarse.

---

## Sistema de Durabilidad

Las herramientas deberán perder durabilidad al utilizarse.

Cuando llegue a cero:

- La herramienta dejará de funcionar.

No implementar reparación.

---

## Horno

Crear el primer horno funcional.

El jugador podrá interactuar con él.

Características:

- [ ] Colocar mineral.
- [ ] Colocar combustible.
- [ ] Iniciar fundición.
- [ ] Barra de progreso.
- [ ] Obtener lingote.

---

## Fundición

Implementar las primeras recetas temporales.

- [ ] Hierro + Carbón → Lingote de Hierro

Estas recetas serán reemplazadas posteriormente por el sistema definitivo de herrería.

---

## Inventario

Actualizar el sistema de Items.

Agregar:

- Herramientas.
- Lingotes.
- Carbón.
- Madera.

Mantener compatibilidad con el Sprint anterior.

---

## Sistema de Items

Extender el modelo.

Nuevos campos:

- Durability
- Max Durability
- Resource Type

---

## Mundo

Actualizar el mapa.

Agregar:

- Bosque pequeño.
- Zona rocosa.
- Área para el horno.

---

## UI

Agregar:

- Barra de durabilidad.
- Ventana del horno.
- Barra de progreso de fundición.

---

# Arte

Continuar utilizando placeholders.

No crear Pixel Art definitivo.

---

# Audio

Agregar únicamente efectos temporales.

- [ ] Golpe al árbol.
- [ ] Golpe a la roca.
- [ ] Horno encendido.

---

# Combate

Fuera del alcance.

---

# Crafting Avanzado

Fuera del alcance.

Todavía no se fabricarán armas.

---

# Online

Fuera del alcance.

---

# Base de Datos

Continuar utilizando almacenamiento local.

---

# Docker

Sin cambios.

---

# Definition of Done

El sprint estará terminado cuando sea posible:

✅ Cortar un árbol.

✅ Obtener madera.

✅ Obtener carbón.

✅ Extraer hierro.

✅ Colocar materiales en el horno.

✅ Fundir un lingote.

✅ Almacenar el lingote en el inventario.

Sin errores críticos.

---

# Riesgos

- Sobrecomplicar el horno.
- Empezar el sistema de herrería antes de tiempo.
- Introducir demasiados recursos nuevos.

---

# Entregables

- Sistema de herramientas.
- Árboles interactivos.
- Carbón.
- Horno.
- Fundición.
- Lingotes.
- Inventario actualizado.
- Build ejecutable.

---

# Commit esperado

Tag:

Alpha v0.0.2

---

# Notas

Este sprint no busca crear el sistema definitivo de crafting.

El objetivo es validar el flujo:

Recolectar → Procesar → Obtener materiales refinados.

La fabricación de armas será abordada en el siguiente sprint.

---

# Sprint Review

## ¿Qué salió bien?

_(Completar al finalizar el sprint)._

---

## ¿Qué salió mal?

_(Completar al finalizar el sprint)._

---

## ¿Qué aprendimos?

_(Completar al finalizar el sprint)._

---

## Cambios para el siguiente Sprint

_(Completar al finalizar el sprint)._

---

# Sprint Metrics

Duración estimada:
14 días

Duración real:
_(Completar)_

Historias completadas:
_(Completar)_

Tareas completadas:
_(Completar)_

Bugs encontrados:
_(Completar)_

Bugs críticos:
_(Completar)_

Deuda técnica:
_(Completar)_

---

# Technical Debt

_(Completar al finalizar el sprint)._

---

# Decisions Taken

_(Completar al finalizar el sprint)._