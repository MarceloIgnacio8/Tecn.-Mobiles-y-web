function verificarContrasena() {
  const contrasena = document.getElementById('password').value;
  const resultadoDiv = document.getElementById('resultado');
  resultadoDiv.innerHTML = ''; // Limpiar resultados anteriores

  // Requisitos para una contraseña válida
  const longitudMinima = 8;
  const contieneMayuscula = /[A-Z]/.test(contrasena);
  const contieneNumero = /\d/.test(contrasena);
  const contieneCaracterEspecial = /[!@#$%^&*()_+{}[\]:;<>,.?~\\-]/.test(contrasena);

  if (
    contrasena.length >= longitudMinima &&
    contieneMayuscula &&
    contieneNumero &&
    contieneCaracterEspecial
  ) {
    const mensaje = 'La contraseña es válida.';
    const mensajeElement = document.createElement('p');
    mensajeElement.textContent = mensaje;
    resultadoDiv.appendChild(mensajeElement);
  } else {
    const mensaje = 'La contraseña no cumple con los requisitos de seguridad.';
    const mensajeElement = document.createElement('p');
    mensajeElement.textContent = mensaje;
    resultadoDiv.appendChild(mensajeElement);
  }
}
