<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="pagingIndex" required="true"
	type="java.util.ArrayList"%>
<%@ attribute name="isFirst" required="true"%>
<%@ attribute name="isLast" required="true"%>
<%@ attribute name="url" required="true"%>
<div class="row tm-row tm-mt-100 tm-mb-75">
	<div class="tm-paging-wrapper">
		<span class="d-inline-block mr-3">Page</span>
		<nav class="tm-paging-nav d-inline-block">
			<c:choose>
				<c:when test="${isFirst}">
					<!-- 첫번째 페이지면 버튼 비활성화 -->
					<div class="tm-prev-next-wrapper">
						<a href="#"
							class="mb-2 tm-btn tm-btn-primary tm-prev-next disabled tm-mr-20">Prev</a>
					</div>
				</c:when>
				<c:when test="${!isFirst}">
					<!-- 첫번째 페이지가 아니면 버튼 활성화 -->
					<div class="tm-prev-next-wrapper">
						<a href="${url}?index=${index-1}"
							class="mb-2 tm-btn tm-btn-primary tm-prev-next tm-mr-20">Prev</a>
					</div>
				</c:when>
			</c:choose>
			<ul>
				<c:forEach var="pa" items="${pagingIndex}">
					<li class="tm-paging-item active"><a href="${url}?index=${pa}"
						class="mb-2 tm-btn tm-paging-link">${pa}</a></li>
				</c:forEach>
			</ul>
			<c:choose>
				<c:when test="${isLast}">
					<!-- 마지막페이지면 버튼 비활성화 -->
					<div class="tm-prev-next-wrapper">
						<a href="#"
							class="mb-2 tm-btn tm-btn-primary disabled tm-prev-next">Next</a>
					</div>
				</c:when>
				<c:when test="${isLast}">
					<!-- 마지막페이지가 아니면 버튼 활성화 -->
					<div class="tm-prev-next-wrapper">
						<a href="${url}?index=${index+1}"
							class="mb-2 tm-btn tm-btn-primary tm-prev-next">Next</a>
					</div>
				</c:when>
			</c:choose>
		</nav>
	</div>
</div>