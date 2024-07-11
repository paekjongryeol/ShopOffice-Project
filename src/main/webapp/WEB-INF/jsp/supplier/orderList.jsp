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
              <input type="hidden" id="currentPage" name="currentPage" value="1">
              
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
              			<div class="row mb-3">
		                  <label for="inputDate" class="col-sm-2 col-form-label">발주일</label>
		                  <div class="col-sm-3">
		                    <input type="date" class="form-control" name="incomeDtFrom">
		                  </div>
		                  <div class="col-sm-3">
		                    <input type="date" class="form-control" name="incomeDtTo">
		                  </div>
		                  
		                </div>
              		</td>
              		<td>
			            <div class="row mb-2">
			                <label for="inputText" class="col-sm-4 col-form-label">발주상태</label>
			                <div class="col-sm-6">
			                    <select name="orderStatus" class="form-control" style="width: 150px;">
			                        <option value="">발주상태</option>
			                        <option value="입고대기중">입고대기중</option>
			                        <option value="입고완료">입고완료</option>
			                        <option value="반품">반품</option>
			                    </select> 
			                </div>
			            </div>      
			        </td>
			        <td>
			            <button type="button" class="btn btn-info" onclick='supplierOrderSearch();'>조회</button>
			            <button type="button" class="btn btn-info" onclick='supplierOrderInsert();'>신규</button>
			        </td>
			        </tr>
			    </table>
             </form>   
            </div>
          </div>
          		
           <div class="card">
            <div class="card-body">
            
              <!-- Table with hoverable rows -->
          <div class="row mb-3 justify-content-end">
		  </div>
              <table id="supplierOrderTable" class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col">No</th>
                    <th scope="col">거래처코드</th>
                    <th scope="col">거래처명</th>
                    <th scope="col">발주번호</th>
                    <th scope="col">발주일</th>	
                    <th scope="col">상품코드</th>
                    <th scope="col">상품명</th>
                    <th scope="col">발주수량</th>
                    <th scope="col">발주단가</th>
                    <th scope="col">발주상태</th>
                    <th scope="col">입고일</th>		
                  </tr>
                <tbody>
                
				</tbody>
				</thead>
              </table>

              <!-- End Table with hoverable rows -->
			  <nav aria-label="Page navigation example">
				<ul class="pagination" id="supplierOrderPaging" >
				
				</ul>
              </nav><!-- End Pagination with icons -->	
			    
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
  
  <div class="modal fade" id="supplierOrderInfo" tabindex="-1" aria-labelledby="orderModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="supplierModalLabel">상품 발주</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
          <div id="modalTable" class="row mb-3 justify-content-end">
		  </div>
		  <form id="modalform">
		  <input type="hidden" id="hSupplierCd" name="supplierCd">
		  <input type="hidden" id="hgoodsCd" name="goodsCd">
            <div class="modal-body">
	        <table class="table table-hover" id="suppTable">
	          <tbody>
	        	<tr>
				    <th scope="col">거래처</th>
				    <td>
				    <select id="supplierName" name="supplierName"  class="form-control" onchange='changeSupplier(this)' style="width: 150px;" >
			                    <option value="">거래처</option>
			        </select>
				</tr>
	            <tr>
				    <th scope="col">대표자명:</th>
				    <td ><input type='text' id='supplierCeo' name='supplierCeo'></td>
				    <th scope="col">전화번호:</th>
				    <td><input type='text' id="phone" name="phone" style="width:50px;">
				    -<input type='text' id="phone2" name="phone2" style="width:70px;">
				    -<input type='text' id="phone3" name="phone3" style="width:70px;"></td>
				</tr>
				<tr>
					<th scope="col">담당자명:</th>
				    <td><input type='text' id="opName" name="opName"></td>
				    <th scope="col">연락처:</th>
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
	        <h5 class="modal-title">주문상품
				    <button type="button" class="btn btn-primary" onclick="addItem()" style="float: right;">+</button>
				</h5>
				
				<table class="table table-hover" id='goodsOrderlist'>
				    <thead>
				        <tr>
				            <th scope="col">상품코드</th>
				            <th scope="col">상품명</th>
				            <th scope="col">단가</th>
				            <th scope="col">수량</th>
				            <th scope="col">삭제</th>
				        </tr>
				    </thead>
				    <tbody>
				         
				    </tbody>
				</table>
	      </div>
	      </form>
	      <div class="modal-footer">
	      <button type="button" id='btnUpdate' class="btn btn-secondary" data-bs-dismiss="modal" onclick='supplierOrderUp();'>저장</button> <!-- 수정 -->
          <button type="button" id='btnInsert' class="btn btn-secondary" data-bs-dismiss="modal" onclick='supplierOrderIn();'>발주</button> <!-- 등록 -->
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div><!-- End Vertically centered Modal-->
	
  <script src="/assets/js/paging.js"></script>
  <script>
  	function supplierOrderSearch (no) {
  		if(no==undefined){
			$('#currentPage').val(1);
		}else{
			$('#currentPage').val(no);
		}
		call_server(searchform, '/supplier/searchOrderList', getSupplierOrderList);
	}
  
  	function getSupplierOrderList(vo) {
  	    list = vo.supplierGoodslist;
  	    $('#supplierOrderTable > tbody').empty();

  	    // 각 supplierCd에 따른 행 수를 세는 객체
  	    var supplierCount = {};

  	    // supplierCd에 따른 행 수를 계산
  	    for (var i = 0; i < list.length; i++) {
  	        var supplierCd = list[i].supplierCd;
  	        if (supplierCd in supplierCount) {
  	            supplierCount[supplierCd]++;
  	        } else {
  	            supplierCount[supplierCd] = 1;
  	        }
  	    }

  	    for (var i = 0; i < list.length; i++) {
  	        var str = "<tr onclick=\"supplierOrderDetail('" + list[i].supplierCd + "');\" style=\"cursor:pointer;\">";

  	        // 거래처 정보를 첫 번째 행에만 출력하도록 조건 추가
  	        if (i == 0 || list[i].supplierCd !== list[i - 1].supplierCd) {
  	        	var rowspan = supplierCount[list[i].supplierCd];
  	            str += "<th rowspan=\"" + rowspan + "\">" + ((Number(vo.currentPage) - 1) * vo.countPerPage + (i + 1)) + "</th>";
  	            str += "<td rowspan=\"" + rowspan + "\">" + list[i].supplierCd + "</td>";
  	            str += "<td rowspan=\"" + rowspan + "\">" + list[i].supplierName + "</td>";
  	            str += "<td rowspan=\"" + rowspan + "\">" + list[i].orderNo + "</td>";
  	        }

  	        str += "<td>" + list[i].regDt + "</td>";
  	        str += "<td>" + list[i].goodsCd + "</td>";
  	        str += "<td>" + list[i].goodsName + "</td>";
  	        str += "<td>" + list[i].buyQty + "</td>";
  	        str += "<td>" + list[i].unitPrice + "</td>";
  	        str += "<td>" + list[i].orderStatus + "</td>";
  	        str += "<td>" + list[i].incomeDt + "</td>";
  	        str += "</tr>";
  	        $('#supplierOrderTable > tbody').append(str);
  	    }
  	    setPaging(supplierOrderPaging, vo.startPage, vo.endPage, 'supplierOrderSearch');
  	}
	
  	function supplierOrderDetail (vo) {
  		$('#hSupplierCd').val(vo);
		call_server(modalform, '/supplier/supplierDetail', supplierOrderModal);
	}
  	
  	function supplierOrderModal(vo) {
  	    $('#supplierName').empty(); // 거래처 리스트 초기화

  	    // 거래처 리스트 추가
  	    for (var i = 0; i < vo.supplierlist.length; i++) {
  	        $('#supplierName').append("<option value='" + vo.supplierlist[i].supplierCd + "'>" + vo.supplierlist[i].supplierName + "</option>");
  	    }
  	    $('#supplierName').val(vo.supplierCd);
  	    $('#supplierCeo').val(vo.supplierCeo);

  	    // 전화번호 설정
  	    var phone = vo.phone.split('-');
  	    $('#phone').val(phone[0]);
  	    $('#phone2').val(phone[1]);
  	    $('#phone3').val(phone[2]);

  	    // 담당자 정보 설정
  	    $('#opName').val(vo.opName);
  	    var opPhone = vo.opPhone.split('-');
  	    $('#opPhone').val(opPhone[0]);
  	    $('#opPhone2').val(opPhone[1]);
  	    $('#opPhone3').val(opPhone[2]);

  	    // 이메일 설정
  	    var email = vo.opEmail.split('@');
  	    $('#opEmail').val(email[0]);
  	    $('#opEmail2').val(email[1]);

  	    $('#supplierStatus').val(vo.supplierStatus);

  	    $('#btnUpdate').show(); // 업데이트 버튼 표시
  	    $('#btnInsert').hide(); // 신규 등록 버튼 숨김
  	    $('#supplierOrderInfo').modal('show');

  	    // 주문이력 테이블에 추가
  	    var list = vo.goodsorderlist;
  	    $('#goodsOrderlist > tbody').empty();
  	    for (var i = 0; i < list.length; i++) {
  	        var str = "<tr>";
  	        str += "<td><select id='goodsCd" + list[i].goodsCd + "' name='goodsCd' onchange='onBox2(this);' class='form-control'>";
  	        for (var j = 0; j < vo.goodslist.length; j++) {
  	            str += "<option value='" + vo.goodslist[j].goodsCd + "'>" + vo.goodslist[j].goodsCd + "</option>";
  	        }
  	        str += "</select></td>";
  	        str += "<td><input type='text' class='form-control' name='goodsName' value='" + list[i].goodsName + "'></td>";
  	        str += "<td><input type='text' class='form-control' name='unitPrice' value='" + list[i].unitPrice + "'></td>";
  	        str += "<td><input type='text' class='form-control' name='buyQty' value='" + list[i].buyQty + "'></td>";
  	        str += "<td><button type='button' class='btn btn-danger' onclick='removeItem(this)'>삭제</button></td>";
  	        str += "</tr>";

  	        $('#goodsOrderlist > tbody').append(str);
  	        $("#goodsCd" + list[i].goodsCd).val(list[i].goodsCd);
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
  	function supplierOrderInsert() {
  	    $('#btnUpdate').hide(); // 업데이트 버튼 숨김
  	    $('#btnInsert').show(); // 신규 등록 버튼 표시
  	    $('#supplierOrderInfo').modal('show'); // 모달 열기
  	 	resetForm();
  	}
  	
  	function resetForm() {
  	    // 필드 초기화
  	    $('#supplierName').val('');
  	    $('#supplierCeo').val('');
  	    $('#phone').val('');
  	    $('#phone2').val('');
  	    $('#phone3').val('');
  	    $('#opName').val('');
  	    $('#opPhone').val('');
  	    $('#opPhone2').val('');
  	    $('#opPhone3').val('');
  	    $('#opEmail').val('');
  	    $('#opEmail2').val('');
  	    $('#supplierStatus').val('');

  	    // 발주상품 초기화
  	    $('#goodsCd').val('');
  	    $('#goodsName').val('');
  	    $('#buyQty').val('');
  	    $('#unitPrice').val('');
  	}
	

  	function addItem() {
  	    var newRow = '<tr>' +
  			'<td><select class="form-control" name="goodsCd" onchange="onBox2(this);"></select></td>' +
  	        '<td><input type="text" class="form-control" name="goodsName"></td>' +
  	        '<td><input type="text" class="form-control" name="unitPrice"></td>' +
  	        '<td><input type="text" class="form-control" name="buyQty"></td>' +
  	        '<td><button type="button" class="btn btn-danger" onclick="removeItem(this)">삭제</button></td>' +
  	        '</tr>';

  	    $('#goodsOrderlist tbody').append(newRow);
  	    
  	}

  	function removeItem(button) {
  	    $(button).closest('tr').remove();
  	}
	
  	function init(){
  		call_server(modalform, '/supplier/supplierList', setSupplier);
  	}
  	
  	function setSupplier(list){
  		for (var i = 0; i < list.length; i++) {
  	        $('#supplierName').append("<option value='" + list[i].supplierCd + "'>" + list[i].supplierName + "</option>");
  	    }
  	}
  	init();
  	
  	function changeSupplier(obj) {
  	    var supplierCd = $(obj).val(); // 선택된 거래처의 코드를 가져옴
  	    $('#hSupplierCd').val(supplierCd);
  	    call_server(modalform, '/supplier/supplierModalList', getSupplier);
  	}
  	
  	function getSupplier(vo){
  		$('#supplierName').val(vo.supplierCd);
	    $('#supplierCeo').val(vo.supplierCeo);

	    // 전화번호 설정
	    var phone = vo.phone.split('-');
	    $('#phone').val(phone[0]);
	    $('#phone2').val(phone[1]);
	    $('#phone3').val(phone[2]);

	    // 담당자 정보 설정
	    $('#opName').val(vo.opName);
	    var opPhone = vo.opPhone.split('-');
	    $('#opPhone').val(opPhone[0]);
	    $('#opPhone2').val(opPhone[1]);
	    $('#opPhone3').val(opPhone[2]);

	    // 이메일 설정
	    var email = vo.opEmail.split('@');
	    $('#opEmail').val(email[0]);
	    $('#opEmail2').val(email[1]);

	    $('#supplierStatus').val(vo.supplierStatus);
  	}
  </script>