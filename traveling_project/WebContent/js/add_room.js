    $(document).ready(function () {
      var stdNumber = 1;
      var maxNumber = 1;
      var stdPeopleNum = $("#std_people_number");
      var maxPeopleNum = $("#max_people_number");
      $("#std_decrease_btn").click(function () {
        if (stdNumber > 1) {
          stdNumber--;
          $("#std_people_input").val(stdNumber);
          stdPeopleNum.text(stdNumber);
        }
      });

      $("#std_increase_btn").click(function () {
        if (stdNumber < 15) {
          stdNumber++;
          $("#std_people_input").val(stdNumber);
          stdPeopleNum.text(stdNumber);
        }
      });

      $("#max_decrease_btn").click(function () {
        if (maxNumber > 1) {
        	maxNumber--;
          $("#max_people_input").val(maxNumber);
          maxPeopleNum.text(maxNumber);
        }
      });

      $("#max_increase_btn").click(function () {
        if (maxNumber < 15) {
        	maxNumber++;
          $("#max_people_input").val(maxNumber);
          maxPeopleNum.text(maxNumber);
        }
      });      
    });
    
    window.onload = function(){    	
    	var sel_files = [];
    	var selectedFiles;
    	var attZone;    	

    	/* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
    	(imageView = function imageView(att_zone, btn) {
    	  attZone = document.getElementById(att_zone);
    	  var btnAtt = document.getElementById(btn);
    	  var errorText = document.getElementById('file_error_text');  

    	  // 이미지와 체크 박스를 감싸고 있는 div 속성
    	  var div_style = "display:inline-block;position:relative;" + "width:18%;height:120px;margin:1%;border:1px solid #ccc;z-index:1";
    	  // 미리보기 이미지 속성
    	  var img_style = "width:100%;height:100%;z-index:none";
    	  // 이미지안에 표시되는 체크박스의 속성
    	  var chk_style =
    	    "width:20px;height:20px;position:absolute;right:5px;bottom:5px;font-size:20px;line-height:1;border:0;border-radius:100%;" +
    	    "z-index:999;background-color:rgba(255,255,255,.7);color:#f00";
    	  
    	  btnAtt.addEventListener("change",function(e){
    		  	var files = e.target.files;
    			selectedFiles = e.target.files.length;
    			attZone = document.getElementById("att_zone");
    			
    			if(selectedFiles < 5){						
    				attZone.innerText = "이미지는 최소 5장 이상 등록해주세요.";
    				attZone.style.color = "red";
    			} else if (selectedFiles > 10){				
    				attZone.innerText = "이미지는 최대 10장까지 등록할 수 있습니다.";
    				attZone.style.color = "red";
    			} else{
    				attZone.innerText = "";
    				var fileArr = Array.prototype.slice.call(files);
    			    for (f of fileArr) {
    			      imageLoader(f);
    			    }		
    			}	      
    	  });

    	    /* 첨부된 이미리즐을 배열에 넣고 미리보기 */
    	  imageLoader = function (file) {
    	    sel_files.push(file);
    	    var reader = new FileReader();
    	    reader.onload = function (ee) {
    	      let img = document.createElement("img");
    	      img.setAttribute("style", img_style);
    	      img.src = ee.target.result;
    	      attZone.appendChild(makeDiv(img, file));
    	    };

    	    reader.readAsDataURL(file);
    	  };

    	  /* 첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
    	  makeDiv = function (img, file) {
    	    var div = document.createElement("div");
    	    div.setAttribute("style", div_style);

    	    var btn = document.createElement("input");
    	    btn.setAttribute("type", "button");
    	    btn.setAttribute("class", "remove_btn");
    	    btn.setAttribute("value", "-");
    	    btn.setAttribute("delFile", file.name);
    	    btn.setAttribute("style", chk_style);
    	    btn.onclick = function (ev) {
    	      selectedFiles--;
    	      if(selectedFiles == 0){
    	    	  attZone.innerText = "이미지는 최소 3장 최대 5장까지 선택할 수 있습니다.";
    	      }
    	      var ele = ev.srcElement;
    	      var delFile = ele.getAttribute("delFile");      
    	      for (var i = 0; i < sel_files.length; i++) {
    	        if (delFile == sel_files[i].name) {
    	          sel_files.splice(i, 1);
    	        }
    	      }

    	      dt = new DataTransfer();
    	      for (f in sel_files) {
    	        var file = sel_files[f];
    	        dt.items.add(file);
    	      }
    	      btnAtt.files = dt.files;
    	      var p = ele.parentNode;
    	      attZone.removeChild(p);
    	    };
    	    div.appendChild(img);
    	    div.appendChild(btn);
    	    return div;
    	  };
    	})("att_zone", "btnAtt");

    	// "전체 삭제" 버튼을 클릭했을 때 모든 파일 미리보기와 선택된 파일을 삭제하는 함수
    	function deleteAllFiles() {
    	  // 모든 파일 미리보기를 포함하는 div 요소들을 가져옵니다.
    	  var fileDivs = document.querySelectorAll("#att_zone > div");
    	  attZone = document.getElementById("att_zone");
    	  attZone.innerText = "이미지는 최소 3장 최대 5장까지 선택할 수 있습니다.";
    	  attZone.style.color = "#999";

    	  // 각 파일 미리보기와 선택된 파일을 삭제합니다.
    	  for (var i = 0; i < fileDivs.length; i++) {
    	    var fileDiv = fileDivs[i];
    	    var fileName = fileDiv.querySelector("input[type='button']").getAttribute("delFile");

    	    // 선택된 파일 목록(sel_files)에서도 삭제합니다.
    	    for (var j = 0; j < sel_files.length; j++) {
    	      if (fileName == sel_files[j].name) {
    	        sel_files.splice(j, 1);
    	        break; // 파일을 찾았으면 루프 종료
    	      }
    	    }

    	    // HTML에서 해당 div 요소를 삭제합니다.
    	    fileDiv.parentNode.removeChild(fileDiv);
    	  }

    	  // 파일 input 태그를 초기화합니다.
    	  var dt = new DataTransfer();
    	  btnAtt.files = dt.files;
    	}
    }
    