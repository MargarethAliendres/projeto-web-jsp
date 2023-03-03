package persistencia;
import utils.Dao;
import classes.Pessoa;
	import java.sql.SQLException;
	import java.util.ArrayList;
	import java.util.List;

	public class PessoaDao extends Dao {

            public Boolean incluirPessoa(Pessoa p) throws Exception {
                open();
                stmt = con.prepareStatement("insert into pessoa(nome, email) values(?,?)");
                try {
                    stmt.setString(1, p.getNome());
                    stmt.setString(2, p.getEmail());
                    stmt.execute();
                    return true;
                } catch (SQLException ex) {
                    System.out.println("Erro: " + ex.getMessage() + stmt);
                    stmt.close();
                    close();
                   return false;
                    
                } finally {
                    stmt.close();
                    close();
                }
	  }  

		
		public boolean alterarPessoa(Pessoa p) throws Exception {
			open();
			stmt = con.prepareStatement("update pessoa set nome= ?, email= ?  where idpessoa = ?" );
			
			try {
						
			stmt.setString(1, p.getNome());
			stmt.setString(2, p.getEmail());
                        stmt.setInt(3, p.getIdPessoa());
			stmt.execute();
		        return true;
		} 
		catch (SQLException ex) {   //
			
		System.out.println("Erro: " + ex.getMessage() + stmt);
			stmt.close();
			close();
			return false;
		}finally {
			  System.out.println("Fechando a conex�o com banco de dados no Finally");
			stmt.close();
			close();
			
		}
               }

		public boolean excluirPessoa(int id) throws Exception {

			open();
			stmt = con.prepareStatement("delete from pessoa where idpessoa = ?");
			stmt.setInt(1, id);
			stmt.execute();
			stmt.close();
			close();
                      return true;
		}
		
                // retornando um objeto
		public Pessoa consultarPessoa(int id) throws Exception {
				open();                                                         
				stmt = con.prepareStatement("select * from pessoa where idPessoa = ? "); //esse exclamaçao é isso aqui  setInt(1, cod);//
				stmt.setInt(1, id);  //esse cod vai ser setado, é o codigo do metodo//
				try {          
					rs = stmt.executeQuery();			
				}
				catch (SQLException ex) {
					System.out.println("Falha ao recuperar o registro Contate TI");
					ex.printStackTrace();
					throw new Exception(ex);
				}
				finally {
					System.out.println("Fechando a conex�o com banco de dados no Finally");
					close();
				}
				Pessoa p = null;
				if (rs != null) {
					if (rs.next()) {
						p = new Pessoa();
						p.setIdPessoa(rs.getInt("idPessoa"));
						p.setNome(rs.getString("nome"));
						p.setEmail(rs.getString("email"));				
					}
				}
				close();
				return p;
		}
                
                
		   //retorna uma lista com varias pessoas/elementos
		public List<Pessoa> consultarPessoas() throws Exception {
			try {
				open();
				stmt = con.prepareStatement("select * from pessoa");
				rs = stmt.executeQuery();
                                
		        List<Pessoa> listaPessoas = new ArrayList<>();
				while (rs.next()) {
					Pessoa pessoa = new Pessoa();
					pessoa.setIdPessoa(rs.getInt("idpessoa"));
					pessoa.setNome(rs.getString("nome"));
					pessoa.setEmail(rs.getString("email"));
					listaPessoas.add(pessoa);
				}
				
				return listaPessoas;
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
				return null;
                                
			}finally {
			  System.out.println("Fechando a conex�o com banco de dados no Finally");
			  close();
                          
                        }   
		}
	}

