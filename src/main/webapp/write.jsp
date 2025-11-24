<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>새 글 작성</title>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="container mt-5" style="max-width: 800px;">
    <h2 class="text-center mb-4">새 글 작성</h2>

    <form action="write_ok.jsp" method="post">

        <div class="mb-3">
            <label for="title" class="form-label">제목</label>
            <input type="text" class="form-control" id="title" name="title" required>
        </div>

        <div class="mb-3">
            <label for="writer" class="form-label">작성자</label>
            <input type="text" class="form-control" id="writer" name="writer" required>
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">비밀번호</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>

        <div class="mb-3">
            <label for="category" class="form-label">카테고리</label>
            <select class="form-select" id="category" name="category">
                <option value="공지">공지</option>
                <option value="자유">자유</option>
                <option value="질문">질문</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="content" class="form-label">내용</label>
            <textarea class="form-control" id="content" name="content" rows="10"></textarea>
        </div>

        <div class="d-flex justify-content-between">
            <a href="list.jsp" class="btn btn-secondary">목록으로</a>
            <button type="submit" class="btn btn-primary">작성 완료</button>
        </div>
    </form>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>