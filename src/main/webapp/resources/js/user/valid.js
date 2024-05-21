let userPwd = document.querySelector('#password');
// 입력받은 비밀번호 확인
let pwdCheck = document.querySelector('#pwdCheck');
// 비밀번호 불일치 메세지
let pwdMatch = document.querySelector('.pwd_mismatch');

const isMatch = function (password, pwdCheck) {
    return password === pwdCheck;
}

pwdCheck.onkeyup = function () {
    if (pwdCheck.value.length !== 0) {
        if (isMatch(userPwd.value, pwdCheck.value)) {
            pwdMatch.classList.add('hide');
        } else {
            pwdMatch.classList.remove('hide');
        }
    } else {
        pwdMatch.classList.add('hide');
    }
}

document.querySelector('form').onsubmit = function(e) {
    // 비밀번호와 비밀번호 확인이 일치하는지 확인
    if (!isMatch(userPwd.value, pwdCheck.value)) {
        e.preventDefault(); // 일치하지 않으면 폼 제출 방지
        alert('비밀번호가 일치하지 않습니다.'); // 사용자에게 경고
        pwdMatch.classList.remove('hide'); // 비밀번호 불일치 메세지 표시
    }
}