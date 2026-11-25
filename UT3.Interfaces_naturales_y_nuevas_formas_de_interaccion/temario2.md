
🎤 Reconocimiento de voz en Flutter (RA2 · CE b, c)
Requisitos de finalización
🎤 Reconocimiento de voz en Flutter

En este apartado la aplicación va a escuchar: convertiremos lo que dice la persona en texto y, con ese texto, ejecutaremos una acción. Lo probaremos con una pequeña aplicación, el Semáforo por voz, que cambia de color cuando dices «rojo», «amarillo» o «verde». Corresponde al RA2, criterios b) y c).
Cómo funciona

Usaremos el paquete speech_to_text. No trae su propio modelo: usa el reconocedor de voz del sistema (en Android, el servicio de voz de Google). La aplicación le pide que escuche, el sistema graba el audio, lo convierte en texto y nos lo devuelve poco a poco mientras hablamos.
Pieza 	Para qué sirve
SpeechToText 	El objeto que controla el reconocimiento. Se crea una vez y se reutiliza.
initialize() 	Prepara el reconocimiento y pide el permiso del micrófono. Devuelve true si se puede usar y false si no (sin permiso, sin servicio de voz…).
listen() 	Empieza a escuchar. Cada vez que hay texto nuevo llama a la función que le pasamos en onResult.
stop() 	Deja de escuchar y entrega el último resultado.
isListening 	Vale true mientras está escuchando. Sirve para cambiar el icono del botón.
SpeechRecognitionResult 	El resultado que recibe onResult: recognizedWords es el texto entendido y finalResult dice si ya es el definitivo.

Mientras hablamos llegan resultados parciales («ro», «rojo», «rojo y»…) y, cuando dejamos de hablar, el resultado final (finalResult vale true). Los parciales sirven para mostrar en pantalla lo que se va entendiendo; la acción conviene ejecutarla solo con el final, para no reaccionar a frases a medias.
Preparar el proyecto

    Crea el proyecto con flutter create semaforo_voz y añade el paquete desde su carpeta con flutter pub add speech_to_text. El comando lo apunta en pubspec.yaml y lo descarga.
    Abre android/app/src/main/AndroidManifest.xml y añade, dentro de <manifest> y antes de <application>, los permisos y el bloque <queries>:

<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.RECORD_AUDIO"/>
    <uses-permission android:name="android.permission.INTERNET"/>

    <queries>
        <intent>
            <action android:name="android.speech.RecognitionService"/>
        </intent>
    </queries>

    <application ...>

    RECORD_AUDIO es el permiso para grabar con el micrófono. Sin él, initialize() devuelve false.
    INTERNET hace falta porque muchos móviles reconocen la voz en los servidores de Google.
    <queries> permite que la aplicación encuentre el servicio de reconocimiento de voz del móvil. Desde Android 11, si falta, initialize() devuelve false aunque el permiso esté concedido.

Conecta el móvil por USB con la depuración activada y ejecuta flutter run. La primera vez que pulses el micrófono, el móvil te pedirá permiso: acéptalo.
El Semáforo por voz, paso a paso

Sustituye el contenido de lib/main.dart por este código. Después lo explicamos por partes.

import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

void main() => runApp(const MaterialApp(home: Semaforo()));

// Paso 4: de la frase reconocida a la acción (null si no es una orden)
Color? colorPara(String frase) {
  final texto = frase.toLowerCase();
  if (texto.contains('rojo')) return Colors.red;
  if (texto.contains('amarillo')) return Colors.amber;
  if (texto.contains('verde')) return Colors.green;
  return null;
}

class Semaforo extends StatefulWidget {
  const Semaforo({super.key});

  @override
  State<Semaforo> createState() => _SemaforoState();
}

class _SemaforoState extends State<Semaforo> {
  final SpeechToText _voz = SpeechToText();
  bool _disponible = false;
  String _oido = '';
  Color _color = Colors.grey;

  @override
  void initState() {
    super.initState();
    _iniciar();
  }

  Future<void> _iniciar() async {
    final ok = await _voz.initialize(
      onStatus: (estado) => setState(() {}), // repinta el botón al empezar o dejar de escuchar
    );
    setState(() => _disponible = ok);
  }

  Future<void> _escuchar() async {
    await _voz.listen(
      onResult: _alResultado,
      listenOptions: SpeechListenOptions(
        localeId: 'es_ES',
        listenFor: const Duration(seconds: 10),
        pauseFor: const Duration(seconds: 3),
        partialResults: true,
      ),
    );
  }

  Future<void> _parar() async {
    await _voz.stop();
  }

  void _alResultado(SpeechRecognitionResult resultado) {
    setState(() {
      _oido = resultado.recognizedWords;
      if (resultado.finalResult) {
        _color = colorPara(_oido) ?? _color;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final escuchando = _voz.isListening;
    return Scaffold(
      appBar: AppBar(title: const Text('Semáforo por voz')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 24,
          children: [
            CircleAvatar(radius: 80, backgroundColor: _color),
            Text(_disponible
                ? 'Pulsa el micrófono y di «rojo», «amarillo» o «verde»'
                : 'El reconocimiento de voz no está disponible'),
            Text(_oido, style: const TextStyle(fontSize: 22)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: !_disponible ? null : (escuchando ? _parar : _escuchar),
        child: Icon(escuchando ? Icons.mic : Icons.mic_none),
      ),
    );
  }
}

Parte del código 	Qué hace
colorPara() 	El paso 4 de cualquier interfaz natural: decide la acción a partir de la frase. Devuelve un Color?: un color o null si la frase no es ninguna orden.
initState() y _iniciar() 	Al abrir la pantalla se prepara el reconocimiento una sola vez. _disponible guarda si se puede usar.
onStatus 	Se ejecuta cada vez que el reconocimiento empieza o termina. Llamamos a setState() para que el icono del micrófono cambie también cuando deja de escuchar solo.
listen(...) y SpeechListenOptions 	Las opciones de escucha van juntas en SpeechListenOptions: español de España (localeId: 'es_ES'), como máximo 10 segundos (listenFor), parar si pasan 3 segundos sin hablar (pauseFor) y recibir los resultados parciales (partialResults: true).
_alResultado() 	Muestra en pantalla lo que se va entendiendo y, cuando el resultado es final, cambia el color.
colorPara(_oido) ?? _color 	El operador ?? significa «si lo de la izquierda es null, usa lo de la derecha»: si la frase no es una orden, el semáforo se queda como estaba.
onPressed 	Si el reconocimiento no está disponible, vale null y el botón no hace nada. Si está escuchando, el botón para; si no, empieza a escuchar.
De la frase a la orden

El reconocedor devuelve exactamente lo que ha entendido, con mayúsculas, tildes y palabras de más: «Pon el semáforo en verde, por favor». Por eso no comparamos la frase entera con ==, sino que buscamos palabras clave con contains() después de pasarla a minúsculas. Algunos consejos:

    Elige palabras clave cortas y distintas entre sí, que el reconocedor no confunda.
    Si una orden admite varias formas («para», «pausa», «detente»), comprueba todas en la misma condición con || (o).
    Cuidado con las palabras que contienen a otras: «verdear» contiene «verde». Si importa, comprueba antes la más larga.
    Las tildes cuentan: «música» no contiene «musica». Escribe las palabras clave como las escribiría el reconocedor.

Errores típicos
Lo que pasa 	Por qué y cómo se arregla
Sale «El reconocimiento de voz no está disponible» 	Falta el permiso RECORD_AUDIO o el bloque <queries>, se rechazó el permiso, o el móvil no tiene servicio de voz. Revisa el AndroidManifest.xml y los permisos de la aplicación en los ajustes del móvil.
El icono se queda en «escuchando» aunque ya no escucha 	Falta el setState() en onStatus: el reconocimiento ha parado solo, pero la pantalla no se ha vuelto a pintar.
El color cambia con frases a medias 	Se ejecuta la acción con los resultados parciales. Comprueba finalResult antes de actuar.
Entiende las palabras en inglés 	No se ha indicado localeId: 'es_ES' y el móvil está configurado en otro idioma.
En el emulador o en Windows no funciona 	El plugin necesita el micrófono y el servicio de voz de un móvil real.
Deja de escuchar enseguida 	Es normal: para tras unos segundos de silencio (pauseFor). Habla justo después de pulsar el botón.

Para recordar

initialize() una vez, listen() para escuchar y stop() para parar.

recognizedWords es el texto entendido; actúa solo cuando finalResult es true.

Busca palabras clave en minúsculas con contains() y deja la interfaz como estaba si la frase no es ninguna orden.

Sin RECORD_AUDIO y <queries> en el AndroidManifest.xml, el reconocimiento no está disponible.

Fuentes: speech_to_text en pub.dev, Permisos en Android.
