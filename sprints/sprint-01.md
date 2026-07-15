# Sprint 01 - First Playable Prototype

**Estado:** 🟡 Planned

**Versión objetivo:** Alpha 0.0.1

**Duración:** 2 semanas

**Fecha inicio:** _(Completar)_

**Fecha fin:** _(Completar)_

---

# Objetivo

Construir la primera versión jugable de **Project Forge**.

Al finalizar este sprint, el jugador deberá poder explorar un pequeño mapa, recolectar recursos y almacenarlos en un inventario.

Este sprint busca validar el núcleo técnico del proyecto.

No se desarrollarán sistemas complejos como combate, crafting o multijugador.

---

# Historia de Usuario

Como jugador...

- Quiero moverme libremente por el mapa.
- Quiero encontrar recursos.
- Quiero recolectarlos.
- Quiero almacenarlos en un inventario.

---

# Alcance

## Movimiento

- [ ] Movimiento en 8 direcciones
- [ ] Cámara siguiendo al jugador
- [ ] Colisiones
- [ ] Animación Idle
- [ ] Animación Walk

---

## Mundo

Crear un mapa pequeño de pruebas.

Debe contener:

- [ ] Pasto
- [ ] Agua
- [ ] Rocas
- [ ] Algunas decoraciones

No dedicar tiempo al arte definitivo.

Se utilizarán assets temporales (placeholder).

---

## Recursos

Implementar únicamente:

- [ ] Piedra
- [ ] Hierro

Cada recurso debe:

- Poder aparecer en el mapa.
- Poder ser recolectado.
- Desaparecer al ser recolectado.

---

## Sistema de Interacción

Implementar una interacción básica.

Acción:

Presionar **E** cerca del recurso.

Resultado:

- Barra de progreso.
- Animación.
- El recurso desaparece.
- El item entra al inventario.

---

## Inventario

Implementar un inventario funcional.

Características:

- [ ] Grid simple
- [ ] Stack de objetos
- [ ] Abrir/Cerrar con TAB
- [ ] Mostrar cantidad

No implementar aún:

- Drag & Drop
- Equipamiento
- Tooltips
- Peso
- Filtros

---

## Sistema de Items

Crear la primera versión del sistema de Items.

Campos mínimos:

- UUID
- Name
- Type
- Stackable
- Max Stack

El sistema debe ser reutilizable para futuras armas, herramientas y materiales.

---

## Guardado

Implementar un sistema de guardado local.

Guardar:

- Inventario

No guardar:

- Posición
- Mundo
- NPCs

---

# Arte

Todo el arte será temporal.

No invertir tiempo en Pixel Art definitivo.

Utilizar placeholders o assets gratuitos.

---

# Audio

No implementar.

---

# Combate

Fuera del alcance.

---

# Crafting

Fuera del alcance.

---

# Online

Fuera del alcance.

---

# NPC

Fuera del alcance.

---

# Base de Datos

No utilizar todavía.

Toda la información puede almacenarse localmente.

---

# Docker

No es obligatorio utilizar Docker durante este sprint.

Docker será utilizado cuando exista el backend.

---

# Definition of Done

El sprint estará terminado cuando sea posible:

✅ Abrir el juego.

✅ Aparecer en el mapa.

✅ Caminar.

✅ Chocar correctamente con el escenario.

✅ Encontrar una roca.

✅ Recolectarla.

✅ Obtener Piedra o Hierro.

✅ Abrir el inventario.

✅ Ver los materiales almacenados.

Sin errores críticos.

---

# Riesgos

- Sobreestimar el alcance.
- Invertir demasiado tiempo en gráficos.
- Comenzar sistemas que no pertenecen a este sprint.

---

# Entregables

- Proyecto Godot funcionando.
- Primer mapa de pruebas.
- Jugador controlable.
- Sistema básico de Items.
- Inventario funcional.
- Sistema de recolección.
- Build ejecutable.

---

# Commit esperado

Tag:

Alpha v0.0.1

---

# Notas

Durante este sprint se prioriza **tener algo jugable** sobre tener código perfecto.

Cualquier mejora visual o funcional deberá posponerse si compromete la entrega.

El objetivo es validar que el gameplay base es sólido antes de comenzar el desarrollo del sistema de crafting.

# Sprint Review

## ¿Qué salió bien?

...

## ¿Qué salió mal?

...

## ¿Qué aprendimos?

...

## Cambios para el siguiente Sprint

...