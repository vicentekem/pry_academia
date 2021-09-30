// variables
const modal = document.querySelector('#modalist')


eventListener();
function eventListener(){
    modal.addEventListener('click', cambioPass);

} 

function cambioPass(e){
    e.preventDefault();
    console.log('denis');   
    
}

