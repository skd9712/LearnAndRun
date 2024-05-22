/*
window.onload=function (){
    const lectureDataFile=document.getElementById("lectureDataFile");
    const lectureData=document.getElementById("lectureData");

    lectureDataFile.onchange=function (){
        lectureData.value
            =lectureDataFile.value;
    }
}*/

window.onload=function (){
    const thumbnailFile=document.getElementById("thumbnailFile");
    const thumbnailImg=document.getElementById("thumbnailImg");

    thumbnailFile.onchange=function (){
        thumbnailImg.src=URL.createObjectURL(thumbnailFile.files[0]);
        thumbnailImg.style.width='240px';
        thumbnailImg.style.height='180px';
        thumbnailImg.alt=thumbnailFile.files[0].name;

        const fileType=thumbnailFile.files[0].name.split(".")[1];

    }

    const lectureData=document.getElementById("lectureData");
    const lectureDataFile=document.getElementById("lectureDataFile");

    lectureDataFile.onchange=function (){
        lectureData.value=lectureDataFile.files[0].name;
    }

}