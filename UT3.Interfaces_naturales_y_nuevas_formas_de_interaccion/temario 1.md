
🤖 Interfaces naturales y aprendizaje automático (RA2 · CE a, b)
Requisitos de finalización
🤖 Interfaces naturales y aprendizaje automático

Hasta ahora nuestras aplicaciones se manejaban con botones, campos de texto y gestos sobre la pantalla. En esta unidad van a entender la voz, los movimientos del cuerpo y la cara, y a mezclar objetos virtuales con el mundo real. Antes de programar, conviene saber qué es una interfaz natural, cómo consigue el móvil «entender» lo que hacemos y qué herramientas ya preparadas podemos usar. Corresponde al RA2, criterios a) y b).
De la línea de comandos a las interfaces naturales

La forma de comunicarnos con los ordenadores ha cambiado mucho. Cada paso ha acercado la máquina a la manera en que las personas nos comunicamos entre nosotras:
Tipo de interfaz 	Cómo se usa 	Ejemplo
CLI (Command Line Interface, interfaz de línea de comandos) 	Se escriben órdenes exactas con el teclado. Hay que aprenderlas. 	Escribir flutter run en la terminal.
GUI (Graphical User Interface, interfaz gráfica de usuario) 	Se pulsan ventanas, iconos, menús y botones con el ratón o el dedo. 	Las aplicaciones Flutter de las unidades anteriores.
NUI (Natural User Interface, interfaz natural de usuario) 	Se usa la voz, los gestos, el cuerpo o la mirada, como haríamos con otra persona o con un objeto. 	Decir «pon una alarma a las siete» o desbloquear el móvil con la cara.

Se llama natural porque no obliga a aprender un lenguaje especial: es la interfaz la que se adapta a la persona. Una buena NUI casi no se nota; simplemente hacemos lo que haríamos de todos modos.
Tipos de interfaces naturales

    Táctiles y gestos en la pantalla: pellizcar para hacer zoom, deslizar para pasar de foto. La pantalla multitáctil detecta varios dedos a la vez.
    Voz: el reconocimiento de voz (en inglés, speech to text) convierte lo que decimos en texto; la síntesis de voz (text to speech) hace lo contrario y permite que el móvil hable. Los asistentes de voz combinan las dos.
    Movimiento del cuerpo: la cámara detecta la postura y los movimientos (levantar los brazos, agacharse, saltar). Se usa en juegos y en aplicaciones de ejercicio.
    Partes del cuerpo: la cara, los ojos, la sonrisa o las manos. Por ejemplo, el desbloqueo facial, los filtros de las redes sociales o el control con gestos de la mano.
    Mirada: el seguimiento de los ojos (eye tracking) averigua hacia dónde miramos.
    Realidad aumentada (RA; en inglés, AR, augmented reality): añade objetos virtuales a la imagen real que capta la cámara, como un mueble en 3D colocado en el salón. No hay que confundirla con la realidad virtual (RV o VR), que sustituye por completo el mundo real por uno virtual, normalmente con unas gafas.

A menudo se combinan varias formas de interacción en la misma aplicación: hablar y señalar, mirar y tocar… Entonces se habla de una interfaz multimodal.
¿Cómo entiende el móvil la voz o un gesto? El aprendizaje automático

Escribir a mano las reglas para reconocer una cara es prácticamente imposible: cambian la luz, el ángulo, el peinado, las gafas… Por eso se usa el aprendizaje automático (en inglés, ML, machine learning), una rama de la inteligencia artificial (IA) en la que el ordenador aprende a partir de ejemplos en lugar de seguir reglas escritas por una persona.
Concepto 	Qué es 	Ejemplo
Datos de entrenamiento (dataset) 	Muchos ejemplos con su respuesta correcta (etiqueta). 	Miles de fotos de manos con la etiqueta «pulgar arriba» o «puño».
Entrenamiento 	Proceso en el que el programa ajusta sus números internos hasta acertar con los ejemplos. 	Horas o días en ordenadores potentes.
Modelo 	El resultado del entrenamiento: un archivo que sabe hacer una tarea concreta. 	Un archivo .tflite que detecta poses.
Inferencia 	Usar el modelo con datos nuevos para obtener una respuesta. 	La aplicación mira la cámara y responde «brazos arriba».
Confianza (confidence) 	Número entre 0 y 1 que indica lo seguro que está el modelo de su respuesta. 	0,92 significa que está seguro al 92 %.

Un modelo preentrenado es un modelo que otra persona o empresa ya ha entrenado y publica para que lo usemos. En este módulo trabajaremos así: no entrenaremos modelos complejos, sino que aprovecharemos los que ya existen y nos centraremos en la interfaz.
En el dispositivo o en la nube

La inferencia se puede hacer en dos sitios:
  	En el dispositivo (on-device) 	En la nube (cloud)
Dónde se ejecuta el modelo 	En el propio móvil. 	En un servidor de Internet.
Velocidad 	Muy rápida: no hay que esperar a la red. 	Depende de la conexión.
Internet 	No hace falta. 	Imprescindible.
Privacidad 	La imagen o el audio no salen del móvil. 	Los datos se envían al servidor.
Tamaño del modelo 	Modelos pequeños y optimizados. 	Modelos mucho más grandes y precisos.

Las herramientas que usaremos para detectar el cuerpo y la cara funcionan en el dispositivo. El reconocimiento de voz depende del móvil: algunos lo hacen sin conexión y otros necesitan Internet.
Herramientas disponibles
Herramienta 	Qué es 	Uso en esta unidad
ML Kit (Google) 	Conjunto de modelos ya entrenados para Android e iOS que funcionan en el dispositivo: caras, poses del cuerpo, texto, códigos de barras, objetos… 	Detectar el cuerpo y la cara, con los paquetes google_mlkit_pose_detection y google_mlkit_face_detection.
MediaPipe (Google) 	Soluciones listas para usar que detectan manos, cara, pose y gestos, en móvil, web y escritorio. 	Probar demostraciones en el navegador y como alternativa a ML Kit.
TensorFlow Lite, hoy LiteRT 	Versión ligera de TensorFlow (la biblioteca de aprendizaje automático de Google) para ejecutar modelos en móviles. Desde 2024 se llama LiteRT. 	Ejecutar modelos propios, por ejemplo los exportados desde Teachable Machine.
Teachable Machine (Google) 	Página web para entrenar un modelo sencillo con la webcam o el micrófono, sin programar. 	Ver en pocos minutos qué significa entrenar un modelo.
Reconocedor de voz del sistema 	Servicio de Android y de iOS que convierte la voz en texto. 	Reconocer órdenes habladas, con el paquete speech_to_text.
ARCore (Google) y ARKit (Apple) 	Plataformas de realidad aumentada de Android y de iOS: entienden el espacio que ve la cámara. 	Colocar un modelo 3D en la habitación, con el paquete model_viewer_plus.
Las herramientas en Flutter: paquetes y plugins

Como en la UT2, añadiremos estas herramientas como paquetes de pub.dev (la web donde se publican los paquetes de Dart y Flutter). Todos los de esta unidad son plugins: paquetes que, además de código Dart, incluyen código nativo (Kotlin o Java para Android, Swift para iOS) para usar funciones del móvil como el micrófono o la cámara.

    Por eso se prueban en un móvil real conectado por USB. En el navegador o en Windows no funcionan, y el emulador los maneja mal.
    El móvil pide permiso a la persona antes de usar el micrófono o la cámara. Además, la aplicación debe declarar esos permisos en el archivo AndroidManifest.xml (android/app/src/main/AndroidManifest.xml), donde se describe la aplicación Android.

Cómo se monta una interfaz natural

Sea cual sea el tipo de interfaz, siempre se sigue el mismo recorrido:

    Sensor: el micrófono o la cámara capta los datos.
    Modelo: los interpreta (inferencia).
    Resultado: el texto reconocido, los puntos del cuerpo o la probabilidad de que la persona sonría, normalmente con su confianza.
    Decisión: nuestro código decide qué acción corresponde. Por ejemplo, si la frase contiene «rojo» o si la mano está por encima de la cabeza.
    Interfaz: la pantalla cambia, con setState() o con Provider, como en las unidades anteriores.

Los pasos 1 a 3 los hacen los paquetes. Nosotros programamos los pasos 4 y 5. El paso 4 es Dart normal; por ejemplo, esta función convierte una frase reconocida en el nombre de una acción:

// Paso 4: convertir lo que ha entendido el modelo en una acción
String accionPara(String frase) {
  final texto = frase.toLowerCase();
  if (texto.contains('rojo')) return 'pintar_rojo';
  if (texto.contains('azul')) return 'pintar_azul';
  if (texto.contains('borrar')) return 'borrar';
  return 'desconocida';
}

toLowerCase() pasa el texto a minúsculas, para que «Rojo» y «ROJO» cuenten igual. contains() comprueba si un texto contiene a otro. Fíjate en que buscamos la palabra exacta: «borra» no contiene «borrar», así que accionPara('Borra todo') devuelve desconocida.

Los modelos se equivocan, así que conviene usar la confianza con un umbral: un valor mínimo por debajo del cual no nos fiamos del resultado.

void alReconocer(String frase, double confianza) {
  if (confianza < 0.6) {
    mostrarAviso('No te he entendido bien. ¿Lo repites?');
    return;
  }
  ejecutar(accionPara(frase));
}

Buenas prácticas

    Dar señales: mostrar cuándo la aplicación escucha o mira (un micrófono animado, un recuadro sobre la cara), y qué ha entendido.
    Mantener siempre una alternativa: un botón por si falla la voz o la cámara. Hay personas que no pueden hablar o moverse, y lugares con ruido o poca luz.
    Tolerar errores: pedir confirmación antes de una acción peligrosa, como borrar.
    Cuidar la privacidad: pedir cada permiso cuando se va a usar, explicar para qué, y procesar en el dispositivo siempre que se pueda.
    Pocas órdenes y fáciles de recordar: mejor «siguiente» y «anterior» que veinte frases parecidas.

Para recordar

Una NUI usa la voz, el cuerpo, la cara o los gestos para manejar la aplicación.

El aprendizaje automático crea modelos a partir de ejemplos; usar un modelo con datos nuevos es la inferencia.

Usaremos modelos preentrenados: ML Kit para el cuerpo y la cara, el reconocedor de voz del sistema y ARCore para la RA.

Nuestro trabajo es decidir qué acción corresponde a cada resultado y actualizar la interfaz.

Fuentes: ML Kit, MediaPipe, LiteRT, Teachable Machine, ARCore.
