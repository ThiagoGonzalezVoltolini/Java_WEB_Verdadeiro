package br.com.web;

import br.com.dao.ProdutoDAO;
import br.com.model.Produto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/produtos")
public class ProdutoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final ProdutoDAO ProdutoDAO = new ProdutoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        if (acao == null || acao.equals("listar")) {
            listar(request, response);
            return;
        }

        switch (acao) {
            case "novo":
                request.getRequestDispatcher("/WEB-INF/views/produto-form.jsp").forward(request, response);
                break;
            case "editar":
                abrirEdicao(request, response);
                break;
            case "excluir":
                excluir(request, response);
                break;
            default:
                listar(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String idProduto = request.getParameter("idProduto");
        String nomeProduto = request.getParameter("nomeProduto");
        String preco = request.getParameter("preco");
        String estoque = request.getParameter("estoque");

        Produto produto = new Produto();
        produto.setNomeProduto(nomeProduto);
        produto.setPrecoProduto(Double.parseDouble(preco));
        produto.setEstoque(Integer.parseInt(estoque));

        if (idProduto == null || idProduto.isBlank()) {
        	ProdutoDAO.inserir(produto);
        } else {
        	produto.setIdProduto(Integer.parseInt(idProduto));
        	ProdutoDAO.atualizar(produto);
        }

        response.sendRedirect(request.getContextPath() + "/produtos");
    }

    private void listar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Produto> produtos = ProdutoDAO.listar();
        request.setAttribute("listaProdutos", produtos);
        request.getRequestDispatcher("/WEB-INF/views/produto-consulta.jsp").forward(request, response);
    }

    private void abrirEdicao(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Produto produto = ProdutoDAO.buscarPorId(id);
        request.setAttribute("produto", produto);
        request.getRequestDispatcher("/WEB-INF/views/produto-form.jsp").forward(request, response);
    }

    private void excluir(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ProdutoDAO.excluir(id);
        response.sendRedirect(request.getContextPath() + "/produtos");
    }
}