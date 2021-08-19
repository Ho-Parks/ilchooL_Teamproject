/*변수 선언*/


var pw1 = document.querySelector('#user_pw');
var pwMsg1 = document.querySelector('#alertTxt1');
var pwImg1 = document.querySelector('#new_pw_img1');


var pw2 = document.querySelector('#user_pw_re');
var pwImg2 = document.querySelector('#new_pw_re_img1');
var pwMsgArea = document.querySelector('.new_pass');
var mobile = document.querySelector('#phone');

var error = document.querySelectorAll('.error_next_box');



/*이벤트 핸들러 연결*/


pw1.addEventListener("focusout", checkPw1);
pw2.addEventListener("focusout", comparePw);
mobile.addEventListener("focusout", checkPhoneNum);





/*콜백 함수*/



function checkPw1() {
    var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/;
    if (pw1.value == "") {
        error[0].innerHTML = "필수 정보입니다.";
        error[0].style.display = "block";
    } else if (!pwPattern.test(pw1.value)) {
        error[0].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 입력하세요.";
        pwMsg1.innerHTML = "사용불가";
        pwMsgArea.style.paddingRight = "93px";
        error[0].style.display = "block";

        pwMsg1.style.display = "block";
        pwImg1.src = "../assets/img/login_new_not_use.png";
    } else {
        error[0].style.display = "none";
        pwMsg1.innerHTML = "일치";
        pwMsg1.style.display = "block";
        pwMsg1.style.color = "#03c75a";
        pwImg1.src = "../assets/img/login_new_safe.png";
    }
}

function comparePw() {
    if (pw2.value == pw1.value && pw2.value != "") {
        pwImg2.src = "../assets/img/login_new_check_enable.png";
        error[1].style.display = "none";
    } else if (pw2.value !== pw1.value) {
        pwImg2.src = "../assets/img/login_new_check_not.png";
        error[1].innerHTML = "비밀번호가 일치하지 않습니다.";
        error[1].style.display = "block";
    }

    if (pw2.value == "") {
        error[1].innerHTML = "필수 정보입니다.";
        error[1].style.display = "block";
    }
}

function checkPhoneNum() {
    var isPhoneNum = /([01]{2})([01679]{1})([0-9]{4})([0-9]{4})/;

    if (mobile.value == "") {
        error[3].innerHTML = "필수 정보입니다.";
        error[3].style.display = "block";
    } else if (!isPhoneNum.test(mobile.value)) {
        error[3].innerHTML = "형식에 맞지 않는 번호입니다.";
        error[3].style.display = "block";
    } else {
        error[3].style.display = "none";
    }


}

