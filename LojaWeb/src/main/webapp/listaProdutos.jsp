<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Consulta de Produtos</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <div class="page-page-center">
        <div class="hero-card" style="max-width: 1000px; width: 95%;">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                <div>
                    <h1 style="margin: 0; text-align: left;">Consulta de Produtos</h1>
                    <p class="subtitle" style="text-align: left;">Gerencie os registros de produtos cadastrados no sistema.</p>
                </div>
                <div style="display: flex; gap: 10px;">
                    <a href="formProduto.jsp" class="secondary-link" style="background: #2563eb; color: white; padding: 10px 20px; border-radius: 8px; text-decoration: none; font-weight: bold;">+ Incluir</a>
                    <a href="index.jsp" class="secondary-link" style="background: #e5e7eb; color: #374151; padding: 10px 20px; border-radius: 8px; text-decoration: none; font-weight: bold;">← Menu principal</a>
                </div>
            </div>

            <table style="width: 100%; border-collapse: collapse; margin-top: 20px; background: white; border-radius: 8px; overflow: hidden;">
                <thead style="background: #0f172a; color: white;">
                    <tr>
                        <th style="padding: 15px; text-align: left;">ID</th>
                        <th style="padding: 15px; text-align: left;">Nome do Produto</th>
                        <th style="padding: 15px; text-align: left;">Preço</th>
                        <th style="padding: 15px; text-align: left;">Estoque</th>
                        <th style="padding: 15px; text-align: center;">Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="p" items="${produtos}">
                        <tr style="border-bottom: 1px solid #f1f5f9;">
                            <td style="padding: 15px;">${p.id}</td>
                            <td style="padding: 15px;">${p.nome}</td>
                            <td style="padding: 15px;">R$ ${p.preco}</td>
                            <td style="padding: 15px;">${p.estoque} un.</td>
                            <td style="padding: 15px; text-align: center;">
                                <a href="produtos?acao=buscar&id=${p.id}" style="margin-right: 10px; text-decoration: none;">✏️</a>
                                <a href="produtos?acao=excluir&id=${p.id}" onclick="return confirm('Tem certeza que deseja excluir?')" style="text-decoration: none;">🗑️</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>