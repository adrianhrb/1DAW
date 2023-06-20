window.onload = () => {
    functionAlert();
}

function functionAlert(){
    const boton = document.getElementById('boton');

    boton.addEventListener('click', () => {
        alert("Hola mundo")
    })
}
