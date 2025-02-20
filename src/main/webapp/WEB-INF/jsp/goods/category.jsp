<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  
<main id="main" class="main">
    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body" style="padding-top: 20px;">
                        <!-- 대분류 -->
                        
                        <table>
                        <tr>
                        <button type="button" class="btn btn-info" onclick='search1();'>조회</button>		
                        	</tr>
                        	<tr>
                        		<td>
                        			<table id="categoryTable1" class="table table-hover" style="vertical-align: top;">
                        				<thead>
										<tr>
										    <th scope="col" style="text-align: center;" colspan="2">대분류</th>
										</tr>
										   
										<tr>
										    <td>대분류코드</td>
										    <td>대분류명</td>
					                	</tr>
					                	<thead> 
					                	<tbody>
					                	</tbody>
									</table>
                        		</td>
                        		<td>
                        			<table id="categoryTable2" class="table table-hover" style="vertical-align: top;">
                        				<thead>
										<tr>    
										    <th scope="col" style="text-align: center;">중분류</th>
										</tr>
										<tr>
											<td>중분류코드</td>
										    <td>중분류명</td>   
										</tr>
										</thead>
										<tbody>
					                	</tbody>
									</table>
                        		</td>
                        		<td>
                        			<table id="categoryTable3" class="table table-hover" style="vertical-align: top;">
                        				<thead>
					                	<tr>	
					                		<th scope="col" style="text-align: center;">소분류</th>
										</tr>
										<tr>
										    <td>소분류코드</td>
										    <td>소분류명</td>
					                	</tr>
					                	</thead>
					                	<tbody>
					                	</tbody>
					              	</table>
                        		</td>
                        	</tr>
                        </table>         	
							<div>
							    <select id="code1" name="code1" onchange="onBox1();" style="width:150px;">
							        <option value="">대분류선택</option>
							    </select> 
							    <select id="code2" name="code2" onchange="onBox2();" style="width:150px;">
							        <option value="">중분류선택</option>
							    </select>
							    <select id="code3" name="code3" onchange="onBox3();" style="width:150px;">
							        <option value="">소분류선택</option>
							    </select>
							</div>
							<div class="">
						    <input type="text" id="cateId" name="cateId">
						    <button type="button" class="btn btn-info" onclick="newUp();">신규추가</button>
							</div>	
							<div class="col-lg-12 text-right">
						    <button type="button" class="btn btn-info" onclick="inCategory();">저장</button>
							</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <form id="goodsCt">
	<input type='text' id='ctName' name='ctName'>
	<input type='text' id='upCtCd' name='upCtCd'>
	<input type='text' id='ctLevel' name='ctLevel'>
</form>
</main>
							


<script>
    function search1() {
    	$('#upCtCd').val('');
    	$('#ctLevel').val('1');
        call_server(goodsCt, '/goods/search', getGoodsCt1);
    }
    function getGoodsCt1(list) {
        $('#categoryTable1 > tbody').empty();
        $('#categoryTable2 > tbody').empty();
        $('#categoryTable3 > tbody').empty();
        
        for (var i = 0; i < list.length; i++) {
                var str = "<tr>";
                str += "<td onclick='search2(\"" + list[i].ctCd + "\");'>" + list[i].ctCd + "</td>";
                str += "<td>" + list[i].ctName + "</td>";
                str += "</tr>";
                $('#categoryTable1 > tbody').append(str);
                
                var str1 = "<option value='" + list[i].ctCd + "'>" + list[i].ctName + "</option>";
                $("#code1").append(str1);
        }
    }
    function search2(cd) {
    	$('#upCtCd').val(cd);
    	$('#ctLevel').val('2');
        call_server(goodsCt, '/goods/search', getGoodsCt2);
    }

    function getGoodsCt2(list) {
        $('#categoryTable2 > tbody').empty();
        $('#categoryTable3 > tbody').empty();
        for (var i = 0; i < list.length; i++) {
                var str = "<tr>";
                str += "<td onclick='search3(\"" + list[i].ctCd + "\");'>" + list[i].ctCd + "</td>";
                str += "<td>" + list[i].ctName + "</td>";
                str += "</tr>";
                $('#categoryTable2 > tbody').append(str);
        }
    }
    function search3(cd) {
    	$('#upCtCd').val(cd);
    	$('#ctLevel').val('3');
        call_server(goodsCt, '/goods/search', getGoodsCt3);
    }
    function getGoodsCt3(list) {
        $('#categoryTable3 > tbody').empty();
        for (var i = 0; i < list.length; i++) {
                var str = "<tr>";
                str += "<td>" + list[i].ctCd + "</td>";
                str += "<td>" + list[i].ctName + "</td>";
                str += "</tr>";
                $('#categoryTable3 > tbody').append(str);
        }
    }

    function onBox1() { // 매개변수 제거
        var cd = $('#code1').val(); // 대분류 코드 가져오기
        $('#upCtCd').val(cd);
        $('#ctLevel').val('2');
        call_server(goodsCt, '/goods/search', getGoodsCt4);
    }

    function getGoodsCt4(list) {
    	$('#code2').empty();
    	$('#code2').append("<option value=''>중분류 선택</option>");
        for (var i = 0; i < list.length; i++) {
            var str = "<option value='"+list[i].ctCd+"'>"+list[i].ctName+"</option>";
            $("#code2").append(str);
            
        }
    }
	
    function onBox2() { // 매개변수 제거
        var cd = $('#code2').val(); // 중분류 코드 가져오기
        
        $('#upCtCd').val(cd);
        $('#ctLevel').val('3');
        call_server(goodsCt, '/goods/search', getGoodsCt5);
    }

    function getGoodsCt5(list) {
    	$('#code3').empty();
    	$('#code3').append("<option value=''>소분류 선택</option>");
    	
        for (var i = 0; i < list.length; i++) {
            var str = "<option value='"+list[i].ctCd+"'>"+list[i].ctName+"</option>";
            $("#code3").append(str);
        }
    	
    }
    
    function newUp() {
        var cateId = $('#cateId').val();
        $('#ctName').val(cateId);
        $('#ctLevel').val();
        $('#upCtCd').val();
        call_server(goodsCt, '/goods/newUp', getGoodsCt6);
    }

    
    function getGoodsCt6() {
    	alert('저장되었습니다.');
    }
</script>
