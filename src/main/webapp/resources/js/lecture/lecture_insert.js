/* 이미지 미리보기 */
window.onload=function (){
    const thumbnailFile=document.getElementById("thumbnailFile");
    const thumbnailImg=document.createElement("img");

    thumbnailFile.onchange=function () {
        thumbnailFile.insertAdjacentElement("beforebegin", thumbnailImg);
        thumbnailImg.src = URL.createObjectURL(thumbnailFile.files[0]);
        thumbnailImg.alt = thumbnailFile.files[0].name;
        thumbnailImg.style.width="12vw";
        thumbnailImg.style.height="9vw";
        thumbnailImg.style.top="0.7vw";
    }

    const lectureDataFile=document.getElementById("lectureDataFile");
    const lectureData=document.getElementById("lectureData");

    lectureDataFile.onchange=function (){
        lectureData.value=lectureDataFile.value;
    }

}
