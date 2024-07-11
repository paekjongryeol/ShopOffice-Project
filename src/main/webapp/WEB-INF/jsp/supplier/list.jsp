<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  
  <main id="main" class="main">

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body" style="padding-top: 20px;">
              <!-- General Form Elements -->
              <form id="searchform">
              <input type="hidden" id="currentPage" name="currentPage">
              
              <table class="col-lg-12">
			    <tr>
			        <td>
			            <div class="row mb-2">
			                <label for="inputText" class="col-sm-3 col-form-label">거래처명</label>
			                <div class="col-sm-3">
			                    <input type="text" class="form-control" name="supplierName">
			                </div>
			            </div>
			        </td>
			        <td>
			            <div class="row mb-2">
			                <label for="inputText" class="col-sm-4 col-form-label">거래처상태</label>
			                <div class="col-sm-6">
			                    <select name="supplierStatus" class="form-control" style="width: 150px;">
			                        <option value="">거래상태</option>
			                        <option value="거래중">거래중</option>
			                        <option value="거래중지">거래중지</option>
			                    </select> 
			                </div>
			            </div>      
			        </td>
			        <td>
			            <button type="button" class="btn btn-info" onclick='supplierSearch();'>조회</button>
			            <button type="button" class="btn btn-info" onclick='supplierInsert();'>신규</button>
			        </td>
			        </tr>
			    </table>
                
            </div>
          </div>
          		</form>
           <div class="card">
            <div class="card-body">
            
              <!-- Table with hoverable rows -->
          <div class="row mb-3 justify-content-end">
		  </div>
              <table id="supplierTable" class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col">No</th>
                    <th scope="col">거래처코드</th>
                    <th scope="col">거래처명</th>
                    <th scope="col">대표명</th>
                    <th scope="col">전화번호</th>
                    <th scope="col">담당자명</th>
                    <th scope="col">담당자연락처</th>
                    <th scope="col">담당자이메일</th>
                    <th scope="col">거래상태</th>
                    <th scope="col">등록일</th>
                  </tr>
                </thead>
                <tbody>
                
				</tbody>
              </table>
			
              <!-- End Table with hoverable rows -->
			  <!-- End Table with hoverable rows -->
			  <nav aria-label="Page navigation example">
				<ul class="pagination" id="supplierPaging" >
				
				</ul>
              </nav><!-- End Pagination with icons -->
			     	
			    
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
	
	
	 <div class="modal fade" id="supplierInfo" tabindex="-1" aria-labelledby="orderModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="supplierModalLabel">거래처 등록/수정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
          <div id="modalTable" class="row mb-3 justify-content-end">
		  </div>
		  <form id="modalform">
            <div class="modal-body">
	        <table class="table table-hover" >
	          <tbody>
	            <tr>
				    <th scope="col">거래처코드</th>
				    <td ><input type='text' id='supplierCd' name='supplierCd' readonly="readonly"></td>
				    <th scope="col">(상품코드는 수정이 불가합니다.)</th>
				</tr>
				<tr>
				    <th scope="col">거래처명</th>
				    <td><input type='text' id="supplierName" name="supplierName"></td>
				</tr>
				<tr>
				    <th scope="col">대표명</th>
				    <td><input type='text' id="supplierCeo" name="supplierCeo"></td>
				</tr>
				<tr>
				    <th scope="col">전화번호</th>
				    <td><input type='text' id="phone" name="phone" style="width:50px;">
				    -<input type='text' id="phone2" name="phone2" style="width:70px;">
				    -<input type='text' id="phone3" name="phone3" style="width:70px;"></td>
				</tr>
				<tr>
				    <th scope="col">담당자명</th>
				    <td><input type='text' id="opName" name="opName"></td>
				</tr>
				<tr>
				    <th scope="col">담당자연락처</th>
				    <td><input type='text' id="opPhone" name="opPhone" style="width:50px;">
				    -<input type='text' id="opPhone2" name="opPhone2" style="width:70px;">
				    -<input type='text' id="opPhone3" name="opPhone3" style="width:70px;"></td>
				</tr>
				<tr>
				    <th scope="col">담당자이메일</th>
				    <td>
				        <div class="input-group">
				            <input type="text" id="opEmail" name="opEmail" class="form-control" style="width: 140px;"> 
				            @ 
				            <input type="text" id="opEmail2" name="opEmail2" class="form-control" style="width: 130px;"> 
				            <div class="input-group-append">
				                <select id="supplierEmailDomain" onchange="selectEmail(this)" class="form-control" style="width: 140px;">
				                    <option value="" disabled selected>선택하세요</option>
				                    <option value="1">직접입력</option>
				                    <option value="naver.com">naver.com</option>
				                    <option value="daum.net">daum.net</option>
				                    <option value="gmail.com">gmail.com</option>
				                    <option value="kakao.com">kakao.com</option>
				                </select>
				            </div>
				        </div>
				    </td>
				</tr>
				<tr>
				    <th scope="col">거래상태</th>
				    <td>
				    <select id="supplierStatus" name="supplierStatus" class="form-control" style="width: 150px;">
			                    <option value="">거래상태</option>
			                    <option value="거래중">거래중</option>
			                    <option value="거래중지">거래중지</option>
			        </select> 
			        </td>
				</tr>
	          </tbody>
	        </table>	     
	      </div>
	      </form>
	      <div class="modal-footer">
	      <button type="button" id='btnUpdate' class="btn btn-secondary" data-bs-dismiss="modal" onclick='supplierUp();'>저장</button> <!-- 수정 -->
          <button type="button" id='btnInsert' class="btn btn-secondary" data-bs-dismiss="modal" onclick='supplierIn();'>저장</button> <!-- 등록 -->
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div><!-- End Vertically centered Modal-->
	
			<form id="hiddenform">
			<input type="hidden" id="hSupplierCd" name="supplierCd">
			</form>
  <script src="/assets/js/paging.js"></script>
  <script>
  	
	function supplierSearch(no) {
		if(no==undefined){
			$('#currentPage').val(1);
		}else{
			$('#currentPage').val(no);
		}
		call_server(searchform, '/supplier/searchlist', getSupplierList);
	}
	
	function getSupplierList(vo) {
		list = vo.supplierlist;
	    $('#supplierTable > tbody').empty();
	    for (var i = 0; i < list.length; i++) {
	    	var str = "<tr onclick=\"supplierDetail('" + list[i].supplierCd + "');\" style=\"cursor:pointer;\">";
	        str += "<th scope=\"row\">" + ((Number(vo.currentPage) - 1) * vo.countPerPage + (i + 1)) + "</th>";
	        str += "<td>" + list[i].supplierCd + "</td>"
	        str += "<td>" + list[i].supplierName + "</td>"
	        str += "<td>" + list[i].supplierCeo + "</td>"
	        str += "<td>" + list[i].phone + "</td>"
	        str += "<td>" + list[i].opName + "</td>"
	        str += "<td>" + list[i].opPhone + "</td>"
	        str += "<td>" + list[i].opEmail + "</td>"
	        str += "<td>" + list[i].supplierStatus + "</td>"
	        str += "<td>" + list[i].regDt + "</td>"
	        str += "</tr>";
	        $('#supplierTable > tbody').append(str);
	    }
	    setPaging(supplierPaging, vo.startPage, vo.endPage, 'supplierSearch');
	    
	}
	
	function supplierDetail (vo) {
		$('#hSupplierCd').val(vo);
		call_server(hiddenform, '/supplier/supplierDetail', supplierModal);
	}
	
	function supplierModal (vo) {
	    $('#supplierCd').val(vo.supplierCd);
	    $('#supplierName').val(vo.supplierName);
	    $('#supplierCeo').val(vo.supplierCeo);
	    
	    phone = vo.phone.split('-');
	    
	    $('#phone').val(phone[0]);
	    $('#phone2').val(phone[1]);
	    $('#phone3').val(phone[2]);
	    
	    $('#opName').val(vo.opName);
	    
	    opPhone = vo.opPhone.split('-');
	    $('#opPhone').val(opPhone[0]);
	    $('#opPhone2').val(opPhone[1]);
	    $('#opPhone3').val(opPhone[2]);
	    
	    //$('#opEmail').val(vo.opEmail);
	    
	    var email = vo.opEmail.split('@');   //ex@example.com
	    $('#opEmail').val(email[0]);		//ex
	    $('#opEmail2').val(email[1]);		//example.com
	    
	    $('#supplierStatus').val(vo.supplierStatus);
	    
	    $('#btnUpdate').show();				//업그레이드창 출력
		$('#btnInsert').hide();				//신규등록창 숨김
		$('#supplierInfo').modal('show');
	}
	
	function supplierInsert() {
		$('#btnUpdate').hide();
		$('#btnInsert').show();
	    $('#supplierCd').removeAttr('readonly');
	    resetForm(); // 입력 필드 초기화
	    $('#supplierInfo').modal('show');
	}
	
	function resetForm() {
	    // 입력 필드의 값을 초기화
	    $('#supplierCd').val('');
	    $('#supplierName').val('');
	    $('#supplierCeo').val('');
	    $('#phone').val('');
	    $('#opName').val('');
	    $('#opPhone').val('');
	    $('#opEmail').val('');
	    $('#supplierStatus').val('');
	}
	
	function supplierUp () {
		call_server(modalform, '/supplier/updateSupplierInfo', updateAram)
		
	}
	
	function supplierIn () {
		call_server(modalform, '/supplier/insertSupplierInfo', updateAram)
		
	}
	
	function updateAram (cnt) {
		if(cnt>0){
			alert('저장되었습니다.');
			$('#supplierInfo').modal('hide');
			resetForm();
		}else{
			alert("수정시 오류발생하엿습니다.");
		}
	}
	
	function selectEmail(ele) {
	    var $ele = $(ele);
	    var $opEmail2 = $('#opEmai2');
	    var $opEmail2 = $('input[name=opEmail2]');

	    // 선택된 값이 '1'이면 직접 입력
	    if ($ele.val() === "1") {
	        $opEmail2.val(''); // 이메일 입력 필드 초기화
	        $opEmail2.attr('readonly', false); // 이메일 입력 필드 활성화
	        $opEmail2.val(''); // 이메일 도메인 입력 필드 초기화
	        $opEmail2.attr('readonly', false); // 이메일 도메인 입력 필드 활성화
	    } else {
	        $opEmail2.attr('readonly', true); // 이메일 입력 필드 비활성화
	        $opEmail2.val($ele.val()); // 선택된 도메인을 이메일 입력 필드에 설정
	        $opEmail2.attr('readonly', true); // 이메일 도메인 입력 필드 비활성화
	        $opEmail2.val($ele.val()); // 선택된 도메인을 이메일 도메인 입력 필드에 설정
	    }
	}

  </script>