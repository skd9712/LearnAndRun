$(document).ready(function (){
    $('.id_input').on("propertychange change keyup paste input",function (){
        var userId = $('.id_input').val();
        var data ={userId:userId};

        if(userId.length===0){
            $('.id_null').hide();
            $('.id_notnull').hide();
            return;
        }
        $.ajax({
            type:"POST",
            url:"./checkId",
            data: data,
            dataType: 'text',
            success: function (response){
                if(response==='success'){
                    $('.id_null').show();
                    $('.id_notnull').hide();
                }else {
                    $('.id_null').hide();
                    $('.id_notnull').show();
                }
            },
            error:function (xhr,status,error){
                console.log('Error',error);
            }
        });
    });


});
