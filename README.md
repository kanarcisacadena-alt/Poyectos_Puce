# 🍎 Atrapa las frutas

> ¡Atrapa la mayor cantidad de frutas posibles con tu canasta y evita juntar basura!

---

## 📝 Descripción

**Atrapa las frutas** es un juego 2D de estilo arcade desarrollado en el motor **LÖVE2D** usando el lenguaje **Lua**. El jugador controla una canasta en movimiento horizontal con el objetivo de recolectar frutas que caen del cielo para sumar puntos. Sin embargo, debes tener cuidado: si recolectas 3 objetos de basura (lata aplastada, cáscara de banana o papel arrugado), perderás la partida y el juego se reiniciará.

---

## 🚀 Características Principales

* **Mecánica clave:** Captura de objetos en caída libre con movimiento puramente horizontal.
* **Condición de derrota:** Límite de 10 fallos con basura recolectada (lata aplastada, cáscara de banana y papel arrugado).
* **Modos de juego:** Singleplayer (Un jugador).
* **Gestión de estado:** Funciones para iniciar y pausar la partida en cualquier momento.

---

## 🕹️ Cómo Jugar (Controles)

| Acción | Teclado |
| :--- | :--- |
| **Iniciar juego** | `Enter` |
| **Pausar / Reanudar** | `X` |
| **Mover a la izquierda** | Flecha Izquierda (`←`) |
| **Mover a la derecha** | Flecha Derecha (`→`) |

---

## 🛠️ Requisitos e Instalación

### Prerrequisitos
1. Tener instalado **Visual Studio Code**.
2. Descargar e instalar el motor **LÖVE2D** desde su página oficial: [https://love2d.org/](https://love2d.org/).

### Configuración del PATH en Windows
Para poder ejecutar el juego directamente desde la terminal de Visual Studio Code con el comando `love .`, debes agregar LÖVE a las variables de entorno de Windows:

1. Presiona la tecla `Windows` y busca **"Editar las variables de entorno del sistema"**.
2. Haz clic en el botón **Variables de entorno...**.
3. En la sección *Variables del sistema*, busca la variable `Path` y haz clic en **Editar...**.
4. Haz clic en **Nuevo** y añade la ruta de instalación de LÖVE (por defecto: `C:\Program Files\LOVE`).
5. Acepta los cambios y reinicia Visual Studio Code.

### Instalación y Ejecución

1. Clona el repositorio:
   ```bash
   git clone https://github.com/kanarcisacadena-alt/Poyectos_Puce.git

#### Ejecutarlo en el terminal de Visual Studio Code bajo el comando 

    love .
