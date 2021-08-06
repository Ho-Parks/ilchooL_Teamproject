$(function() {
    /** 유효성 검사 플러그인이 ajaxForm보다 먼저 명시되어야 한다. */
    $('#join-form').validate({
        rules: {
            // [아이디] 필수 + 알파벳,숫자 조합만 허용
            user_id: {
                required: true,
                alphanumeric: true,
                minlength: 4,
                maxlength: 30,
                remote: {
                    url: ROOT_URL + '/account/id_unique_check_jquery',
                    type: 'post',
                    data: {
                        user_id: function() {
                            return $("#user_id").val();
                        }
                    }
                }
            },
            // [비밀번호] 필수 + 글자수 길이 제한
            user_pw: { required: true, minlength: 4, maxlength: 30 },
            // [비밀번호 확인] 필수 + 특정 항목과 일치 (id로 연결)
            user_pw_confirm: { required: true, equalTo: '#user_pw' },
            // [이름] 필수
            user_name: { required: true, kor: true, minlength: 2, maxlength: 30 },
            // [이메일] 필수 + 이메일 형식 일치 필요
            email: {
                required: true,
                email: true,
                maxlength: 255
            },
            // [연락처] 필수
            phone: { required: true, phone: true, minlength: 9, maxlength: 11 },
            // [생년월일] 필수 + 날짜 형식 일치 필요
            birthday: { required: true, date: true },
            // [성별] 필수 입력
            gender: 'required',
            // [우편번호] 필수 입력
            postcode: 'required',
            // [주소1] 우편번호가 입력된 경우만 필수
            addr1: 'required',
            // [주소2] 우편번호가 입력된 경우만 필수
            addr2: 'required',
            // 허용할 확장자 명시
            photo: { extension: 'jpg|gif|png' },
        },
        messages: {
            user_id: {
                required: '아이디를 입력하세요.',
                alphanumeric: '아이디는 영어,숫자만 입력 가능합니다.',
                minlength: '아이디는 최소 {0}글자 이상 입력하셔야 합니다.',
                maxlength: '아이디는 최대 {0}글자까지 가능합니다.',
                remote: '이미 사용중인 아이디 입니다.'
            },
            user_pw: {
                required: '비밀번호를 입력하세요.',
                minlength: '비밀번호는 최소 {0}글자 이상 입력하셔야 합니다.',
                maxlength: '비밀번호는 최대 {0}글자까지 가능합니다.',
            },
            user_pw_confirm: {
                required: '비밀번호 확인값을 입력하세요.',
                equalTo: '비밀번호 확인이 잘못되었습니다.',
            },
            user_name: {
                required: '이름을 입력하세요.',
                kor: '이름은 한글만 입력 가능합니다.',
                minlength: '이름은 최소 {0}글자 이상 입력하셔야 합니다.',
                maxlength: '이름은 최대 {0}글자까지 가능합니다.',
            },
            email: {
                required: '이메일을 입력하세요.',
                email: '이메일 형식이 잘못되었습니다.',
                maxlength: '이메일은 최대 {0}글자까지 가능합니다.'
            },
            phone: {
                required: '연락처를 입력하세요.',
                phone: '연락처 형식이 잘못되었습니다.',
                minlength: '연락처는 최소 {0}글자 이상 입력하셔야 합니다.',
                maxlength: '연락처는 최대 {0}글자까지 가능합니다.',
            },
            birthday: {
                required: '생년월일을 입력하세요.',
                date: '생년월일의 형식이 잘못되었습니다.',
            },
            gender: '성별을 선택해 주세요.',
            postcode: '우편번호를 입력해 주세요.',
            addr1: '기본주소를 입력해 주세요.',
            addr2: '상세주소를 입력해 주세요.',
            photo: {
                extension: '프로필 사진은 jpg,png,gif 형식만 가능합니다.',
            },
        },
    });

    $('#join-form').ajaxForm({
        // submit 전에 호출된다.
        beforeSubmit: function(arr, form, options) {
            // validation 플러그인을 수동으로 호출하여 결과를 리턴한다.
            // 검사규칙에 위배되어 false가 리턴될 경우 submit을 중단한다.
            return $(form).valid();
        },
        success: function(json) {
            swal('알림', '회원가입이 완료되었습니다. 로그인 해 주세요.', 'success').then(function(result) {
                window.location = ROOT_URL + '/account/login';
            });
        },
    }); // end ajaxForm

    $("#id-unique-check").click(function(e) {
        const userId = $("#user_id").val();

        if (!userId) {
            swal('알림', '아이디를 입력하세요.', 'warning');
            return;
        }

        $.post(ROOT_URL + '/rest/account/id_unique_check', {
            user_id: userId
        }, function(json) {
            swal('확인', '사용가능한 아이디 입니다.', 'success');
        });
    });

   
});