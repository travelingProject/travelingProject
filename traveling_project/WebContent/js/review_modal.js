$(document).ready(function() {
	// 모달 열기
    $(".review_modal").click(function() {
        // 클릭한 작성하기 버튼이 속한 ul 요소를 선택
        var $reservationInfo = $(this).closest("ul.index_list");

        // ul 요소 내에서 이미 가져온 데이터를 읽음
        var stayName = $reservationInfo.find(".r_stay_name").text();
        var chkDate = $reservationInfo.find(".r_chk_date").text();

        // 모달에 예약 정보 추가
        $("#rm_header h3").text(stayName);
        $("#rm_header span").text(chkDate);

        // 모달 열기
        $("#review_modal_wrap").css("display", "block");
        $("#review_modal_wrap").show();
        $("body").css("overflow", "hidden");
    });

	// 모달 닫기 오른쪽 위 X
	$(".close_btn").click(function() {
		if (confirm("저장되지 않은 정보는 복원할 수 없습니다. 종료하시겠습니까?")) {
			$("#review_modal_wrap").hide();
			$("body").css("overflow", "auto");
			$("#review_form")[0].reset();
		}
	});
	
	// 모달 닫기 취소 버튼
	$("#can_btn").click(function() {
		if (confirm("저장되지 않은 정보는 복원할 수 없습니다. 취소하시겠습니까?")) {
			$("#review_modal_wrap").hide();
			$("body").css("overflow", "auto");
			$("#review_form")[0].reset();
		}
	});
	
	// 제목, 내용, 별점이 입력되지 않았으면 submit 안되도록
	$("#review_form").submit(function(event) {
        // 제목, 내용, 별점 값 가져오기
        var rtitle = $("#rtitle").val();
        var rcontent = $("#rcontent").val();
        var rating = $("input[name='rating']:checked").val();

        // 제목, 내용, 별점이 비어있는 경우 제출 방지
        if (rtitle === "" || rcontent === "" || rating === undefined) {
            alert("제목, 내용, 별점을 모두 입력해주세요.");
            event.preventDefault(); // 폼 제출 방지
        }
    });
	
});

// 이미지 업로드 관련
var fileNo = 0;3
var filesArr = new Array();

//첨부파일 추가
function addFile(obj) {
    var maxFileCnt = 5; // 첨부파일 최대 개수
    var attFileCnt = $(".file_list .filebox").length; // 기존 추가된 첨부파일 개수
    var remainFileCnt = maxFileCnt - attFileCnt; // 추가로 첨부가능한 개수
    var curFileCnt = obj.files.length; // 현재 선택된 첨부파일 개수

    // 첨부파일 개수 확인
    if (curFileCnt > remainFileCnt) {
        alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
    } else {
        // 기존 파일들을 DataTransfer 객체에 추가
        var dataTransfer = new DataTransfer();
        filesArr.forEach(function(file) {
            dataTransfer.items.add(file);
        });

        for (const file of obj.files) {
            if (validation(file)) {
                // 파일 배열에 담기
                filesArr.push(file);

                // 목록 추가
                let htmlData = '';
                htmlData += '<div id="file' + fileNo + '" class="filebox">';
                htmlData += '   <p class="name">' + file.name + '</p>';
                htmlData += '   <a class="delete" onclick="deleteFile(' + fileNo + ');"><img src="./images/remove.png" alt="Delete"></a>';
                htmlData += '</div>';
                $('.file_list').append(htmlData);
                fileNo++;
            } else {
                continue;
            }
        }

        // 파일 입력 필드의 파일 목록을 업데이트
        obj.files = dataTransfer.files;
    }
    // 초기화
    $(obj).val("");
}

/* 첨부파일 검증 */
function validation(obj){
   const fileTypes = ['image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/tif'];
   if (obj.name.length > 100) {
       alert("파일명이 100자 이상인 파일은 제외되었습니다.");
       return false;
   } else if (obj.size > (100 * 1024 * 1024)) {
       alert("최대 파일 용량인 100MB를 초과한 파일은 제외되었습니다.");
       return false;
   } else if (obj.name.lastIndexOf('.') == -1) {
       alert("확장자가 없는 파일은 제외되었습니다.");
       return false;
   } else if (!fileTypes.includes(obj.type)) {
       alert("첨부가 불가능한 파일은 제외되었습니다.");
       return false;
   } else {
       return true;
   }
}

//첨부파일 삭제
function deleteFile(num) {
    // 파일 삭제 대상을 마크합니다.
    filesArr[num].is_delete = true;
    $('#file' + num).remove();

    // 삭제되지 않은 파일들을 골라 새로운 배열을 만듭니다.
    const remainingFiles = filesArr.filter(file => !file.is_delete);

    // 파일 입력 필드의 ID를 기반으로 해당 입력 필드를 선택합니다.
    const inputFieldId = 'rimg'; // 여기에 파일 입력 필드의 ID를 지정합니다.
    const inputField = document.querySelector(`#${inputFieldId}`);

    // DataTransfer 객체를 생성합니다.
    const dataTransfer = new DataTransfer();

    // 남은 파일들을 DataTransfer 객체에 추가합니다.
    remainingFiles.forEach(file => {
        dataTransfer.items.add(file);
    });

    // 파일 입력 필드의 파일 목록을 업데이트합니다.
    inputField.files = dataTransfer.files;
}
