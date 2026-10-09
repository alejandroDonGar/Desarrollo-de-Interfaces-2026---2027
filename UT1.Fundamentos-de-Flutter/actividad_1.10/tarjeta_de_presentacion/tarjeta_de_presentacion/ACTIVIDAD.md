# Práctica: Tarjeta de presentación

Desarrolla una aplicación Flutter que permita crear una **tarjeta de presentación personalizada**.

A partir del **vídeo de demostración**, reproduce la interfaz y consigue que sus elementos se actualicen automáticamente cuando el usuario modifique los datos.

## 1. Funcionamiento de la aplicación

- Introducir un **nombre** mediante un `TextField`, actualizando la tarjeta mientras se escribe.
- Introducir una **profesión** mediante otro `TextField`, actualizando también la tarjeta en tiempo real.
- Mostrar **«Tu nombre»** y **«Tu profesión»** cuando los campos estén vacíos.
- Mostrar **«Completa tus datos»** cuando el nombre esté vacío y **«Tarjeta personalizada»** cuando contenga texto.
- Activar o desactivar el modo oscuro mediante un `Switch`, cambiando los colores de fondo, tarjeta, textos e icono.

## 2. Especificaciones visuales

|Elemento|Propiedades|
|---|---|
| Fondo claro / oscuro | `Color(0xFFF2F5F9)` / `Color(0xFF202B3A)`
| Tarjeta clara / oscura | `Colors.white` / `Color(0xFF36455B)`
| Márgenes exteriores | 16 px
| Separación principal | 20 px
| Título | 24 px, negrita
| Nombre | 22 px, negrita
| Profesión | 16 px
| Mensaje inferior | 12 px
| Icono | `Icons.person`, 55 px
| Elevación de la tarjeta |	3
| Icono en modo claro |	`Color(0xFF315D95)`

Para los textos utiliza `Colors.black87` y `Colors.black54` en modo claro, y `Colors.white` y `Colors.white70` en modo oscuro, según corresponda.

## 3. Requisitos de programación


- Crear un widget propio que herede de `StatefulWidget` y su correspondiente clase de estado.
- Declarar las variables necesarias para almacenar el nombre, la profesión y el modo de visualización.
- Utilizar `onChanged` y `setState()` para actualizar la interfaz.
- Utilizar el **operador ternario** `?` `:` para mostrar textos y colores diferentes según el estado.
- No utilizar `TextEditingController` ni otros mecanismos de gestión del estado.

## 4. Entrega

Entrega el archivo `main.dart` con la aplicación terminada y funcionando.

**Importante**
- El objetivo principal es que los cambios realizados por el usuario se reflejen correctamente en la interfaz, sin necesidad de pulsar botones de confirmación.`