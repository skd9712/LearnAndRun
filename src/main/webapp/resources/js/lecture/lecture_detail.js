/*
window.onclick=function (){
    let wish_btn=document.getElementById("wish");
    let star=document.querySelector(".fa-star");

    wish_btn.addEventListener('click', function (){

    })
}*/

const init_json=function (){
    fetch("", {
        method: "GET"
        , headers: {
            'Accept':'application/json'
        }
    }).then(response=>{
        if(!response.ok)
            throw new Error('not load');
        return response.json();
    }).then(data=>{
        data.forEach(item=>{

        })
    }).catch(error=>console.log(error))
        .finally(()=>{
            console.log('finally');
        });
}


window.onload=function (){
    init_json();

    document.getElementById("wish").onclick=function (){


    }

}
