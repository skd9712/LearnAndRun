IMP.init('imp43374577'); //고객사 식별 코드

//html에서 각 요소(버튼, 텍스트 데이터)들을 가져옴
const button = document.querySelector("button");
const uid = document.getElementById('payer_uid').value;
const lid = document.getElementById('lecture_no').value;
const pname = document.getElementById('product_name').textContent;
const total_price = document.getElementById('order_total').textContent;
const teacher_name = document.getElementById('teacher_name').textContent;
const order_no = "order_"+uid+"_"+"1";

const onClickPay = async () => {
    //결제 정보 넘김
    IMP.request_pay({
        //pg사 - 카카오페이 간편결제
        pg:"kakaopay"
        , pay_method: "card"
        , amount: total_price.toString()
        , name: pname.toString()
        , merchant_uid: order_no.toString()
    }, function (response) {

        if ( response.success ) { //결제 성공 시
            pay_info(response);

        } else { //결제 실패 시
            alert(response.error_msg);
            location.href="/lecture_detail/"+lid;
        }

    });
};

function pay_info(rsp){ //결제 정보를 다른 곳으로 넘기는 작업(JS->JSP/Servlet)

    // form에 input태그를 이용해서 넘김

    let form = document.createElement('form');
    let objs;

    //주문번호
    objs = document.createElement('input');
    objs.setAttribute('type', 'hidden');
    objs.setAttribute('name', 'order_id');
    objs.setAttribute('value', rsp.merchant_uid);
    form.appendChild(objs);

    //강의명
    objs = document.createElement('input');
    objs.setAttribute('type', 'hidden');
    objs.setAttribute('name', 'buy_product_name');
    objs.setAttribute('value', rsp.name);
    form.appendChild(objs);

    //구매자 uid
    objs = document.createElement('input');
    objs.setAttribute('type', 'hidden');
    objs.setAttribute('name', 'buyer_buyid');
    objs.setAttribute('value', uid);
    form.appendChild(objs);

    //강의 lid
    objs = document.createElement('input');
    objs.setAttribute('type', 'hidden');
    objs.setAttribute('name', 'lecture_id');
    objs.setAttribute('value', lid);
    form.appendChild(objs);

    //결제 결과
    objs = document.createElement('input');
    objs.setAttribute('type', 'hidden');
    objs.setAttribute('name', 'buyer_pay_ok');
    objs.setAttribute('value', rsp.success);
    form.appendChild(objs);

    //결제 금액
    objs = document.createElement('input');
    objs.setAttribute('type', 'hidden');
    objs.setAttribute('name', 'total_price');
    objs.setAttribute('value', total_price); //테스트 결제는 rsp에 amount값이 넘어오지 않기 때문에 rsp에서 받아오지 않음
    form.appendChild(objs);

    //강사명
    objs = document.createElement('input');
    objs.setAttribute('type', 'hidden');
    objs.setAttribute('name', 'teacher_name');
    objs.setAttribute('value', teacher_name);
    form.appendChild(objs);

    form.setAttribute('method', 'post');
    form.setAttribute('action','/order_result');
    document.body.appendChild(form);
    form.submit();

}

button.addEventListener("click", onClickPay);
