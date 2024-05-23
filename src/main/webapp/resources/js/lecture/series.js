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
            let tr_div=document.createElement('form');
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
            let td1_txt=document.createTextNode(lecNum);
            td1_div.appendChild(td1_txt);

            /* 세부 강의명 */
            let td2_txt=document.createTextNode(item.detailName);
            td2_div.appendChild(td2_txt);

            /* 세부 강의 링크 */
            let td3_txt=document.createTextNode(item.detailUrl);
            td3_div.appendChild(td3_txt);

            /* 세부 강의 수정 */
            let td4_btn=document.createElement('button');
            let btn_txt=document.createTextNode('수정');
            td4_btn.appendChild(btn_txt);
            td4_div.appendChild(td4_btn);

            let detailNameInput=document.getElementById("detailName");
            let detailUrlInput=document.getElementById("detailUrl");

            td4_btn.addEventListener('click', function (){
                /* 세부 강의명 수정 input */
                let updateDetailName=document.createElement('input');
                updateDetailName.type='text';
                updateDetailName.name='updateDetailName';
                updateDetailName.id='updateDetailName';
                updateDetailName.value=item.detailName;

                /* 세부 강의 URL 수정 input */
                let updateDetailUrl=document.createElement('input');
                updateDetailUrl.type='text';
                updateDetailUrl.name='updateDetailUrl';
                updateDetailUrl.id='updateDetailUrl';
                updateDetailUrl.value=item.detailUrl;


            })

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

            document.getElementById("seriesTable").insertAdjacentElement("beforeend", tr_div);

            lecNum++;
        })
    }).catch(error=>console.log(error))
        .finally(()=>{
            console.log('finally');
        })
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