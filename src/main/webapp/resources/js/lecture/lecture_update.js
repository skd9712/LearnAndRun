/* 이미지 미리보기 & 강의 자료명 미리보기 */
window.onload=function (){
    const thumbnailFile=document.getElementById("thumbnailFile");
    const thumbnailImg=document.getElementById("thumbnailImg");

    thumbnailFile.onchange=function () {
        thumbnailImg.src = URL.createObjectURL(thumbnailFile.files[0]);
        thumbnailImg.alt = thumbnailFile.files[0].name;
    }

    const lectureDataFile=document.getElementById("lectureDataFile");
    const lectureData=document.getElementById("lectureData");

    lectureDataFile.onchange=function (){
        lectureData.value=lectureDataFile.value;
    }

}