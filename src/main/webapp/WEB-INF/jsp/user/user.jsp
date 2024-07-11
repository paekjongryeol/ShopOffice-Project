<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>Insert title here</title>

</head>
<body>
  
<main id="main" class="main">

<section class="section">
  <div class="row">
    <div class="col-lg-12">

      <div class="card">
        <div class="card-body" style="padding-top: 20px;">
          <!-- General Form Elements -->
          <table class="col-lg-12">
          	<tr>
          		<td>
	              	<div class="row mb-4">
	                  <label for="inputText" class="col-sm-3 col-form-label">회원명</label>
	                  <div class="col-sm-2">
	                    <input type="text" class="form-control" name="userName">
	                  </div>
	                </div>
	           <td>
	           <td>
          			<div class="row mb-3">
	                  <label for="inputDate" class="col-sm-3 col-form-label">가입일</label>
	                  <div class="col-sm-2">
	                    <input type="date" class="form-control" name="joinDtFrom">
	                  </div>
	                  <div class="col-sm-2">
	                    <input type="date" class="form-control" name="joinDtTo">
	                  </div>
	                  
	                </div>
          		</td>
	           <td rowspan="2">
				    <div class="row mb-4">
				        <label for="inputText" class="col-sm-4 col-form-label">탈퇴여부</label>
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
          			<button type="button" class="btn btn-info" onclick="userSearch();">조회</button>
          		</td>
          	</tr>
          </table>                         

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
                    <th scope="col">총주문횟수</th>
                    <th scope="col">총주문금액</th>
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
                <tbody id="orderHistoryBody">
                 
              	</tbody>
              </table>
              <nav aria-label="Page navigation example">
                  <ul class="pagination" id="orderHistoryPaging">
                  
                  </ul>
              </nav><!-- End Pagination with icons -->
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="text-align: center;">닫기</button>
           </div>
         </div>
       </div>
     </div><!-- End Vertically centered Modal-->
     
     
<script>
		var arrMembers = [
		    { userId: 'test1', userName: "홍길동", email: "hong@example.com", phone: "010-1234-5678", joinDate: "2024-05-20", withdrawal: "N", withdrawalDate: "-" },
		    { userId: 'test2', userName: "이순신", email: "lee@example.com", phone: "010-5678-1234", joinDate: "2024-05-21", withdrawal: "N", withdrawalDate: "-" },
		    { userId: 'test3', userName: "유관순", email: "you@example.com", phone: "010-9876-5432", joinDate: "2024-05-22", withdrawal: "Y", withdrawalDate: "2024-05-25" },
		    { userId: 'test4', userName: "강감찬", email: "kang@example.com", phone: "010-5432-9876", joinDate: "2024-05-23", withdrawal: "N", withdrawalDate: "-" },
		    { userId: 'test5', userName: "홍길동", email: "hong@example.com", phone: "010-1234-5678", joinDate: "2024-05-20", withdrawal: "N", withdrawalDate: "-" },
		    { userId: 'test6', userName: "이순신", email: "lee@example.com", phone: "010-5678-1234", joinDate: "2024-05-21", withdrawal: "N", withdrawalDate: "-" },
		    { userId: 'test7', userName: "유관순", email: "you@example.com", phone: "010-9876-5432", joinDate: "2024-05-22", withdrawal: "Y", withdrawalDate: "2024-05-25" },
		    { userId: 'test8', userName: "강감찬", email: "kang@example.com", phone: "010-5432-9876", joinDate: "2024-05-23", withdrawal: "N", withdrawalDate: "-" },
		    { userId: 'test9', userName: "홍길동", email: "hong@example.com", phone: "010-1234-5678", joinDate: "2024-05-20", withdrawal: "N", withdrawalDate: "-" },
		    { userId: 'test10', userName: "이순신", email: "lee@example.com", phone: "010-5678-1234", joinDate: "2024-05-21", withdrawal: "N", withdrawalDate: "-" },
		    { userId: 'test11', userName: "유관순", email: "you@example.com", phone: "010-9876-5432", joinDate: "2024-05-22", withdrawal: "Y", withdrawalDate: "2024-05-25" }
		];
		
		var arrOrders = [
		    { orderNo: '2024040001', orderGoodsName: '반팔티셔츠 외 9건', buyQty: '10', orderPrice: '100,000', receiveName: '홍길동', addr: '서울', orderStatus: '배송중' },
		    { orderNo: '2024040002', orderGoodsName: '긴팔티셔츠 외 7건', buyQty: '8', orderPrice: '80,000', receiveName: '유관순', addr: '서울', orderStatus: '배송중' },
		    { orderNo: '2024040003', orderGoodsName: '청바지 외 6건', buyQty: '7', orderPrice: '90,000', receiveName: '이순신', addr: '서울', orderStatus: '배송완료' },
		    { orderNo: '2024040004', orderGoodsName: '아우터 외 8건', buyQty: '9', orderPrice: '70,000', receiveName: '강감찬', addr: '서울', orderStatus: '배송취소' },
		    { orderNo: '2024040001', orderGoodsName: '반팔티셔츠 외 9건', buyQty: '10', orderPrice: '100,000', receiveName: '홍길동', addr: '서울', orderStatus: '배송중' },
		    { orderNo: '2024040002', orderGoodsName: '긴팔티셔츠 외 7건', buyQty: '8', orderPrice: '80,000', receiveName: '유관순', addr: '서울', orderStatus: '배송중' },
		    { orderNo: '2024040003', orderGoodsName: '청바지 외 6건', buyQty: '7', orderPrice: '90,000', receiveName: '이순신', addr: '서울', orderStatus: '배송완료' },
		    { orderNo: '2024040004', orderGoodsName: '아우터 외 8건', buyQty: '9', orderPrice: '70,000', receiveName: '강감찬', addr: '서울', orderStatus: '배송취소' },
		    { orderNo: '2024040001', orderGoodsName: '반팔티셔츠 외 9건', buyQty: '10', orderPrice: '100,000', receiveName: '홍길동', addr: '서울', orderStatus: '배송중' },
		    { orderNo: '2024040002', orderGoodsName: '긴팔티셔츠 외 7건', buyQty: '8', orderPrice: '80,000', receiveName: '유관순', addr: '서울', orderStatus: '배송중' },
		    { orderNo: '2024040003', orderGoodsName: '청바지 외 6건', buyQty: '7', orderPrice: '90,000', receiveName: '이순신', addr: '서울', orderStatus: '배송완료' },
		    { orderNo: '2024040004', orderGoodsName: '아우터 외 8건', buyQty: '9', orderPrice: '70,000', receiveName: '강감찬', addr: '서울', orderStatus: '배송취소' }
		];
		
		var currentPage = 1;
		var itemsPerPage = 10;
		var currentPageOrderHistory = 1;
		var itemsPerPageOrderHistory = 10;
		
		function userSearch() {
		    $('#userTable > tbody').empty();
		    var endIndex = currentPage * itemsPerPage;
		    var startIndex = endIndex - itemsPerPage;
		    var pagedItems = arrMembers.slice(startIndex, endIndex);
		    
		    // 입력 필드로부터 회원명, 가입일, 탈퇴여부를 가져옵니다.
		    var userName = $('input[name="userName"]').val().trim();
		    var joinDtFrom = $('input[name="joinDtFrom"]').val().trim();
		    var joinDtTo = $('input[name="joinDtTo"]').val().trim();
		    var withdrawalYn = $('select[name="withdrawYn"]').val().trim();
		    
		    // 회원명, 가입일, 탈퇴여부를 검색 조건으로 사용하여 필터링합니다.
		    var filteredMembers = arrMembers.filter(function(member) {
		        var matchUserName = true;
		        var matchJoinDate = true;
		        var matchWithdrawalStatus = true;

		        if (userName !== '') {
		            matchUserName = member.userName.toLowerCase().includes(userName.toLowerCase());
		        }
		        if (joinDtFrom !== '' && joinDtTo !== '') {
		            matchJoinDate = member.joinDate >= joinDtFrom && member.joinDate <= joinDtTo;
		        }
		        if (withdrawalYn !== '') {
		            matchWithdrawalStatus = member.withdrawal === withdrawalYn;
		        }

		        return matchUserName && matchJoinDate && matchWithdrawalStatus;
		    });
		    
		    // 필터링된 회원들을 테이블에 추가합니다.
		    $.each(filteredMembers, function (index, user) {
		        var row = "<tr onclick=\"memberDetail('" + user.userId + "');\" style=\"cursor:pointer;\">" +
		            "<td>" + (startIndex + index + 1) + "</td>" +
		            "<td>" + user.userId + "</td>" +
		            "<td>" + user.userName + "</td>" +
		            "<td>" + user.email + "</td>" +
		            "<td>" + user.phone + "</td>" +
		            "<td>" + user.joinDate + "</td>" +
		            "<td>" + user.withdrawal + "</td>" +
		            "<td>" + user.withdrawalDate + "</td>" +
		            "</tr>";
		        $("#userTable > tbody").append(row);
		    });

		    updatePagination();
		}

		
		function updatePagination() {
		    var totalPages = Math.ceil(arrMembers.length / itemsPerPage);
		    $('#userPaging').empty();
		    
		    for (var i = 1; i <= totalPages; i++) {
		        var li = $("<li>").addClass("page-item").append(
		            $("<a>").addClass("page-link").text(i).attr("href", "#").data("page", i).click(function (event) {
		                event.preventDefault();
		                currentPage = $(this).data("page");
		                userSearch();
		            })
		        );
		        if (i === currentPage) {
		            li.addClass("active");
		        }
		        $('#userPaging').append(li);
		    }
		}
		
		function memberDetail(userId) {
		    var member = arrMembers.find(m => m.userId === userId);
		    if (member) {
		        var tbody = $('#memberTable tbody');
		        tbody.empty();

		        var row = $('<tr>').append(
		            $('<td>').text(member.userId),
		            $('<td>').text(member.userName),
		            $('<td>').text(member.email),
		            $('<td>').text(member.phone),
		            $('<td>').text('(1111)경기도 의정부시 한국로 16번길'),
		            $('<td>').text(member.joinDate),
		            $('<td>').text(member.withdrawal),
		            $('<td>').text(member.withdrawalDate),
		            $('<td>').text('2회'),
		            $('<td>').text('100,000')
		        );
		        tbody.append(row);

		        var orderHistory = $('#orderHistory tbody');
		        orderHistory.empty();

		        var startIndex = (currentPageOrderHistory - 1) * itemsPerPageOrderHistory;
		        var endIndex = startIndex + itemsPerPageOrderHistory;
		        var pagedOrders = arrOrders.slice(startIndex, endIndex);
		        
		        for (var i = 0; i < pagedOrders.length; i++) {
		            var order = pagedOrders[i];
		            var orderRow = $('<tr>').append(
		                $('<td>').text(i + 1 + startIndex),
		                $('<td>').text(order.orderNo),
		                $('<td>').text(order.orderGoodsName),
		                $('<td>').text(order.buyQty),
		                $('<td>').text(order.orderPrice),
		                $('<td>').text(order.receiveName),
		                $('<td>').text(order.addr),
		                $('<td>').text(order.orderStatus),
		                $('<td>').append($('<a>').attr('href', '#').text('보기'))
		            );
		            orderHistory.append(orderRow);
		        }

		        $('#memberInfo').modal('show');
		        updatePagination2();
		    }
		}

		function updatePagination2() {
		    var totalPages = Math.ceil(arrOrders.length / itemsPerPageOrderHistory);
		    $('#orderHistoryPaging').empty();
		    
		    for (var i = 1; i <= totalPages; i++) {
		        var li = $("<li>").addClass("page-item").append(
		            $("<a>").addClass("page-link").text(i).attr("href", "#").data("page", i).click(function (event) {
		                event.preventDefault();
		                currentPageOrderHistory = $(this).data("page");
		                var userId = $('#memberTable tbody tr:first td:first').text(); // 첫 번째 행의 첫 번째 열의 userId를 가져옵니다.
		                memberDetail(userId); 
		            })
		        );
		        if (i === currentPageOrderHistory) {
		            li.addClass("active");
		        }
		        $('#orderHistoryPaging').append(li);
		    }
		}



</script>
</body>
</html>
