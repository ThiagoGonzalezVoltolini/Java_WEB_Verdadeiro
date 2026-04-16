<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title><c:choose><c:when test="${not empty produto.idProduto}">Alterar Produto</c:when><c:otherwise>Incluir Produto</c:otherwise></c:choose></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<div class="page page-center">
    <div class="form-card">
        <h1>
            <c:choose>
                <c:when test="${not empty produto.idProduto}">Alterar Produto</c:when>
                <c:otherwise>Incluir Produto</c:otherwise>
            </c:choose>
        </h1>
        <p class="subtitle">Preencha os campos abaixo e salve para retornar à consulta de produtos.</p>

        <form action="${pageContext.request.contextPath}/produtos" method="post" class="form-grid">
            <input type="hidden" name="idProduto" value="${produto.idProduto}">

            <div class="form-group">
                <label for="nomeProduto">Nome do produto</label>
                <input id="nomeProduto" type="text" name="nomeProduto" value="${produto.nomeProduto}" required maxlength="100">
            </div>

            <div class="form-group">
                <label for="preco">Preço</label>
                <input id="preco" type="number" name="preco" value="${produto.precoProduto}" step="0.01" min="0" required>
            </div>

            <div class="form-group">
                <label for="estoque">Quantidade em Estoque</label>
                <input id="estoque" type="number" name="estoque" value="${produto.estoque}" min="0" required>
            </div>

            <div class="form-group">
                <label for="idCategoria">Categoria</label>
                <select id="idCategoria" name="idCategoria" required>
                    <option value="">-- Selecione uma categoria --</option>
                    <c:forEach var="categoria" items="${listaCategorias}">
                        <option value="${categoria.idCategoria}" 
                            <c:if test="${categoria.idCategoria == produto.idCategoria}">selected</c:if>>
                            ${categoria.nomeCategoria}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-actions">
                <button class="btn btn-primary" type="submit">Salvar</button>
                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/produtos">Cancelar</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>