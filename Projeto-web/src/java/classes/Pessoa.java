package classes;

public class Pessoa {
	
	private int idpessoa;
	private String nome;
	private String email;
	
	
	public Pessoa() {
		
		
	}
	         /*esse construtor que vamos fazer operacao*/
	public Pessoa(String nome, String email) {      
		super();       /*usa quando tem heranca, vai ter heranca no classe pessoaDao*/
		this.nome = nome;
		this.email = email;
	}
		
	                              /**esse construtor que vamos fazer inclusao**/
	public Pessoa(int idpessoa, String nome, String email) {
		super();         /*usa quando tem heranca, vai ter heranca no classe pessoaDao*/     
                this.idpessoa = idpessoa;
		this.nome = nome;
		this.email = email;
								
	}
	
	public int getIdPessoa() {
	return idpessoa;
	}
	public void setIdPessoa(int idpessoa) {
	    this.idpessoa = idpessoa;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
