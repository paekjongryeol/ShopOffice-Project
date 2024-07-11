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
              <input type='hidden' id='upCtCd' name='upCtCd'>
			  <input type='hidden' id='ctLevel' name='ctLevel'>
			  <input type='hidden' id='ctName' name='ctName'>
			  <input type="hidden" id="currentPage" name="currentPage" value=1>
              <table class="col-lg-12">
			    <tr>
			        <td>
			            <div class="row mb-2">
			                <label for="inputText" class="col-sm-2 col-form-label">상품명</label>
			                <div class="col-sm-3">
			                    <input type="text" class="form-control" name="goodsName">
			                </div>
			            </div>
			        </td>
			        <td>
			            <div class="row mb-2">
			                <label for="inputText" class="col-sm-3 col-form-label">상품상태</label>
			                <div class="col-sm-3">
			                    <select id="code1" name="goodsStatus" class="form-control" style="width: 150px;">
			                        <option value="">상품상태</option>
			                        <option value="판매중">판매중</option>
			                        <option value="종료">종료</option>
			                    </select> 
			                </div>
			            </div>     
			        </td>
			        <td>
			            <div class="row mb-2">
			                <label for="inputText" class="col-sm-3 col-form-label">카테고리</label>
			                <div class="col-sm-6">
			                    <select id="mCtCd" name="mCtCd" onchange="onBox1();" class="form-control" style="width: 150px;">
			                        <option value="">대분류</option>
			                    </select>
			                    <select id="sCtCd" name="sCtCd" onchange="onBox2();" class="form-control" style="width: 150px;">
			                        <option value="">중분류</option>
			                    </select>
			                    <select id="dCtCd" name="dCtCd" onchange="onBox3();" class="form-control" style="width: 150px;">
			                        <option value="">소분류</option>
			                    </select> 
			                </div>
			            </div>      
			        </td>
			        <td>
			            <button type="button" class="btn btn-info" onclick='goodsSearch();'>조회</button>
			            <button type="button" class="btn btn-info" onclick='inSearch();'>등록</button>
			        </td>
			        </tr>
			        <tr>
			        <td>
			            <div class="row mb-4">
			                <label for="inputText" class="col-sm-2 col-form-label">거래처</label>
			                <div class="col-sm-6">
			                    <select id="supp" name="supplierCd" class="form-control" style="width: 150px;">
			                        <option value="">거래처</option>
			                    </select> 
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
              <table id="goodsTable" class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col">No</th>
                    <th scope="col">상품코드</th>
                    <th scope="col">상품명</th>
                    <th scope="col">카테고리</th>
                    <th scope="col">판매가</th>
                    <th scope="col">재고량</th>
                    <th scope="col">등록일</th>
                    <th scope="col">상품상태</th>
                  </tr>
                </thead>
                <tbody>
                
				</tbody>
              </table>
              <!-- End Table with hoverable rows -->
			  <nav aria-label="Page navigation example">
				<ul class="pagination" id="goodsPaging" >
				
				</ul>
              </nav><!-- End Pagination with icons -->
			   	
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
  
  <div class="modal fade" id="goodsInfo" tabindex="-1">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">상품등록/수정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
            <form id='goodsform' enctype="multipart/form-data">
            <input type='hidden' id='up2CtCd' name='upCtCd'>
			  <input type='hidden' id='ct2Level' name='ctLevel'>
			  <input type='hidden' id='ct2Name' name='ctName'>
                <table class="table table-hover" >
                    <thead>
                    <tbody>
                        <tr>
                            <th scope="col">상품코드</th>
                            <td ><input type='text' id='goodsCd' name='goodsCd' readonly="readonly"></td>
                            <th scope="col">(상품코드는 수정이 불가합니다.)</th>
                        </tr>
                        <tr>
						    <th scope="row">상품명</th>
						    <td><input type='text' id="goodsName" name="goodsName"></td>
						</tr>
                        <tr>
						    <th scope="row">정상가</th>
						    <td><input type='text' id="normalPrice" name="normalPrice"></td>
						    <th scope="row">판매가</th>
						    <td><input type='text' id="sellPrice" name="sellPrice"></td>
						</tr>
                        <tr>
                            <th scope="row">재고수량</th>
                            <td><input type='text' id="ivQty" name="ivQty"></td>
                            <th scope="row">상품상태</th>
                            <td>
                            <select id="code2" name="goodsStatus" class="form-control" style="width: 150px;">
			                        <option value="">상품상태</option>
			                        <option value="판매중">판매중</option>
			                        <option value="종료">종료</option>
			                    </select> 
                        	</td>
                        	</tr>
                        	<tr>
						    <th scope="row">카테고리</th>
						    <td>
						        <select id="m2CtCd" name="mCtCd" onchange="onBox4();" class="form-control" style="width: 150px;">
						            <option value="">대분류</option>
						        </select>
						    </td>
						    <td>
						        <select id="s2CtCd" name="sCtCd" onchange="onBox5();" class="form-control" style="width: 150px;">
						            <option value="">중분류</option>
						        </select>
						    </td>
						    <td>
						        <select id="d2CtCd" name="dCtCd" onchange="onBox6();" class="form-control" style="width: 150px;">
						            <option value="">소분류</option>
						        </select>
						    </td>
						    <th scope="row">거래처</th>
						    <td>
						        <select id="supp2" name="supplierCd" class="form-control" style="width: 150px;">
						            <option value="">거래처</option>
						        </select>
						    </td>
						</tr>
                        <tr>
						    <th scope="row">썸네일</th>
						    <td colspan="2"><input type="file" id="thumnailFile" name="thumnailFile"></td>
						</tr>
						<tr>
						    <th scope="row">이미지<button type="button" class="btn btn-primary" onclick="addItem()" style="float: right;">+</button></th>
						    <td colspan="2">
						      <div id='imgDiv'><input type="file" id="imgFile" name="imgFile"></div></td>
						</tr>
                        <tr>
                            <th scope="row">설명</th>
                            <td colspan="2"><textarea id="content" name="content" rows="4" cols="50"></textarea></td>
                        </tr>
                    </tbody>
                    </thead>
                </table>
                </form>
            </div>
            <div class="modal-footer">
            	<button type="button" id='btnUpdate' class="btn btn-secondary" data-bs-dismiss="modal" onclick='goodsUp();'>저장</button> <!-- 수정 -->
            	<button type="button" id='btnInsert' class="btn btn-secondary" data-bs-dismiss="modal" onclick='goodsIn();'>저장</button> <!-- 등록 -->
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

  	<form id="hiddenform">
  		<input type='hidden' id='hgoodsCd' name='goodsCd'>
  	</form> 

<script src="/assets/js/paging.js"></script>  
<script>
	function goodsSearch(no) {
			if(no==undefined){
			$('#currentPage').val(1);
		}else{
			$('#currentPage').val(no);
		}
	    call_server(searchform, '/goods/searchlist', getGoodsList);
	}
		function getGoodsList(vo) {
		    list = vo.goodslist; // list 변수 선언과 초기화
		    $('#goodsTable > tbody').empty(); // 테이블 내용 초기화
		    for (var i = 0; i < list.length; i++) {
		        var str = "<tr onclick=\"goodsDetail('" + list[i].goodsCd + "');\" style=\"cursor:pointer;\">";
		        str += "<th scope=\"row\">" + ((Number(vo.currentPage) - 1) * vo.countPerPage + (i + 1)) + "</th>";
		        str += "<td>" + list[i].goodsCd + "</td>";
		        str += "<td>" + list[i].goodsName + "</td>";
		        str += "<td>" + list[i].ctName + "</td>";
		        str += "<td>" + list[i].sellPrice + "</td>";
		        str += "<td>" + list[i].ivQty + "</td>";
		        str += "<td>" + list[i].regDt + "</td>";
		        str += "<td>" + list[i].goodsStatus + "</td>";
		        str += "</tr>";
		        $('#goodsTable > tbody').append(str);
		    }
		    // setPaging 함수에서 'no'를 사용하여 계산
		    setPaging(goodsPaging, vo.startPage, vo.endPage, 'goodsSearch');
	}

	
	function goodsDetail(vo){
		$('#hgoodsCd').val(vo);
	    call_server(hiddenform, '/goods/goodsdetail', getGoodsDetail);
	}

	function getGoodsDetail(vo) {
	    $('#goodsCd').val(vo.goodsCd);
	    $('#goodsName').val(vo.goodsName);
	    $('#normalPrice').val(vo.normalPrice);
	    $('#sellPrice').val(vo.sellPrice);
	    $('#ivQty').val(vo.ivQty);
	    $('#code2').val(vo.goodsStatus);
	    $('#m2ctCd').val(vo.mCtCd);
	    $('#supp2').val(vo.supplierCd);
	    $('#thumnailUrl').val(vo.thumnailUrl);
	    $('#imgUrl').val(vo.imgUrl);
	    $('#content').val(vo.content);
	    $('#s2CtCd').empty();
		$('#d2CtCd').empty();
	    //중분류
	    for(var i=0;i<vo.scatelist.length;i++){
	    	$('#s2CtCd').append("<option value='"+vo.scatelist[i].ctCd+"'>"+vo.scatelist[i].ctName+"</option>");
	    }
	    //소분류
	    for(var i=0;i<vo.dcatelist.length;i++){
	    	$('#d2CtCd').append("<option value='"+vo.dcatelist[i].ctCd+"'>"+vo.dcatelist[i].ctName+"</option>");
	    }

	    $('#d2CtCd').val(vo.ctCd);	//소
	    $('#s2CtCd').val(vo.ctCd.substring(0,4));  //중
	    $('#m2CtCd').val(vo.ctCd.substring(0,2));  //대
	    
	    $('#btnUpdate').show();
		$('#btnInsert').hide();
	    $('#goodsInfo').modal('show');
	}
	
	function goodsUp() {
	    call_server(goodsform, '/goods/goodsUp', getGoodsUp);
	}

	function getGoodsUp(cnt) {
		if(cnt>0){
			alert('저장되었습니다.');
			$('#goodsInfo').modal('hide');
			goodsSearch();
			resetForm();
		}else{
			alert("수정시 오류발생하엿습니다.");
		}
	}
	
	// 등록버튼 클릭시.
	function inSearch() {
		$('#btnUpdate').hide();
		$('#btnInsert').show();
	    $('#goodsCd').removeAttr('readonly');
	    resetForm(); // 입력 필드 초기화
	    $('#goodsInfo').modal('show');
	}

	
	function resetForm() {
	    // 입력 필드의 값을 초기화
	    $('#goodsCd').val('');
	    $('#goodsName').val('');
	    $('#normalPrice').val('');
	    $('#sellPrice').val('');
	    $('#ivQty').val('');
	    $('#code2').val('');
	    
	    $('#supp2').val('');
	    

	    $('#m2CtCd').val('');  //대분류
	    $('#s2CtCd').empty(); $('#s2CtCd').append("<option value=''>중분류</option>") ;  //중분류
	    $('#d2CtCd').empty(); $('#d2CtCd').append("<option value=''>소분류</option>");  //소분류
	    
	    $('#thumnailUrl').val('');
	    $('#imgUrl').val('');
	    $('#content').val('');
	}
	
	function goodsIn() {
	    call_server(goodsform, '/goods/goodsIn', getGoodsIn);
	}
	
	function getGoodsIn(cnt) {
		if(cnt>0){
			alert('저장되었습니다.');
			$('#goodsInfo').modal('hide');
			goodsSearch();
			resetForm();
		}else{
			alert("수정시 오류발생하엿습니다.");
		}
	}
	
	function inBox() {
		call_server(searchform, '/goods/search2', getSupplierCd);
    }
	
	function getSupplierCd(vo){
		for(var i=0;i<vo.supplist.length;i++){
			$('#supp').append( "<option value='"+vo.supplist[i].supplierCd+"'>"+vo.supplist[i].supplierName+"</option>" );
			$('#supp2').append( "<option value='"+vo.supplist[i].supplierCd+"'>"+vo.supplist[i].supplierName+"</option>" );
		}
		for(var i=0;i<vo.catelist.length;i++){
			$('#mCtCd').append( "<option value='"+vo.catelist[i].ctCd+"'>"+vo.catelist[i].ctName+"</option>" );
			$('#m2CtCd').append( "<option value='"+vo.catelist[i].ctCd+"'>"+vo.catelist[i].ctName+"</option>" );
		}		
	}
	inBox();
	
	
	function onBox1() {
		var cd = $('#mCtCd').val(); // 중분류 코드 가져오기
		$('#upCtCd').val(cd);
        $('#ctLevel').val('2');
        call_server(searchform, '/goods/search', getGoodsCt1);
    }
	
	function getGoodsCt1(list){
		$('#sCtCd').empty();
		$('#dCtCd').empty();
    	$('#sCtCd').append("<option value=''>중분류</option>");
    	$('#dCtCd').append("<option value=''>소분류</option>");
        for (var i = 0; i < list.length; i++) {
            var str = "<option value='"+list[i].ctCd+"'>"+list[i].ctName+"</option>";
            $("#sCtCd").append(str);
            
        }
	}
	
	function onBox2() {
		var cd = $('#sCtCd').val(); // 소분류 코드 가져오기
		$('#upCtCd').val(cd);
        $('#ctLevel').val('3');
        call_server(searchform, '/goods/search', getGoodsCt2);
    }
	
	function getGoodsCt2(list){
		$('#dCtCd').empty();
    	$('#dCtCd').append("<option value=''>소분류</option>");
        for (var i = 0; i < list.length; i++) {
            var str = "<option value='"+list[i].ctCd+"'>"+list[i].ctName+"</option>";
            $("#dCtCd").append(str);         
        }
	}
	

	function onBox4() {
	    var cd = $('#m2CtCd').val(); // 대분류 코드 가져오기
	    $('#up2CtCd').val(cd);
	    $('#ct2Level').val('2');
	    call_server(goodsform, '/goods/search', getGoodsCt4);
	}

	function getGoodsCt4(list) {
	    $('#s2CtCd').empty();
	    $('#d2CtCd').empty();
	    $('#s2CtCd').append("<option value=''>중분류</option>");
	    $('#d2CtCd').append("<option value=''>소분류</option>");
	    for (var i = 0; i < list.length; i++) {
	        var str = "<option value='" + list[i].ctCd + "'>" + list[i].ctName + "</option>";
	        $("#s2CtCd").append(str);
	    }
	}

	function onBox5() {
	    var cd = $('#s2CtCd').val(); // 중분류 코드 가져오기
	    $('#up2CtCd').val(cd);
	    $('#ct2Level').val('3');
	    call_server(goodsform, '/goods/search', getGoodsCt5);
	}

	function getGoodsCt5(list) {
	    $('#d2CtCd').empty();
	    $('#d2CtCd').append("<option value=''>소분류</option>");
	    for (var i = 0; i < list.length; i++) {
	        var str = "<option value='" + list[i].ctCd + "'>" + list[i].ctName + "</option>";
	        $("#d2CtCd").append(str);
	    }
	}
	
	function addItem() {
	    const newRow = `<tr>
	                        <td colspan="2"><input type="file" name="imgFile"></td>
	                    </tr>`;
	    $('#imgDiv').append(newRow); // 기존 내용 유지하고 새 행 추가
	}


	</script>