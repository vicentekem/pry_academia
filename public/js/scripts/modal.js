
function openModal(e) {
  e.preventDefault();
  
    $('#modal_change_pass').modal('show')

}

function cambioPass (){
    let old_password = $("#txt_pass_act").val();
    let password = $("#txt_new_pass").val();
    let repeat_password = $("#txt_repeat_pass").val();

    let data = {
        old_password:old_password,
        password:password,
        repeat_password:repeat_password

    } 

    ajaxRequest("change_pass","get","UsuarioController.php",data,
    (result) => {
        showMessage('correcto', 'success')
    });

}

document.addEventListener("DOMContentLoaded", () => {
    const btn_open_modal = document.querySelector("#btn_open_modal");

    const btn_change_pass = document.querySelector("#btn_change_pass");

    btn_open_modal.addEventListener("click", openModal);
    btn_change_pass.addEventListener("click", cambioPass);
});
