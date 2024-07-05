const infoChk = {
  pw: false,
}

/**
 * 아이디 입력값 검증
 * @param $idInput 검증할 input 태그
 * @param $idChk 메시지 표시할 태그
 */
const checkIdInput = ($idInput, $idChk) => {
  $idInput.addEventListener("keyup", async function (e) {
    const idPattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+$/;
    const value = e.target.value;

    if (value.trim() === "") {
      $idChk.innerHTML = '<b class="warning">[아이디를 입력해주세요]</b>';
    } else if (!idPattern.test(value)) {
      $idChk.innerHTML = '<b class="warning">[아이디는 4~14자의 영문 대소문자와 숫자로만 입력해주세요]</b>';
    }
  });
}

/**
 * 비밀번호 입력값 검증
 * @param $pwInput 검증할 input 태그
 * @param $pwChkInput 비밀번호 확인 input 태그
 * @param $pwChk 비밀번호 메시지 태그
 * @param $submitBtn submit 버튼
 */
const checkPwInput = ($pwInput, $pwChkInput, $pwChk, $submitBtn) => {
  $pwInput.addEventListener("keyup", function (e) {
    const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,20}$/;
    const value = e.target.value;

    $pwChkInput.disabled = true;
    if (value.trim() === "") {
      $pwChk.innerHTML = '<b class="warning">[비밀번호를 입력해주세요]</b>';
    } else if (!passwordPattern.test(value)) {
      $pwChk.innerHTML = '<b class="warning">[비밀번호는 8~20자의 영문 대소문자, 숫자, 특수문자를 포함해주세요]</b>';
    } else {
      $pwChkInput.disabled = false;
      $pwChk.innerHTML = '<b class="success">[사용 가능한 비밀번호입니다.]</b>';
    }
    checkInfo($submitBtn);
  });
}

/**
 * 비밀번호 확인 입력값 검증
 * @param $pwInput
 * @param $pwChkInput
 * @param $pwChk
 * @param $submitBtn
 */
const checkPwChkInput = ($pwInput, $pwChkInput, $pwChk, $submitBtn) => {
  $pwChkInput.addEventListener("keyup", function (e) {
    const value = e.target.value;

    if (value === $pwInput.value) {
      $pwChk.innerHTML = '<b class="success">[비밀번호가 일치합니다.]</b>';
      infoChk.pw = true;
    } else {
      $pwChk.innerHTML = '<b class="warning">[비밀번호가 일치하지 않습니다.]</b>';
    }
    checkInfo($submitBtn);
  });
}

/**
 * @param $submitBtn
 */
function checkInfo($submitBtn) {
  $submitBtn.disabled = true;
  $submitBtn.style.backgroundColor = "gray";
  for (let key in infoChk) {
    if (!infoChk[key]) {
      return;
    }
  }
  $submitBtn.disabled = false;
  $submitBtn.style.backgroundColor = "orange";
}

export { checkIdInput, checkPwInput, checkPwChkInput };
