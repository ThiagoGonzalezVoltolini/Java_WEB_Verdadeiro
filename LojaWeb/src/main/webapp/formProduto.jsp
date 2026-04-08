<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manutenção de Produto</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <div class="page-page-center">
        <div class="hero-card" style="max-width: 500px;">
            <h2>${produto != null ? "Alterar Produto" : "Novo Produto"}</h2>
            <p class="subtitle">Preencha os dados abaixo para salvar.</p>
            
            <form action="produtos" method="post">
                <input type="hidden" name="id" value="${produto.id}">
                
                <label>Nome do Produto:</label>
                <input type="text" name="nome" value="${produto.nome}" required class="input-field" style="width:100%; margin: 10px 0; padding: 10px;">
                
                <label>Preço:</label>
                <input type="number" step="0.01" name="preco" value="${produto.preco}" required style="width:100%; margin: 10px 0; padding: 10px;">
                
                <label>Estoque:</label>
                <input type="number" name="estoque" value="${produto.estoque}" required style="width:100%; margin: 10px 0; padding: 10px;">
                
                <label>Categoria:</label>
                <select name="idCategoria" required style="width:100%; margin: 10px 0; padding: 10px;">
                    <c:forEach var="cat" items="${categorias}">
                        <option value="${cat.id}" ${cat.id == produto.idCategoria ? 'selected' : ''}>
                            ${cat.nome}
                        </option>
                    </c:forEach>
                </select>
                
                <div style="margin-top:20px; display: flex; gap: 10px;">
                    <button type="submit" class="secondary-link" style="background:#2563eb; color:white; border:none; padding: 10px 20px; cursor:pointer; border-radius:8px;">Salvar</button>
                    <a href="produtos?acao=listar" class="secondary-link" style="background:#e5e7eb; color:#374151; text-decoration:none; padding: 10px 20px; border-radius:8px;">Cancelar</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>