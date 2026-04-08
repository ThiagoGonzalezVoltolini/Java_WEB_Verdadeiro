package br.com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import br.com.model.Produto;
import br.com.util.ConnectionFactory;

public class ProdutoDAO {
    private Connection conn;

    public ProdutoDAO() throws Exception {
        this.conn = ConnectionFactory.getConnection();
    }

    // LISTAR / CONSULTAR
    public List<Produto> listarTodos() throws SQLException {
        List<Produto> lista = new ArrayList<>();
        String sql = "SELECT * FROM produtos";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            lista.add(new Produto(rs.getInt("id_produto"), rs.getString("nome_produto"), 
                      rs.getDouble("preco"), rs.getInt("estoque"), rs.getInt("id_categoria")));
        }
        return lista;
    }

    // INCLUIR
    public void cadastrar(Produto p) throws SQLException {
        String sql = "INSERT INTO produtos (nome_produto, preco, estoque, id_categoria) VALUES (?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, p.getNome());
        stmt.setDouble(2, p.getPreco());
        stmt.setInt(3, p.getEstoque());
        stmt.setInt(4, p.getIdCategoria());
        stmt.execute();
    }

    // EXCLUIR
    public void excluir(int id) throws SQLException {
        String sql = "DELETE FROM produtos WHERE id_produto = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        stmt.execute();
    }

    // BUSCAR POR ID (para alteração)
    public Produto buscarPorId(int id) throws SQLException {
        String sql = "SELECT * FROM produtos WHERE id_produto = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return new Produto(rs.getInt("id_produto"), rs.getString("nome_produto"), 
                   rs.getDouble("preco"), rs.getInt("estoque"), rs.getInt("id_categoria"));
        }
        return null;
    }

    // ALTERAR
    public void alterar(Produto p) throws SQLException {
        String sql = "UPDATE produtos SET nome_produto=?, preco=?, estoque=?, id_categoria=? WHERE id_produto=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, p.getNome());
        stmt.setDouble(2, p.getPreco());
        stmt.setInt(3, p.getEstoque());
        stmt.setInt(4, p.getIdCategoria());
        stmt.setInt(5, p.getId());
        stmt.execute();
    }
}