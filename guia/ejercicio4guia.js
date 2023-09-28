// Solicitar al usuario que ingrese una serie de números separados por comas
const numerosInput = prompt("Ingresa una serie de números separados por comas:");

// Dividir la entrada en un array de números
const numerosArray = numerosInput.split(",").map(Number);

// Verificar si se ingresaron números válidos
if (numerosArray.some(isNaN)) {
    alert("Ingresa números válidos separados por comas.");
} else {
    // Encontrar el número más grande
    const numeroMasGrande = Math.max(...numerosArray);

    // Mostrar el número más grande en el navegador
    alert(`El número más grande es: ${numeroMasGrande}`);
}
