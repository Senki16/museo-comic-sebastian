# Museo interactivo 3D · *Pascual Bravo, a un escaneo de distancia*

Recorrido jugable en tercera persona sobre el cómic de **Sebastián**, estudiante de primer
semestre que llegó a Medellín, se perdió la inducción y terminó perdiendo un día entero en el
campus. El museo cuenta el problema y termina en la solución: un QR con todo el campus.

## Cómo funciona el recorrido

0. **Portada.** Arranca con la infografía del *proceso perceptivo* del caso de Sebastián.
   Un clic y empieza el recorrido.
1. **Introducción con audio.** Antes de entrar suena la narración. Los controles se desbloquean
   cuando el audio termina (hay un botón para saltarlo si se está repitiendo la presentación).
2. **Sala del cómic.** Sebastián camina entre las seis páginas, colgadas en orden y numeradas en
   el piso. Al acercarse a una, se pulsa **E** para abrir la viñeta a pantalla completa.
3. **Narración por viñeta.** Cada página se narra con la voz de Sebastián (generada con
   ElevenLabs, voz *Brian CM — Young LATAM Spanish Narrator*) y suena **solo** al abrir esa
   viñeta. El visor tiene botones para repetirla o silenciarla. Si el audio no cargara, el
   navegador lee el mismo texto en español.
4. **Sala del reto.** Al leer las seis páginas se abre la puerta del fondo. Dentro hay un ascenso
   tipo *Only Up*: cada plataforma con cartel es una de las seis dificultades que vivió Sebastián,
   separadas por tramos de salto. Arriba del todo está la solución y el agradecimiento.

## Controles

| Tecla | Acción |
|---|---|
| W A S D | Mover a Sebastián |
| Mouse | Cámara en tercera persona (clic para capturarla) |
| Espacio | Saltar |
| Shift *(o clic derecho)* | Dash — también en el aire, uno por salto |
| E | Abrir la página del cómic que tienes enfrente |
| ESC | Liberar el mouse |

Si te caes en el ascenso vuelves al último cartel alcanzado, no al principio.

## Las seis dificultades

1. Se perdió la inducción y nadie le explicó por dónde empezar
2. El mapa del campus no muestra los bloques ni los salones
3. Miedo a preguntar: «¿y si no entienden mi acento?»
4. Un día entero perdido: termina en la clase equivocada
5. La información está regada: cada grupo dice algo distinto
6. Trámites y zonas de estudio sin un punto único de consulta

**La solución:** un QR con salones, trámites y zonas de estudio en un solo lugar.

## Estructura

```
index.html        El museo completo: escena 3D, personaje, físicas y lógica.
comic_embed.js    Las seis páginas del cómic y la portada, incrustadas en base64.
narracion.js      Las seis narraciones de Sebastián, incrustadas en base64.
intro.mp3         Audio de la introducción.
narracion/        Los mp3 originales de ElevenLabs (no se suben: ya van en narracion.js).
```

## Paleta

Los colores del museo son pasteles derivados del azul y el amarillo institucionales del
Pascual Bravo: paredes en azul pastel, piso color arena con retícula azul suave, techo crema
y marcos en azul marino.

No hay build ni dependencias que instalar: Three.js se carga por CDN y el resto es un archivo
estático. Sirve en cualquier hosting estático (Vercel, Netlify, GitHub Pages) o se abre en local
con doble clic.

## Editar el contenido

Al inicio del bloque `<script>` de `index.html` están los arreglos `PAGINAS` (títulos y textos de
cada página) y `DIFICULTADES` (los carteles del ascenso). El orden de las páginas, la altura de
las plataformas y la velocidad de salto y dash también son constantes con nombre en ese bloque.
