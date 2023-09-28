// Solicitamos al usuario que ingrese una oración
const oracion = prompt("Ingresa una oración:");

// Dividimos la oración en palabras utilizando un espacio en blanco como separador
const palabras = oracion.split(" ");

// Contamos cuántas palabras hay en la oración
const numeroDePalabras = palabras.length;

// Mostramos la oración ingresada y el número de palabras en el navegador
document.write("Oración ingresada: " + oracion + "<br>");
document.write("Número de palabras: " + numeroDePalabras);
