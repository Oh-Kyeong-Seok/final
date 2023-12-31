<%--
* [[개정이력(Modification Information)]]
* 수정일      	 수정자        수정내용
* ---------- 	 ---------  -----------------
* 2023. 11. 19.   김보영        최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<h4 class="py-3 mb-4"><span class="text-muted fw-light"><i class='bx bxs-universal-access'></i>직원계정관리</span></h4>

<div class="row fv-plugins-icon-container">
  <div class="col-md-12">
    <ul class="nav nav-pills flex-column flex-md-row mb-3">
      <li class="nav-item">
        <a class="nav-link " href="/account/form"><i class="bx bx-user me-1"></i> 생성</a>
      </li>
      <li class="nav-item">
        <a class="nav-link active " href="javascript:void(0);"><i class="bx bx-user me-1"></i> 수정</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="/account/home"><i class="bx bx-user me-1"></i> 목록</a>
      </li>
    </ul>
    <div class="card mb-4">
      <div class="card-body">
        <form action="/account/insert"  enctype="multipart/form-data" id="formAccountSettings" method="POST" 
          class="fv-plugins-bootstrap5 fv-plugins-framework" >
          <security:csrfInput/>
          <input type="hidden" name="empCd" value='<c:out value="${emp.empCd}"/>'/>
          <div class="row">
            <h5 class="card-header">프로필 사진</h5>
            <!-- Account -->
            <div class="card-body">
              <div class="d-flex align-items-start align-items-sm-center gap-4">
              	<c:if test="${empty emp.empProfileImg}">
	                <img src="/resources/images/basic.png" alt="user-avatar" class="d-block rounded" height="100"
	                  width="100" id="uploadedAvatar">
              	</c:if>
              	<c:if test="${not empty emp.empProfileImg}">
	                <img src="${emp.empProfileImg}" alt="user-avatar" class="d-block rounded" height="100"
	                  width="100" id="uploadedAvatar">
              	</c:if>
                <div>
                  <label class="btn btn-primary mb-3 p-2 rounded" for="input-file">
                    Upload
                  </label>
                  <input type="file" id="input-file" name="empProfileImage" style="display:none;" />
                </div>
              </div>
            </div>
            <hr class="my-0 mb-3">
             <div class="mb-3 col-md-6">
              <label for="empName" class="form-label">이름</label>
              <div class="input-group has-validation" >
	              <input class="form-control rounded-1" type="text" id="empName" name="empName" autocomplete="off" value='<c:out value="${emp.empName}"/>'>
              </div>
            </div>
            
            <div class="mb-3 col-md-6">
              <label for="empSsn" class="form-label">주민번호</label>
              <div class="row">
                <div class="input-group has-validation">
                  <input class="form-control rounded-1" type="text" name="empSsn" id="empSsn" autocomplete="off"  value='<c:out value="${emp.empSsn}"/>'>
              	</div>
              </div>
            </div>
            
            <div class="mb-3 col-md-6 ">
              <label for="empPw" class="form-label">비밀번호</label>
              <div class="input-group has-validation">
              	<!--remove autocomplete-->
				<input style="display:none" aria-hidden="true">
				<input type="password" style="display:none" aria-hidden="true">
				<!--remove autocomplete end-->
             	 <input class="form-control rounded-1" type="password" name="empPw" id="empPw" value=""  autocomplete="new-password" placeholder="············">
              </div>
            </div>
          	
          	<div class="mb-3 col-md-6 ">
              <label for="confirmPassword" class="form-label">비밀번호 확인</label>
              <div class="input-group has-validation">
              	<input class="form-control rounded-1" type="password" name="confirmPassword" id="confirmPassword" value="" >
              </div>
            </div>
            
            <div class="mb-3 col-md-6">
              <label for="empHiredate" class="form-label">입사일</label>
              <div class="input-group has-validation">
              		<fmt:parseDate value="${emp.empHiredate}" pattern="yyyyMMdd" var="empHiredate" />
              		<fmt:formatDate value="${empHiredate}" pattern="yyyy-MM-dd" var="formattedDate" />	
	              <input class="form-control rounded-1" type="date" id="empHiredate" name="empHiredate" value='<c:out value="${formattedDate}"/>'>
              </div>
            </div>
            
            <div class="mb-3 col-md-6">
              <label for="empMail" class="form-label">E-mail</label>
              <div class="input-group has-validation">
	              <input class="form-control rounded-1" type="email" id="empMail" name="empMail" value='<c:out value="${emp.empMail}"/>' autocomplete="off" >
              </div>
            </div>
            
            <div class="mb-3 col-md-6 ">
              <label for="deptCd" class="form-label">부서명</label>
              <div class="input-group has-validation">
	              <select id="deptCd" class="form-select" tabindex="0" name="deptCd" >
		                <option value="">(선택)</option>
		              	<c:forEach items="${deptList}" var="dept">
			                <option value="${dept.deptCd }" <c:if test="${dept.deptCd eq emp.deptCd}">selected</c:if>>${dept.deptName }</option>
		              	</c:forEach>
	              </select>
              </div>
            </div>
            
            <div class="mb-3 col-md-6 ">
              <label for="empSuprr" class="form-label">상급자</label>
              <div class="input-group has-validation" >
	              <input type="hidden" id="tempEmpSuprr" value='<c:out value="${emp.empSuprr}"/>'/>
	              <select id="empSuprr" class="form-select rounded-1" tabindex="0" name="empSuprr" >
	                <!-- 비동기 -->
	              </select>
              </div>
            </div>
            
            <div class="mb-3 col-md-6 ">
              <label for="empRank" class="form-label">직급</label>
              <div class="input-group has-validation">
	              <select id="empRank" class="form-select" tabindex="0" name="empRank" >
	                <option value="">(선택)</option>
		              	<c:forEach items="${rankList}" var="rank">
			                <option value="${rank.commonCodeCd}" <c:if test="${rank.commonCodeCd eq emp.empRank}">selected</c:if>>${rank.commonCodeSj }</option>
		              	</c:forEach>
	              </select>
              </div>
            </div>
            
            <div class="mb-3 col-md-6 ">
              <label for="empPosition" class="form-label">직책</label>
              <div class="input-group has-validation">
	              <select id="empPosition" class="form-select" tabindex="0" name="empPosition" >
	                <option value="">(선택)</option>
	                <option value="팀원" <c:if test="${emp.empPosition eq '팀원'}">selected</c:if>>팀원</option>
	                <option value="팀장" <c:if test="${emp.empPosition eq '팀장'}">selected</c:if>>팀장</option>
	              </select>
              </div>
            </div>
            
            <div class="mb-3 col-md-6 ">
              <label class="form-label" for="empTelno">휴대전화</label>
              <div class="input-group has-validation">
                <input type="text" id="empTelno" name="empTelno" class="form-control rounded-1"  value='<c:out value="${emp.empTelno}"/>'>
              </div>
            </div>
            
            <div class="mb-3 col-md-6 ">
              <label class="form-label" for="empExtension">내선전화</label>
              <div class="input-group has-validation">
                <input type="text" id="empExtension" name="empExtension" class="form-control rounded-1"  value='<c:out value="${emp.empExtension}"/>'>
              </div>
            </div>
            
            <div class="mb-3 col-md-6 ">
              <label for="address" class="form-label">우편번호</label>
              <div class="input-group has-validation">
	              <div class="row">
	                <div class="mb-6 col-md-8">
	                  <input class="form-control" type=text name="empZip" id="empZip" value='<c:out value="${emp.empZip}"/>'>
	                </div>
	                <div class="mb-6 col-md-4">
	                  <button  type="button"  class="btn btn-primary" onclick="execDaumPostcode()">검색</button>
	                </div>
	              </div>
              </div>
            </div>
            
            <div class="mb-3 col-md-6 ">
              <label for="empAdres" class="form-label">도로명주소</label>
              <div class="input-group has-validation">
	              <input class="form-control rounded-1" type="text" id="empAdres" name="empAdres"  value='<c:out value="${emp.empAdres}"/>'>
              </div>
            </div>
            
            <div class="mb-3 col-md-6 ">
              <label for="empAdresDetail" class="form-label">상세주소</label>
              <div class="input-group has-validation">
	              <input type="text" class="form-control rounded-1" id="empAdresDetail" name="empAdresDetail"  value='<c:out value="${emp.empAdresDetail}"/>'>
              </div>
            </div>
            
            <div class="mb-3 col-md-6 ">
              <label for="empSignImg" class="form-label">서명이미지</label>
              <input type="file" class="form-control" id="empSignImage" name="empSignImage" value='<c:out value="${emp.empSignImage}"/>'>
            </div>
          </div>
          <div class="mt-2">
            <button type="button" onclick="fn_updateEmp()" class="btn btn-primary me-2">수정</button>
            <button type="button" onclick="fn_goList()" class="btn btn-label-secondary">취소</button>
          </div>
        </form>
      </div>
      <!-- /Account -->
    </div>

    <div class="card">
      <h5 class="card-header">계정 삭제</h5>
      <div class="card-body">
        <div class="mb-3 col-12 mb-0">
          <div class="alert alert-warning">
            <h6 class="alert-heading fw-medium mb-1">정말로 계정을 삭제하시겠습니까?</h6>
            <p class="mb-0">계정을 삭제하면 되돌릴 수 없습니다.</p>
          </div>
        </div>
        <form id="formAccountDeactivation" >
          <security:csrfInput/>
          <input type="hidden" name="empCd" value='<c:out value="${emp.empCd}"/>'/>
          <div class="form-check mb-3">
            <input class="form-check-input" type="checkbox" name="accountActivation" id="accountActivation">
            <label class="form-check-label" for="accountActivation">확인했습니다.</label>
          </div>
          <button type="button" onclick="fn_deleteEmp()" class="btn btn-danger">삭제</button>
        </form>
      </div>
    </div>
  </div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/app/admin/account/account.js"></script>


