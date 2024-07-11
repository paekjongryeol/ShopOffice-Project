<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  
  <main id="main" class="main">

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body" style="padding-top: 20px;">
              <!-- General Form Elements -->
              <form id="quiryform">
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
				        <label for="inputText" class="col-sm-1 col-form-label">답변여부</label>
				        <div class="col-sm-2">
				            <select class="form-select" name="replyYn">
				                <option value="">전체</option>
				                <option value="Y">Y</option>
				                <option value="N">N</option>
				            </select>
				        </div>
				    </div>
					</td>
              		<td rowspan="2">
              			<button type="button" class="btn btn-info" onclick='search();'>조회</button>
              		</td>
              	</tr>
              	<tr>
              		<td>
              			<div class="row mb-3">
		                  <label for="inputDate" class="col-sm-2 col-form-label">문의 등록일</label>
		                  <div class="col-sm-2">
		                    <input type="date" class="form-control" name="regDtFrom">
		                  </div>
		                  <div class="col-sm-2">
		                    <input type="date" class="form-control" name="regDtTo">
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
                    <th scope="col">문의유형</th>
                    <th scope="col">회원ID</th>
                    <th scope="col">회원명</th>
                    <th scope="col">제목</th>
                    <th scope="col">문의 동록일</th>
                    <th scope="col">답변여부</th>
                    <th scope="col">답변등록일</th>
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
	        <h5 class="modal-title">고객문의</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <table class="table table-hover" id="memberTable" name="memberTable">
	          <tbody>
	            <tr>
	              <th scope="col">제목</th>
	              <td id="title"></td>
	            </tr>
	            <tr>
	              <th scope="col">유형</th>
	              <td id="boardType"></td>
	            </tr>
	            <tr>
	              <th scope="col">회원ID/명</th>
	              <td id="userIdUserName"></td>
	            </tr>
	            <tr>
	              <th scope="col">문의일</th>
	              <td id="regDt"></td>
	            </tr>
	            <tr>
	              <th scope="col">첨부파일</th>
	              <td id="attchFile"></td>
	            </tr>
	            <tr>
	              <th scope="col">문의내용</th>
	              <td><textarea id="content" name="content" rows="4" cols="50" ></textarea></td>
	            </tr>
	            <tr>
	              <th scope="col">답변내용</th>
	              <td><textarea id="replyContent" name="replyContent" rows="4" cols="50" ></textarea></td>
	            </tr>
	          </tbody>
	        </table>	        
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick='inquiryUp();'>저장</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div><!-- End Vertically centered Modal-->
	
	<form id="hiddenform">
	  <input type="hidden" id="userId" name="userId">
	  <input type="hidden" id="boardSeq" name="boardSeq">
	  <input type="hidden" id="rContent" name="replyContent">
	</form> 
	
<script src="/assets/js/paging.js"></script>
<script>
	function search(no) {
	    if (no == undefined) {
	        $('#currentPage').val(1);
	    } else {
	        $('#currentPage').val(no);
	    }
	    call_server(quiryform, '/inquiry/searchlist', getQuiryList);
	}

	function getQuiryList(vo) {
		list = vo.inquirylist;
	    $('#userTable > tbody').empty(); // 테이블 내용 초기화
	    for (var i = 0; i < list.length; i++) {
	        var str = "<tr onclick=\"inquiryDetail('" + list[i].userId + "','" + list[i].boardSeq + "');\" style=\"cursor:pointer;\">";
	        str += "<th scope=\"row\">" + ((Number(vo.currentPage) - 1) * vo.countPerPage + (i + 1)) + "</th>";
	        str += "<td>" + list[i].boardType + "</td>";
	        str += "<td>" + list[i].userId + "</td>";
	        str += "<td>" + list[i].userName + "</td>";
	        str += "<td>" + list[i].title + "</td>";
	        str += "<td>" + list[i].regDt + "</td>";
	        str += "<td>" + list[i].replyYn + "</td>";
	        str += "<td>" + list[i].replyDt + "</td>";
	        str += "</tr>";
	        $('#userTable > tbody').append(str);
	    }
	    setPaging(userPaging, vo.startPage, vo.endPage, 'search');
	}
	
	function inquiryDetail(id, seq) {
	    $('#userId').val(id);
	    $('#boardSeq').val(seq);
	    call_server(hiddenform, '/inquiry/userdetail', getinquiryDetail);
	}
	
	function getinquiryDetail(vo) {
	    $('#title').text(vo.title);
	    $('#boardType').text(vo.boardType);
	    $('#userIdUserName').text(vo.userId + '/' + vo.userName);
	    $('#regDt').text(vo.regDt);
	    $('#attchFile').text(vo.attchFile);
	    $('#content').val(vo.content);
	    $('#replyContent').val(vo.replyContent);
	
	    // 모달 창 열기
	    $('#memberInfo').modal('show');
	}
	
	function inquiryUp() {
		$('#rContent').val($('#replyContent').val());
		call_server(hiddenform, '/inquiryUp', getquiryUp);
		alert('저장되었습니다.');
	}
	function getquiryUp() {		
		$('#memberInfo').modal('hide');
		search();
		
	}
</script>
