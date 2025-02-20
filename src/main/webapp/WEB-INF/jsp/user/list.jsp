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
		              	<div class="row mb-4">
		                  <label for="inputText" class="col-sm-1 col-form-label">회원명</label>
		                  <div class="col-sm-2">
		                    <input type="text" class="form-control" name="userName">
		                  </div>
		                </div>
		           <td>
		           <td rowspan="2">
					    <div class="row mb-4">
					        <label for="inputText" class="col-sm-1 col-form-label">탈퇴여부</label>
					        <div class="col-sm-2">
					            <select class="form-select" name="withdrawYn">
					                <option value="">전체</option>
				               		<option value="Y">Y</option>
				                	<option value="N">N</option>
					            </select>
					        </div>
					    </div>		
					</td>

              		<td rowspan="2">
              			<button type="button" class="btn btn-info" onclick='userSearch();'>조회</button>
              		</td>
              	</tr>
              	<tr>
              		<td>
              			<div class="row mb-3">
		                  <label for="inputDate" class="col-sm-1 col-form-label">가입일</label>
		                  <div class="col-sm-2">
		                    <input type="date" class="form-control" name="joinDtFrom">
		                  </div>
		                  <div class="col-sm-2">
		                    <input type="date" class="form-control" name="joinDtTo">
		                  </div>
		                  
		                </div>
              		</td>
              	</tr>
              </table>
                
                
              </form>
              
            </div>
          </div>
           <div class="card">
            <div class="card-body">
              <!-- Table with hoverable rows -->
              <table id="userTable" class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col">No</th>
                    <th scope="col">회원ID</th>
                    <th scope="col">회원명</th>
                    <th scope="col">이메일</th>
                    <th scope="col">연락처</th>
                    <th scope="col">가입일</th>
                    <th scope="col">탈퇴여부</th>
                    <th scope="col">탈퇴일</th>
                  </tr>
                </thead>
                <tbody>
                
				</tbody>
              </table>
              <!-- End Table with hoverable rows -->
			  <nav aria-label="Page navigation example">
				<ul class="pagination" id="userPaging" >
				
				</ul>
              </nav><!-- End Pagination with icons -->
			   	
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
  
  <div class="modal fade" id="memberInfo" tabindex="-1">
       <div class="modal-dialog modal-xl modal-dialog-centered">
         <div class="modal-content">
           <div class="modal-header">
             <h5 class="modal-title">회원상세</h5>
             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
           </div>
           <div class="modal-body">
             <table class="table table-hover" id='memberTable'>
                <thead>
                  <tr>
                    <th scope="col">회원ID</th>
                    <th scope="col">회원명</th>
                    <th scope="col">이메일</th>
                    <th scope="col">연락처</th>
                    <th scope="col">주소</th>
                    <th scope="col">가입일</th>
                    <th scope="col">탈퇴여부</th>
                    <th scope="col">탈퇴일</th>
                    <th scope="col">주문횟수</th>
                    <th scope="col">주문금액</th>
                  </tr>
                </thead>
                <tbody>
                	
              	</tbody>
              </table>
              <h5 class="modal-title">주문이력</h5>
              <table class="table table-hover" id='orderHistory' name='orderHistory'>
                <thead>
                  <tr>
                    <th scope="col">No</th>
                    <th scope="col">주문번호</th>
                    <th scope="col">주문상품명</th>
                    <th scope="col">상품수량</th>
                    <th scope="col">주문금액</th>
                    <th scope="col">수취인</th>
                    <th scope="col">배송지</th>
                    <th scope="col">배송상태</th>
                    <th scope="col">주문서보기</th>
                  </tr>
                </thead>
                <tbody>
                 
              	</tbody>
              </table>
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
           </div>
         </div>
       </div>
     </div><!-- End Vertically centered Modal-->
  	
  	<form id="hiddenform">
  		<input type='hidden' id='userId' name='userId'>
  	</form> 

<script src="/assets/js/paging.js"></script>
<script>
	function userSearch(no) {
		if(no==undefined){
			$('#currentPage').val(1);
		}else{
			$('#currentPage').val(no);
		}
	    call_server(searchform, '/user/searchlist', getUserList);
	}
	
	function getUserList(vo) {
	    list = vo.userlist;
	    $('#userTable > tbody').empty();
	    for (var i = 0; i < list.length; i++) {
	        var str = "<tr onclick=\"memberDetail('" + list[i].userId + "');\" style=\"cursor:pointer;\">";
	        str += "<th scope=\"row\">" + ((Number(vo.currentPage) - 1) * vo.countPerPage + (i + 1)) + "</th>";
	        str += "<td>" + list[i].userId + "</td>";
	        str += "<td>" + list[i].userName + "</td>";
	        str += "<td>" + list[i].email + "</td>";
	        str += "<td>" + list[i].phone + "</td>";
	        str += "<td>" + list[i].joinDt + "</td>";
	        str += "<td>" + list[i].withdrawYn + "</td>";
	        str += "<td>" + list[i].withdrawDt + "</td>";
	        str += "</tr>";
	        $('#userTable > tbody').append(str);
	    }
	    setPaging(userPaging, vo.startPage, vo.endPage, 'userSearch');
	}

	function memberDetail(id) {
	    $('#userId').val(id);
	    call_server(hiddenform, '/user/userdetail', getUserDetail);
	}
	
	function getUserDetail(vo) {
	    $('#memberTable > tbody').empty();
	    $('#orderHistory > tbody').empty();
	
	    // 회원 상세 정보를 받아와서 테이블에 추가
	    var str = "<tr>";
	    str += "<td>" + vo.userId + "</td>";
	    str += "<td>" + vo.userName + "</td>";
	    str += "<td>" + vo.email + "</td>";
	    str += "<td>" + vo.phone + "</td>";
	    str += "<td>" + vo.addr + "</td>";
	    str += "<td>" + vo.joinDt + "</td>";
	    str += "<td>" + vo.withdrawYn + "</td>";
	    str += "<td>" + vo.withdrawDt + "</td>";
	    str += "<td>" + vo.orderCount + "</td>";
	    str += "<td>" + vo.orderPrice + "</td>";
	    str += "</tr>";
	
	    $('#memberTable > tbody').append(str);
	    
		
    // 주문이력 테이블에 추가
    	list = vo.orderlist;
    for (var i = 0; i < list.length; i++) {
	    var Str = "<tr>";
	    Str += "<th scope=\"row\">" + (i + 1) + "</th>";
	    Str += "<td>" + list[i].orderNo + "</td>";
	    Str += "<td>" + list[i].orderGoodsName + "</td>";
	    Str += "<td>" + list[i].orderPrice + "</td>";
	    Str += "<td>" + list[i].orderStatus + "</td>";
	    Str += "<td>" + list[i].receiveName + "</td>";
	    Str += "<td>" + list[i].addr + "</td>";
	    Str += "<td>" + list[i].addrDtl + "</td>";
	    Str += "<td><button type='button' onclick='buyQtyOrder();'>보기</button></td>";
	    Str += "</tr>";

    	$('#orderHistory > tbody').append(Str);
		//$('#memberInfo').modal('show'); // 모달 창 표시
	}
    $('#memberInfo').modal('show'); // 모달 창 표시
}
</script>