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
              <input type="hidden" id="currentPage" name="currentPage" value=1>
              
              <table class="col-lg-12">
			    <tr>
			        <td>
			            <div class="row mb-2">
			                <label for="inputText" class="col-sm-3 col-form-label">회원명</label>
			                <div class="col-sm-3">
			                    <input type="text" class="form-control" name="userName">
			                </div>
			            </div>
			        </td>
			        <td>
			            <div class="row mb-2">
			                <label for="inputText" class="col-sm-4 col-form-label">주문상태</label>
			                <div class="col-sm-3">
			                    <select name="orderStatus" class="form-control" style="width: 150px;">
			                        <option value="">주문상태</option>
			                        <option value="결제완료">결제완료</option>
			                        <option value="배송준비중">배송준비중</option>
			                        <option value="배송중">배송중</option>
			                        <option value="배송완료">배송완료</option>
			                        <option value="주문취소">주문취소</option>
			                    </select> 
			                </div>
			            </div>     
			        </td>
			        <td>
			            <div class="row mb-2">
			                <label for="inputText" class="col-sm-4 col-form-label">결제수단</label>
			                <div class="col-sm-6">
			                    <select name="payment" class="form-control" style="width: 150px;">
			                        <option value="">결제수단</option>
			                        <option value="카드">카드</option>
			                        <option value="토스">토스</option>
			                        <option value="네이버페이">네이버페이</option>
			                        <option value="카카오페이">카카오페이</option>
			                    </select> 
			                </div>
			            </div>      
			        </td>
			        <td>
			            <button type="button" class="btn btn-info" onclick='orderSearch();'>조회</button>
			        </td>
			        </tr>
			        <tr>
              		<td>
              			<div class="row mb-3">
		                  <label for="inputDate" class="col-sm-3 col-form-label">가입일</label>
		                  <div class="col-sm-2">
		                    <input type="date" class="form-control" name="orderDtFrom">
		                  </div>
		                  <div class="col-sm-2">
		                    <input type="date" class="form-control" name="orderDtTo">
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
              <form id="updateform">
              <input type='hidden' id='oss' name='orderStatus'>
              <input type='hidden' id='oNo' name='orderNo'>
          <div id="orderUpTable" class="row mb-3 justify-content-end">
		    <div class="col-auto">
		        <button type="button" class="btn btn-info" onclick='OrderStatus("배송중");'>일괄 배송중 처리</button>
		        <button type="button" class="btn btn-info" onclick='OrderStatus("배송완료");'>일괄 배송완료 처리</button>
		    </div>
		  </div>
              <table id="orderTable" class="table table-hover">
                <thead>
                  <tr>
                  	<th scope="col"><input type='checkbox' id='chkAll' onclick="selectAllCheckbox()"/></th>
                    <th scope="col">No</th>
                    <th scope="col">주문번호</th>
                    <th scope="col">회원ID</th>
                    <th scope="col">회원명</th>
                    <th scope="col">상품명</th>
                    <th scope="col">주문금액</th>
                    <th scope="col">결제수단</th>
                    <th scope="col">주문상태</th>
                    <th scope="col">주문일</th>
                  </tr>
                </thead>
                <tbody>
                
				</tbody>
              </table>

              <!-- End Table with hoverable rows -->
			  <!-- End Table with hoverable rows -->
			  <nav aria-label="Page navigation example">
				<ul class="pagination" id="orderPaging" >
				
				</ul>
              </nav><!-- End Pagination with icons -->
			    </form> 	
			    
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
	
	 <div class="modal fade" id="orderInfo" tabindex="-1" aria-labelledby="orderModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="orderModalLabel">주문 상세</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

          <div id="orderUpTable" class="row mb-3 justify-content-end">
          <form id="modalform">
          <input type='hidden' id='mOrderStatus' name='orderStatus'>
          <input type='hidden' id='mOrderNo' name='orderNo' >
		    <div class="col-auto">
		        <button type="button" class="btn btn-info" onclick='changeOrderStatus("결제완료");'>결제완료</button>
	            <button type="button" class="btn btn-info" onclick='changeOrderStatus("배송준비중");'>배송준비중</button>
	            <button type="button" class="btn btn-info" onclick='changeOrderStatus("배송중");'>배송중</button>
	            <button type="button" class="btn btn-info" onclick='changeOrderStatus("배송완료");'>배송완료</button>
	            <button type="button" class="btn btn-info" onclick='changeOrderStatus("주문취소");'>주문취소</button>
	        </div>
		    </form>
		  </div>
            <div class="modal-body">
	        <table class="table table-hover" >
	        	<h10>주문자정보</h10>
	          <tbody>
	            <tr>
				    <th scope="col">주문번호</th>
				    <td id="orderNo"></td>
				</tr>
				<tr>
				    <th scope="col">회원명</th>
				    <td id="userIdUserName"></td>
				</tr>
				<tr>
				    <th scope="col">상품명</th>
				    <td id="orderStatus"></td>
				</tr>
				<tr>
				    <th scope="col">주문일</th>
				    <td id="orderDt"></td>
				</tr>
				<tr>
				    <th scope="col">주문금액</th>
				    <td id="orderPrice"></td>
				</tr>
				<tr>
				    <th scope="col">수취인</th>
				    <td id="receiveName"></td>
				</tr>
				<tr>
				    <th scope="col">수취인 연락처</th>
				    <td id="phone"></td>
				</tr>
				<tr>
				    <th scope="col">배송지 주소</th>
				    <td id="addrDtl"></td>
				</tr>
				<tr>
				    <th scope="col">메모</th>
				    <td id="memo"></td>
				</tr>
				<tr>
				    <th scope="col">결제정보</th>
				    <td id="payment"></td>
				</tr>
	          </tbody>
	        </table>	
	        <table id="mOrderTable" >
	        <h10>상품정보</h10>
	        <thead>
	        	<tr>
                    <th scope="col">No</th>				
                    <th scope="col">카테고리</th>			
                    <th scope="col">상품코드</th>			
                    <th scope="col">상품명</th>			
                    <th scope="col">구매단가</th>		
                    <th scope="col">구매수량</th>			
                    <th scope="col">재고수량</th>			
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
	    <input type="hidden" id="horderNo" name="orderNo">
	    <input type="hidden" id="huserId" name="userId">
	</form>
  <script src="/assets/js/paging.js"></script>
  <script>
  
	    function orderSearch(no) {
			if(no==undefined){
				$('#currentPage').val(1);
			}else{
				$('#currentPage').val(no);
			}
			call_server(searchform, '/order/searchlist', getOrderList);
		}
  	
	    function getOrderList(vo) {
		    list = vo.orderlist;
		    $('#orderTable > tbody').empty();
		    for (var i = 0; i < list.length; i++) {
		    	var str = "<tr onclick=\"orderDetail('" + list[i].orderNo + "','" + list[i].userId + "');\" style=\"cursor:pointer;\">";
		        // 각 주문 항목 앞에 체크박스 추가
		        str += "<td><input type='checkbox' class='orderCheckbox' name='ordernolist["+i+"]' value='" + list[i].orderNo + "'></td>";
		        str += "<th scope=\"row\">" + ((Number(vo.currentPage) - 1) * vo.countPerPage + (i + 1)) + "</th>";
		        str += "<td>" + list[i].orderNo + "</td>"
		        str += "<td>" + list[i].userId + "</td>"
		        str += "<td>" + list[i].userName + "</td>"
		        str += "<td>" + list[i].orderGoodsName + "</td>"
		        str += "<td>" + list[i].orderPrice + "</td>"
		        str += "<td>" + list[i].payment + "</td>"
		        str += "<td>" + list[i].orderStatus + "</td>"
		        str += "<td>" + list[i].orderDt + "</td>"
		        str += "</tr>";
		        $('#orderTable > tbody').append(str);
		    }
		    setPaging(orderPaging, vo.startPage, vo.endPage, 'orderSearch');
		    $('#chkAll').prop('checked', false);
		    
	    }
	  	
	    function selectAllCheckbox() {
		    var isChecked = $('#chkAll').prop('checked');
		    $('.orderCheckbox').prop('checked', isChecked);
	    }
	    
	    function orderDetail(no, id) {
		    $('#horderNo').val(no);
		    $('#huserId').val(id);
		    call_server(hiddenform, '/order/orderdetail', getOrderDetail);
		    
		}

		function getOrderDetail(vo) {
		    //주문자정보 출력
			$('#orderNo').text(vo.orderNo);
		    $('#oNo').val(vo.orderNo);
		    $('#userIdUserName').text(vo.userId + '/' + vo.userName);
		    $('#orderStatus').text(vo.orderStatus);
		    $('#orderDt').text(vo.orderDt);
		    $('#orderPrice').text(vo.orderPrice);
		    $('#receiveName').text(vo.receiveName);
		    $('#phone').text(vo.phone);
		    $('#addrDtl').text(vo.addrDtl);
		    $('#memo').text(vo.memo);
		    $('#payment').text(vo.payment);
		    //상품정보 리스트 출력
		    list = vo.goodslist;
		    $('#mOrderTable > tbody').empty();
		    for(var i=0; i<list.length; i++) {
		    	var str = "<tr>";
		    	str += "<td>" + (i + 1) + "</td>"; // 순차적으로 증가하는 번호로 변경합니다.
                str += "<td>" + list[i].ctName + "</td>"		
                str += "<td>" + list[i].goodsCd + "</td>"			
                str += "<td>" + list[i].goodsName + "</td>"			
                str += "<td>" + list[i].unitPrice + "</td>"			
                str += "<td>" + list[i].buyQty + "</td>"		
                str += "<td>" + list[i].ivQty + "</td>"			
		    	str += "</tr>"
		    	$('#mOrderTable > tbody').append(str);
		    	
		    }
		    // 모달 창 열기
		    $('#orderInfo').modal('show');
		    
	   }

	   function OrderStatus (status) {
		   $('#oss').val(status);
		  if(confirm("일괄" + status + "으로 변경 하시겠습니까?")){
			  call_server(updateform, '/order/orderUp1', getOrderUp)
		  }
	   }
	  
	   function changeOrderStatus (status) {
		   $('#oss').val(status);
		    
		  if(confirm( status + "로 변경 하시겠습니까?")){
			  call_server(updateform, '/order/orderUp2', getOrderUp)
		  }
		   
	   }
	
 	  function getOrderUp (cnt) {
		if(cnt>0){
			alert("저장되었습니다.");
		}else{
			alert("오류가 발생하였습니다.");
		}
	   }
	  
 	 
	  
  </script>