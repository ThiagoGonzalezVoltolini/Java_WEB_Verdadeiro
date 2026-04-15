package br.com.model;

public class Produto {
    private Integer id;
    private String nome;
    private double preco;
    private Integer estoque;

    // Construtores
    public Produto() {
    }

    public Produto(int idProduto, String nomeProduto, double precoProduto, int estoqueProduto, int idCategoriaProduto) {
        this.id = idProduto;
        this.nome = nomeProduto;
        this.preco = precoProduto;
        this.estoque = estoqueProduto;
    }

	public Integer getIdProduto() {
		return id;
	}

	public void setIdProduto(Integer id) {
		this.id = id;
	}

	public String getNomeProduto() {
		return nome;
	}

	public void setNomeProduto(String nome) {
		this.nome = nome;
	}

	public double getPrecoProduto() {
		return preco;
	}

	public void setPrecoProduto(double preco) {
		this.preco = preco;
	}

	public Integer getEstoque() {
		return estoque;
	}

	public void setEstoque(Integer estoque) {
		this.estoque = estoque;
	}
    
}