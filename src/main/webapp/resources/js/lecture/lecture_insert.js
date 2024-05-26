/* 가격 콤마 */
function getNumber(obj){
    let price = obj.value;
    price = price.replace(/\D/g,"");
    price = setComma(price);
    obj.value =  price;

}

function setComma(n) {
    let reg = /(^[+-]?\d+)(\d{3})/;
    n.toString();
    while (reg.test(n)) {
        n=n.replace(reg, '$1'+','+'$2');
    }
    return n;
}

/* 이미지 미리보기 */
window.onload=function (){
    const thumbnailFile=document.getElementById("thumbnailFile");
    const thumbnailImg=document.getElementById("thumbnailImg");

    thumbnailFile.onchange=function () {
        thumbnailImg.src = URL.createObjectURL(thumbnailFile.files[0]);
        thumbnailImg.alt = thumbnailFile.files[0].name;
        thumbnailImg.style.width="12vw";
        thumbnailImg.style.top="0.7vw";
    }

}