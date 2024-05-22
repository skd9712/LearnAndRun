// 랜덤 검색어 배열
var searchKeywords = ["고등 수학", "중등 국어", "중등 영어", "중등 수학", "고등 영어", "고등 국어"];

// 현재 입력 중인지 확인하는 변수
var isTyping = false;

// input 요소 가져오기
var searchInput = document.getElementById("search_txt");

// 검색어를 한 글자씩 타이핑하는 함수
function typeSearchKeyword(keyword, index) {
    if (!isTyping) {
        //isTyping = true;
        var interval = setInterval(function() {
            searchInput.value = keyword.substring(0, index);
            index++;
            if (index > keyword.length) {
                clearInterval(interval);
                //isTyping = false;
            }
        }, 150); // 한 글자씩 타이핑되는 시간 간격 (ms)
    }
}

// 랜덤 검색어를 표시하는 함수
function showRandomKeyword() {
    if (!isTyping) {
        var randomIndex = Math.floor(Math.random() * searchKeywords.length);
        var keyword = searchKeywords[randomIndex];
        typeSearchKeyword(keyword, 0);
    }
}

// 2초마다 랜덤 검색어 표시
setInterval(showRandomKeyword, 2000);

// input 요소에 포커스 이벤트 리스너 추가
searchInput.addEventListener("focus", function() {
    // 입력 중임을 나타내는 변수 업데이트
    isTyping = true;
});

// input 요소에서 포커스가 벗어날 때
searchInput.addEventListener("blur", function() {
    // 입력 중이 아님을 나타내는 변수 업데이트
    isTyping = false;
});
