document.addEventListener("DOMContentLoaded", function () {

    const loginForm = document.querySelector(".login-box");
    if (loginForm) {
        loginForm.addEventListener("submit", function (event) {
            const email = document.querySelector("input[type='email']").value.trim();
            const password = document.querySelector("input[type='password']").value.trim();
            
            if (!validateEmail(email)) {
                alert("Ingrese un correo válido.");
                event.preventDefault();
            }
            if (password.length < 6) {
                alert("La contraseña debe tener al menos 6 caracteres.");
                event.preventDefault();
            }
        });
    }

    const registerForm = document.querySelector("form");
    if (registerForm) {
        registerForm.addEventListener("submit", function (event) {
            const name = document.querySelector("input[name='nombre']").value.trim();
            const email = document.querySelector("input[name='email']").value.trim();
            const password = document.querySelector("input[name='contraseña']").value.trim();
            const repeatPassword = document.querySelector("input[name='repetir_contraseña']").value.trim();
            
            if (name.length < 3) {
                alert("El nombre debe tener al menos 3 caracteres.");
                event.preventDefault();
            }
            if (!validateEmail(email)) {
                alert("Ingrese un correo válido.");
                event.preventDefault();
            }
            if (password.length < 6) {
                alert("La contraseña debe tener al menos 6 caracteres.");
                event.preventDefault();
            }
            if (password !== repeatPassword) {
                alert("Las contraseñas no coinciden.");
                event.preventDefault();
            }
        });
    }
});

function validateEmail(email) {
    const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return regex.test(email);
}
