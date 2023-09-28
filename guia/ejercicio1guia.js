// Solicitar al usuario un número entero positivo
var numeroIngresado = parseInt(prompt("Ingrese un número entero positivo:"));

// Verificar si el número ingresado es un entero positivo
if (numeroIngresado > 0 && Number.isInteger(numeroIngresado)) {
  var sumaPares = 0;

  // Utilizar un bucle for para calcular la suma de números pares
  for (var i = 2; i <= numeroIngresado; i += 2) {
    sumaPares += i;
  }

  // Mostrar el resultado en el navegador
  document.write("La suma de números pares desde 1 hasta " + numeroIngresado + " es: " + sumaPares);
} else {
  // Mostrar un mensaje de error si el usuario ingresa un número no válido
  alert("Por favor, ingrese un número entero positivo.");
}
