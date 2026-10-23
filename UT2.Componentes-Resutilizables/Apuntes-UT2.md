# UT2 · Componentes reutilizables

Apuntes de Desarrollo de Interfaces (2º DAM 2026-2027). Siguen el orden del temario oficial (*UT 2 Componentes reutilizables*: 1.1 a 1.3) y añaden el *Pequeño manual para conocer el inspector de Flutter*, el proyecto de clase `primer_widget` y la actividad 2.1 `crear_componente_reutilizable`.

> ✏️ **Corrección** = algo que quedó mal en el código o en las notas · ➕ **Ampliación** = no está en el temario, pero ayuda.

## Índice

1. [Componentes reutilizables](#1-componentes-reutilizables)
2. [Nuestro primer widget propio](#2-nuestro-primer-widget-propio)
3. [Organizar los componentes en archivos](#3-organizar-los-componentes-en-archivos)
4. [Proyecto de clase · `primer_widget`](#4-proyecto-de-clase-primer_widget)
5. [Actividad 2.1 · Crear componentes reutilizables](#5-actividad-21-crear-componentes-reutilizables)
6. [Flutter Inspector](#6-flutter-inspector)
7. [Chuleta](#chuleta)
8. [Preguntas para repasar](#preguntas-para-repasar)

---

## 1. Componentes reutilizables

Un **componente reutilizable** es una parte de la interfaz que **encapsula una estructura o un comportamiento** y que podemos usar en distintos sitios **sin volver a escribir su implementación**. En Flutter, un componente es simplemente **un widget creado por nosotros**.

| Ventaja | Qué significa |
|---|---|
| **Reutilización** | Escribimos el código una vez y lo usamos muchas veces |
| **Mantenimiento** | Los cambios se hacen en **un único lugar** |
| **Legibilidad** | La pantalla principal se entiende mejor (se lee `TarjetaAviso(...)` en vez de 15 líneas de `Card`, `Padding`, `Row`…) |
| **Consistencia** | Los elementos parecidos tienen siempre el mismo aspecto y comportamiento |
| **Pruebas** | Cada componente se puede comprobar por separado |

En la UT1 ya creamos widgets propios con `StatelessWidget` y `StatefulWidget` (sesión 7), pero siempre mostraban **lo mismo**. Lo nuevo de esta unidad es que el componente **recibe datos** desde fuera (propiedades + constructor) y que cada uno vive **en su propio archivo**.

---

## 2. Nuestro primer widget propio

### 2.1 Punto de partida: la interfaz sin componentes

Una tarjeta con un mensaje informativo, escrita directamente dentro de la pantalla:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mis avisos'),
        ),
        body: Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.info, color: Colors.blue),
                  SizedBox(width: 12),
                  Text('Recuerda guardar los cambios'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

```
MaterialApp
└── Scaffold
    ├── appBar: AppBar → Text
    └── body: Center
        └── Card                 ← esto es lo que vamos a extraer
            └── Padding
                └── Row
                    ├── Icon
                    ├── SizedBox
                    └── Text
```

Funciona, pero la tarjeta está **metida dentro de la pantalla principal**: si queremos tres avisos, hay que copiar y pegar todo el bloque tres veces.

### 2.2 Extraer el widget con el refactor de VS Code

> 💡 **¡Utiliza el refactor!** Coloca el cursor sobre `Card`, pulsa **Ctrl + .** (o la bombilla 💡) → **Extract Widget** → escribe el nombre **`TarjetaAviso`**.

VS Code crea la clase y sustituye el bloque por `TarjetaAviso()`:

```dart
class TarjetaAviso extends StatelessWidget {
  const TarjetaAviso({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.info, color: Colors.blue),
            SizedBox(width: 12),
            Text('Recuerda guardar los cambios'),
          ],
        ),
      ),
    );
  }
}
```

### 2.3 El constructor y `super.key`

Aparece algo que no habíamos visto: el **constructor**.

```dart
const TarjetaAviso({super.key});
```

- El **constructor** permite **crear instancias** (objetos) de nuestro widget: cada vez que escribimos `TarjetaAviso()` se llama al constructor.
- **`super.key`** recibe una **clave** (*key*) opcional y se la pasa al widget padre (`StatelessWidget`). Las claves ayudan a Flutter a **identificar cada widget** cuando reconstruye la interfaz (por ejemplo, para saber qué elemento de una lista se ha movido).

> ➕ **Ampliación: `const new(...)`.** Con Dart 3.13 el refactor *Extract Widget* puede generar el constructor así: `const new({super.key});`. Es la **sintaxis nueva** de Dart: `new` equivale al nombre de la clase y compila igual (comprobado con Dart 3.13.4). El temario usa la forma clásica, `const TarjetaAviso({super.key});`, que es la que verás en casi toda la documentación; puedes usar cualquiera de las dos.

Con este constructor ya podríamos poner `TarjetaAviso()` varias veces en `main`, pero **siempre saldría el mismo mensaje**. Para mostrar mensajes distintos necesitamos **propiedades**, **constructores** y **parámetros**.

### 2.4 Propiedades

Una **propiedad** es un **atributo de la clase** que guarda información sobre cada objeto. Una tarjeta de aviso podría tener:

| Propiedad | Tipo | Ejemplo |
|---|---|---|
| `mensaje` | `String` | `'Guarda los cambios'` |
| `icono` | `IconData` | `Icons.warning` |
| `color` | `Color` | `Colors.orange` |

En Dart se declaran dentro de la clase:

```dart
class TarjetaAviso extends StatelessWidget {
  final String mensaje;
  final IconData icono;
  final Color color;

  // Constructor y método build...
}
```

**`final`** indica que la variable **solo puede recibir un valor una vez**. En Flutter las propiedades de los widgets se declaran `final` porque **los widgets son inmutables**: una vez construida una instancia, sus propiedades no cambian. Si algo tiene que cambiar, se usa **estado** (`StatefulWidget` + `setState()`, UT1 sesión 7) y Flutter crea un widget nuevo con los valores nuevos.

**¿`final` o `const`?**

| | `final` | `const` |
|---|---|---|
| Cuántas veces se asigna | **Una sola vez** | Una sola vez |
| Cuándo se conoce el valor | Puede conocerse **durante la ejecución** (p. ej. lo que escribe el usuario) | Tiene que conocerse **al compilar** (un literal: `'Hola'`, `16`, `Colors.blue`) |
| Dónde lo usamos aquí | En las **propiedades** del widget | Delante del **constructor** y al **crear** widgets que no cambian |

### 2.5 El constructor con parámetros

Un **constructor** inicializa el objeto cuando lo creamos. Aquí recibirá los valores de las propiedades:

```dart
class TarjetaAviso extends StatelessWidget {
  final String mensaje;

  const TarjetaAviso({
    super.key,
    required this.mensaje,
  });

  // Método build...
}
```

| Pieza | Qué significa |
|---|---|
| `TarjetaAviso(...)` | El constructor **se llama igual que la clase** |
| `{ }` | Los parámetros son **nombrados**: al llamar se escribe el nombre (`mensaje: ...`) |
| `super.key` | Recibe una clave opcional para el widget |
| `required` | El parámetro es **obligatorio**: si falta, el código no compila |
| `this.mensaje` | Guarda el valor recibido en la propiedad `mensaje` del objeto |
| `const` | Permite crear instancias **constantes** cuando todos sus argumentos también lo son |

Ahora ya podemos escribir:

```dart
const TarjetaAviso(mensaje: 'Guarda los cambios')
```

**Parámetro opcional con valor por defecto.** Si quitamos `required` y le damos un valor, el parámetro pasa a ser opcional:

```dart
const TarjetaAviso({
  super.key,
  this.mensaje = 'Sin avisos',   // si no se indica, vale 'Sin avisos'
});
```

> ⚠️ Un parámetro nombrado **sin** `required` y **sin** valor por defecto tiene que admitir `null` (`String? mensaje`). Si su tipo es `String` a secas, Dart da error. Por eso, en un widget, cada parámetro es **`required`** o lleva **valor por defecto**.

### 2.6 El componente completo: mensaje, icono y color

```dart
import 'package:flutter/material.dart';

class TarjetaAviso extends StatelessWidget {
  final String mensaje;
  final IconData icono;
  final Color color;

  const TarjetaAviso({
    super.key,
    required this.mensaje,       // obligatorio
    this.icono = Icons.info,     // opcional: por defecto, icono de información
    this.color = Colors.blue,    // opcional: por defecto, azul
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icono, color: color),      // usa las propiedades
            const SizedBox(width: 12),
            Flexible(
              child: Text(mensaje),
            ),
          ],
        ),
      ),
    );
  }
}
```

Fíjate en dos cambios respecto a la versión extraída:

- `children:` ya **no lleva `const`**: `Icon(icono, ...)` y `Text(mensaje)` dependen de las propiedades, que no se conocen al compilar. El `const` se pone solo en lo que no cambia (`const SizedBox(width: 12)`).
- **`Flexible`** deja que el texto use el espacio que queda dentro del `Row` y **salte de línea** si el mensaje es largo (sin él, un mensaje largo provoca *overflow*, la franja amarilla y negra). No hace falta dominarlo todavía: es un "primo" de `Expanded` que no obliga a ocupar todo el espacio.

### 2.7 Formas de llamar al constructor

Como `mensaje` es obligatorio pero `icono` y `color` no, podemos crear la tarjeta de varias maneras:

```dart
const TarjetaAviso(
  mensaje: 'Información general',          // icono y color por defecto
)

const TarjetaAviso(
  mensaje: 'Cuidado con los cambios',
  icono: Icons.warning,
  color: Colors.orange,
)

const TarjetaAviso(
  mensaje: 'Operación correcta',
  icono: Icons.check_circle,
  color: Colors.green,
)
```

Al ser parámetros **nombrados**, el orden da igual y se lee perfectamente qué es cada valor.

Las propiedades de un componente pueden ser de **cualquier tipo**: `String`, `int`, `double`, `bool`, `Color`, `IconData`… e incluso **`Widget`** (así un componente puede recibir otro widget como contenido, igual que `Card` recibe su `child`).

---

## 3. Organizar los componentes en archivos

Podemos definir todos los widgets en `main.dart`, pero **no es buena práctica** cuando la app crece: con decenas de componentes en un único archivo es muy difícil encontrar nada. Una estructura sencilla:

```
lib/
├── main.dart                  ← punto de entrada y configuración (MaterialApp)
├── screens/
│   └── pantalla_avisos.dart   ← una pantalla completa (Scaffold)
└── widgets/
    └── tarjeta_aviso.dart     ← un componente reutilizable
```

| Archivo | Responsabilidad |
|---|---|
| `main.dart` | Arrancar la app (`main()` + `runApp`) y configurar `MaterialApp` |
| `screens/pantalla_avisos.dart` | La **pantalla** completa: `Scaffold`, `AppBar`, `body` |
| `widgets/tarjeta_aviso.dart` | El **componente**: no sabe nada de la pantalla en la que se usa |

Esta organización **no es obligatoria** en Flutter, pero mantiene el proyecto ordenado. Los nombres de archivo van en **minúsculas con guiones bajos** (`tarjeta_aviso.dart`) y la clase en **PascalCase** (`TarjetaAviso`).

**Pasos:**

1. **Crear el archivo del componente:** dentro de `lib` creamos la carpeta `widgets` y en ella `tarjeta_aviso.dart`, con su `import 'package:flutter/material.dart';` y la clase `TarjetaAviso`.
2. **Importar el componente** donde se use. Si el proyecto se llama `mi_aplicacion`:

   ```dart
   import 'package:mi_aplicacion/widgets/tarjeta_aviso.dart';
   ```

   El nombre que va después de `package:` es el **`name:` del `pubspec.yaml`** (en el proyecto de clase, `primer_widget`), y la ruta empieza **dentro de `lib/`**.

A partir de ese momento podemos usar `TarjetaAviso` desde `main.dart` o desde cualquier archivo que lo importe. Y si queremos cambiar el diseño de la tarjeta, vamos directamente a `widgets/tarjeta_aviso.dart` sin buscar entre el código de la pantalla.

> ➕ **Ampliación:** VS Code añade el `import` solo: al escribir `TarjetaAviso` sin importar, sale subrayado en rojo; **Ctrl + .** → *Import library 'package:...'*.

---

## 4. Proyecto de clase · `primer_widget`

*(Código en `primer_widget/lib/`)*. Sigue el temario desde el punto 1.2 en cuatro pasos:

| Paso | Qué se hace | Dónde queda |
|---|---|---|
| 1 | *Extract Widget* sobre la `Card` → clase `TarjetaAviso` | `widgets/tarjeta_aviso.dart` |
| 2 | Propiedades `mensaje`, `icono`, `color` + constructor con parámetros nombrados | `widgets/tarjeta_aviso.dart` |
| 3 | Estructura de carpetas `screens/` y `widgets/` | `lib/` |
| 4 | *Extract Widget* sobre el `Scaffold` → clase `PantallaAvisos` | `screens/pantalla_avisos.dart` |

```dart
// lib/main.dart: solo arranca la app
import 'package:flutter/material.dart';
import 'package:primer_widget/screens/pantalla_avisos.dart';

void main() {
  runApp(const MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PantallaAvisos(),
    );
  }
}
```

```dart
// lib/screens/pantalla_avisos.dart: la pantalla
import 'package:flutter/material.dart';
import 'package:primer_widget/widgets/tarjeta_aviso.dart';

class PantallaAvisos extends StatelessWidget {
  const new({super.key});     // = const PantallaAvisos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis avisos')),
      body: Center(
        child: TarjetaAviso(
          mensaje: "Error al cargar",   // obligatorio
          icono: Icons.info,            // en esta versión también es obligatorio
        ),
      ),
    );
  }
}
```

```
main.dart                      screens/pantalla_avisos.dart     widgets/tarjeta_aviso.dart
MiAplicacion                   PantallaAvisos                   TarjetaAviso
└── MaterialApp                └── Scaffold                     └── Card
    └── home: PantallaAvisos ─►    ├── appBar                       └── Padding
                                   └── body: Center                     └── Row
                                       └── TarjetaAviso ──────────►         ├── Icon
                                                                            ├── SizedBox
                                                                            └── Text
```

> ✏️ **Corrección (diferencias con el temario):**
>
> - En `tarjeta_aviso.dart`, `icono` está como **`required`**, mientras que en el temario es opcional con `this.icono = Icons.info`. Las dos formas son válidas, pero con la del temario se puede escribir `TarjetaAviso(mensaje: 'Error al cargar')` sin indicar el icono.
> - Falta el **`Flexible`** alrededor de `Text(mensaje)`: con un mensaje largo la fila se desborda.
> - Se puede poner `const` en `home: const PantallaAvisos()` y en `const TarjetaAviso(...)`, porque todos sus argumentos son constantes (el analizador lo sugiere en azul).
> - El comentario dice "*Como es required los setteamos aquí*": en Dart no hay *setters* aquí, se **pasan como argumentos** al constructor.

---

## 5. Actividad 2.1 · Crear componentes reutilizables

*(Cuestionario 2.1. Código en `actividad_2.1/crear_componente_reutilizable/lib/`)*. Partimos de una pantalla "Próximos eventos" con la misma tarjeta repetida tres veces.

| Pregunta | Qué pide | Lo que se aprende |
|---|---|---|
| **1** | Extraer la tarjeta repetida a `TarjetaEvento` (`StatelessWidget`) en `lib/widgets/tarjeta_evento.dart` y usarla 3 veces desde `main.dart`, sin cambiar el aspecto (el `Scaffold` sigue en `main.dart`) | *Extract Widget* + importar |
| **2** | Mover el `Scaffold` a `PantallaEventos` en `lib/screens/pantalla_eventos.dart`; `main.dart` solo arranca y pone `home: PantallaEventos()` | Separar pantalla y componente |
| **3** | Propiedades `titulo` (`String`, obligatoria), `fecha` (`String`, obligatoria) y `plazasDisponibles` (`int`, opcional, por defecto 0), declaradas `final`; tres eventos distintos (el último sin plazas para ver el valor por defecto) | Propiedades + constructor |
| **4** | Sin tocar `tarjeta_evento.dart` ni `main.dart`, añadir una cuarta tarjeta | **La ventaja** de reutilizar: añadir una tarjeta es una línea |

**El componente** (preguntas 1 y 3):

```dart
// lib/widgets/tarjeta_evento.dart
import 'package:flutter/material.dart';

class TarjetaEvento extends StatelessWidget {
  final String titulo;            // obligatoria
  final String fecha;             // obligatoria
  final int plazasDisponibles;    // opcional

  const TarjetaEvento({
    super.key,
    required this.titulo,
    required this.fecha,
    this.plazasDisponibles = 0,   // valor por defecto
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,                    // la tarjeta mide lo que su contenido
          crossAxisAlignment: CrossAxisAlignment.start,      // textos a la izquierda
          children: [
            Text(titulo, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(fecha),
            Text("Plazas disponibles: $plazasDisponibles"),  // interpolación con $
          ],
        ),
      ),
    );
  }
}
```

**La pantalla** (preguntas 2, 3 y 4):

```dart
// lib/screens/pantalla_eventos.dart
class PantallaEventos extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Próximos eventos')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TarjetaEvento(titulo: "Taller de flutter", fecha: "24 de octubre", plazasDisponibles: 15),
            TarjetaEvento(titulo: "Introducción a Git", fecha: "30 de octubre", plazasDisponibles: 8),
            TarjetaEvento(titulo: "Charla de ciberseguridad", fecha: "5 de noviembre"),        // → 0 plazas
            TarjetaEvento(titulo: "Diseño de interfaces", fecha: "12 de noviembre", plazasDisponibles: 20),  // pregunta 4
          ],
        ),
      ),
    );
  }
}
```

**Respuesta a la pregunta 4:** solo hay que añadir una línea en `PantallaEventos`. Ni el componente ni `main.dart` cambian: esa es justo la ventaja de **reutilización** y **mantenimiento** de la sección 1.

> ✏️ **Corrección:** el enunciado pide «Taller de **F**lutter» con mayúscula y en el código está «Taller de **f**lutter».
>
> ➕ **Mejoras posibles:** (1) `const` delante de `TextStyle(...)`, `SizedBox(height: 8)` y de cada `TarjetaEvento(...)`, porque sus valores son literales; (2) con muchos eventos, la `Column` acabará desbordando la pantalla: se cambia por un `ListView` (o se envuelve en `SingleChildScrollView`), como en la 1.11.1 de la UT1.
>
> ⏳ **Pendiente:** el `README.md` de la actividad es el de plantilla de Flutter.

---

## 6. Flutter Inspector

*(Del «Pequeño manual para conocer el inspector de Flutter»)*

**Flutter Inspector** es una herramienta visual para **explorar el árbol de widgets de una app mientras se está ejecutando**. Con el semáforo de la actividad 1.13.1 se ve así:

```
Scaffold
└── Center
    └── Container (carcasa negra)
        └── Column
            ├── Container (luz roja)
            ├── SizedBox
            ├── Container (luz amarilla)
            ├── SizedBox
            └── Container (luz verde)
```

Lo interesante es que puedes **seleccionar un elemento de la app** y ver **qué widget lo genera**, cómo está distribuido y qué espacio ocupa.

### 6.1 Cómo abrirlo en VS Code

1. Ejecuta la app en el emulador Android **en modo depuración (F5)**. No basta con tener el código abierto: el Inspector se conecta a una **app en ejecución**.
2. Pulsa **Ctrl + Shift + P** (o **F1**) para abrir la paleta de comandos.
3. Escribe **`Dart: Open DevTools`** y selecciona el comando.
4. En DevTools, entra en la pestaña **Flutter Inspector**.

Puede abrirse dentro de VS Code o en el navegador, según la configuración.

### 6.2 Seleccionar un widget desde el emulador

Activa **Select Widget Mode** y pulsa sobre cualquier elemento en el emulador (por ejemplo, la luz roja): el Inspector lo **localiza en el árbol** y muestra sus propiedades y los widgets que lo contienen. **Desactiva** el modo de selección para volver a usar la app con normalidad (mientras está activo, los toques seleccionan en vez de pulsar).

### 6.3 Las funciones más importantes

| Función | Para qué sirve |
|---|---|
| **Widget Tree** | Muestra la **jerarquía** de widgets: despliegas un `Column`, ves sus hijos y entiendes cómo se organiza la interfaz |
| **Show Guidelines** | Dibuja **guías** sobre la app: límites de cada elemento, espacios interiores y separaciones. Ideal para detectar problemas de tamaño |
| **Flex Explorer** | Al seleccionar un `Row` o `Column`, muestra el **eje principal**, el **eje transversal** y cómo se reparten los hijos. Muy útil para entender `mainAxisAlignment`, `crossAxisAlignment` y `Expanded` |

Si el árbol muestra muchos widgets internos que no has escrito tú, es porque está activada la opción **`<> Show`** (mostrar los widgets de implementación de Flutter): desactívala para ver solo los tuyos.

### 6.4 Experimento con el semáforo

1. Ejecuta el semáforo estático (1.13.1).
2. Abre Flutter Inspector y selecciona la **carcasa negra**.
3. Examina su tamaño: según el manual debería medir **122 × 326** píxeles lógicos.
4. Activa **Show Guidelines** para ver el espacio interior de **16** píxeles.
5. Selecciona el `Column` y abre **Flex Explorer**.
6. Cambia en el código `mainAxisSize: MainAxisSize.min` por `MainAxisSize.max` y haz **Hot Reload**.

**Qué observar:** con `max` la columna intenta ocupar **toda la altura disponible** y la carcasa se estira; con `min` mide **lo justo para su contenido**. Por eso `MainAxisSize.min` es importante cuando quieres que una columna se ajuste a lo que lleva dentro (lo usamos en `TarjetaAviso`, `TarjetaEvento` y `PantallaEventos`).

> ✏️ **Corrección (cuentas del semáforo):** los 122 × 326 del manual salen de luces de 90, separaciones de 12 y padding de 16: ancho 16 + 90 + 16 = **122**; alto 16 + 90 + 12 + 90 + 12 + 90 + 16 = **326**. En nuestra 1.13.1 el padding de la carcasa es **12**, así que medirá **114 × 318**. Además, las separaciones están hechas con `margin` en las luces, no con `SizedBox`, así que en el árbol no aparecerán los `SizedBox` del ejemplo.

---

## Chuleta

| Concepto | Código | Para qué |
|---|---|---|
| Componente sin datos | `class X extends StatelessWidget { const X({super.key}); ... }` | Trozo de interfaz con nombre propio |
| Propiedad | `final String mensaje;` | Dato que recibe el componente (inmutable) |
| Parámetro obligatorio | `required this.mensaje` | Hay que indicarlo siempre |
| Parámetro opcional | `this.color = Colors.blue` | Si no se indica, usa el valor por defecto |
| Llamada | `TarjetaAviso(mensaje: 'Hola', color: Colors.red)` | Parámetros nombrados: el orden da igual |
| Texto que no se desborda | `Flexible(child: Text(...))` | Dentro de un `Row` |
| Ajustar al contenido | `mainAxisSize: MainAxisSize.min` | `Row`/`Column` miden lo justo |
| Importar | `import 'package:<name del pubspec>/widgets/x.dart';` | Usar un componente de otro archivo |
| Carpetas | `lib/main.dart`, `lib/screens/`, `lib/widgets/` | Arranque, pantallas, componentes |
| Refactor | **Ctrl + .** → *Extract Widget* | Sacar un trozo del árbol a su propia clase |
| Inspector | **F5** → **Ctrl + Shift + P** → *Dart: Open DevTools* | Ver el árbol en vivo |

---

## Preguntas para repasar

1. Di tres ventajas de crear componentes reutilizables.
2. ¿Para qué sirve `super.key`?
3. ¿Por qué las propiedades de un widget se declaran `final`?
4. ¿Qué diferencia hay entre `final` y `const`?
5. En `const TarjetaAviso({super.key, required this.mensaje})`, ¿qué indican las llaves `{ }`, `required` y `this.mensaje`?
6. ¿Cómo haces que `plazasDisponibles` sea opcional y valga 0 si no se indica?
7. ¿Por qué en la versión con propiedades `children:` ya no puede llevar `const`?
8. ¿Para qué sirve `Flexible` en `TarjetaAviso`?
9. ¿Qué va en `main.dart`, en `screens/` y en `widgets/`?
10. El proyecto se llama `agenda` y el componente está en `lib/widgets/tarjeta_contacto.dart`. Escribe el `import`.
11. En la actividad 2.1, ¿qué archivos hay que tocar para añadir un quinto evento? ¿Por qué?
12. ¿Cómo se abre Flutter Inspector en VS Code y por qué la app tiene que estar ejecutándose?
13. ¿Qué cambia en la carcasa del semáforo al pasar de `MainAxisSize.min` a `MainAxisSize.max`?

<details>
<summary>Soluciones</summary>

1. Reutilización, mantenimiento (cambios en un único sitio), legibilidad, consistencia y pruebas por separado.
2. Recibe una clave opcional y se la pasa al widget padre; las claves ayudan a Flutter a identificar los widgets al reconstruir la interfaz.
3. Porque los widgets son inmutables: una vez creados, sus propiedades no cambian (si algo cambia, se usa estado y Flutter crea un widget nuevo).
4. `final`: se asigna una vez y el valor puede conocerse durante la ejecución. `const`: el valor tiene que conocerse al compilar.
5. `{ }`: parámetros nombrados. `required`: obligatorio. `this.mensaje`: guarda el valor recibido en la propiedad `mensaje`.
6. Quitando `required` y dándole valor: `this.plazasDisponibles = 0`.
7. Porque `Icon(icono, ...)` y `Text(mensaje)` dependen de propiedades que no se conocen al compilar.
8. Para que el texto use el espacio que queda en el `Row` y salte de línea si es largo, en lugar de desbordarse.
9. `main.dart`: arranque y `MaterialApp`. `screens/`: pantallas completas (`Scaffold`). `widgets/`: componentes reutilizables.
10. `import 'package:agenda/widgets/tarjeta_contacto.dart';`
11. Solo `screens/pantalla_eventos.dart` (una línea más con `TarjetaEvento(...)`), porque el componente ya acepta cualquier título, fecha y plazas.
12. Ejecutar con F5 → Ctrl + Shift + P → *Dart: Open DevTools* → pestaña Flutter Inspector. Porque el Inspector se conecta a la app en marcha para leer su árbol real.
13. Con `max` la columna ocupa toda la altura disponible y la carcasa se estira; con `min` se ajusta a las tres luces.

</details>
