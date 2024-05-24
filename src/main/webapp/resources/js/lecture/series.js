let num='';
const init=function (data){
    num=data;
}

let lecNum=1;

const init_json=function (){
    fetch("/listSeries/"+num, {
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
            let tr_div=document.createElement('div');
            let td1_div=document.createElement('div');
            let td2_div=document.createElement('div');
            let td3_div=document.createElement('div');
            let td4_div=document.createElement('div');
            let td5_div=document.createElement('div');

            /* 클래스 지정 */
            tr_div.className='seriesTr';
            td1_div.className='seriesTd';
            td2_div.className='seriesTd';
            td3_div.className='seriesTd';
            td4_div.className='seriesTd';
            td5_div.className='seriesTd';

            /* 세부 강의 순서 */
            let td1_txt=document.createTextNode(lecNum+"강");
            td1_div.appendChild(td1_txt);

            /* 세부 강의명 */
            let td2_txt=document.createTextNode(item.detailName);
            td2_div.appendChild(td2_txt);

            /* 세부 강의 링크 */
            let lectureName=document.getElementById("lectureName").value;

            let td3_a=document.createElement('a');
            td3_a.href="/lecture_class/"+num+"/"+lectureName+"/"+item.seriesNo;
            let a_icon=document.createElement('img');
            a_icon.src="/resources/img/lecture/free-icon-youtube-logo-87421.png";
            a_icon.className='lectureIcon';
            td3_a.appendChild(a_icon);
            td3_div.appendChild(td3_a);


            /* 관리자인 경우에만 수정&삭제 버튼 추가 */
            let authority=document.getElementById("authority").value;

            if(authority==="admin"){
                /* 세부 강의 수정 */
                const update_btn=document.createElement('button');
                const btn_txt=document.createTextNode('수정');
                update_btn.appendChild(btn_txt);
                td4_div.appendChild(update_btn);
                let updateOk_btn='';
                update_btn.className='update_btn';
                updateOk_btn.className='update_btn';

                let detailNameInput=document.getElementById("detailName");
                let detailUrlInput=document.getElementById("detailUrl");
                let lecture_No=document.getElementById("lectureNo").value;

                update_btn.addEventListener('click', function (){
                    /* 세부 강의명 수정 */
                    let updateDetailName=document.createElement('input');
                    updateDetailName.type='text';
                    updateDetailName.name='updateDetailName';
                    updateDetailName.id='updateDetailName';
                    updateDetailName.value=item.detailName;

                    td2_div.textContent="";
                    td2_div.appendChild(updateDetailName);

                    /* 세부 강의 URL 수정 */
                    let updateDetailUrl=document.createElement('input');
                    updateDetailUrl.type='text';
                    updateDetailUrl.name='updateDetailUrl';
                    updateDetailUrl.id='updateDetailUrl';
                    updateDetailUrl.value=item.detailUrl;

                    td3_div.textContent="";
                    td3_div.appendChild(updateDetailUrl);

                    updateOk_btn=document.createElement('button');
                    let updateOk_txt=document.createTextNode('수정완료');
                    updateOk_btn.appendChild(updateOk_txt);

                    updateOk_btn.addEventListener('click', function (){
                        location.href="/updateSeries/"+lecture_No+"/"+item.seriesNo+"/"
                            +updateDetailName.value+"/"+updateDetailUrl.value;
                    });

                    td4_div.removeChild(update_btn);
                    td4_div.appendChild(updateOk_btn);

                });

                /* 세부 강의 삭제 */
                let td5_a=document.createElement('a');
                td5_a.href='/deleteSeries/'+num+'/'+item.seriesNo;
                let td5_a_txt=document.createTextNode('삭제');
                td5_a.appendChild(td5_a_txt);
                td5_div.appendChild(td5_a);

                /* 세부 강의 테이블에 추가 */
                tr_div.appendChild(td1_div);
                tr_div.appendChild(td2_div);
                tr_div.appendChild(td3_div);
                tr_div.appendChild(td4_div);
                tr_div.appendChild(td5_div);

            }else{
                tr_div.appendChild(td1_div);
                tr_div.appendChild(td2_div);
                tr_div.appendChild(td3_div);
            }

            document.getElementById("seriesTable").insertAdjacentElement("beforeend", tr_div);

            lecNum++;
        })
    }).catch(error=>console.log(error))
        .finally(()=>{
            console.log('finally');
        });
} // 세부 강의 리스트


window.onload=function (){
   init_json();

   document.getElementById("append").onclick=function (){

       console.log(document.getElementById('detailName').value)
       console.log(document.getElementById('detailUrl').value)
       console.log(document.getElementById('lectureNo').value)

       /* 폼 입력값 받기 */
       let detailName=document.getElementById("detailName");
       let detailUrl=document.getElementById("detailUrl");
       let lecture_No=document.getElementById("lectureNo");
       let lectureNoValue=document.getElementById("lectureNo").value;

       /* 입력값 객체에 넣기 */
       let seriesInput={'detailName': detailName.value
           , 'detailUrl': detailUrl.value
           , 'lectureNo': lecture_No.value}

       /* 입력창 초기화 */
       detailName.value='';
       detailUrl.value='';
       lecture_No.value='';

       /* json으로 넘기기 */
       fetch("/insertSeries", {
           method: "POST"
           , headers: {
               'Content-Type':'application/json;charset=utf-8'
               , 'Accept':'application/json'
           }
           , body: JSON.stringify(seriesInput)
       }).then(response=>{
           if(response.status===200)
               console.log('저장완료');
           else if(response.status===403)
               console.log('code-403error');
           return response.json();
       }).then(data=>{
           console.log('data......', data);

       }).catch(error=>{
           console.log('error......', error);

       }).finally(()=>{
           console.log('finally');
       });

       // location.href="/lecture_detail/"+lectureNoValue;
       location.reload();
   }

}