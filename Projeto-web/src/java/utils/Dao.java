package utils;

	import java.sql.CallableStatement;
	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;

	public class Dao {
		
		protected Connection con;  // Conexao ao Banco de Dados
		protected PreparedStatement stmt; // Acessa a Tabela ( insert, update, delete , select)
		protected ResultSet rs; // Consulta a Tabela( select )
		protected CallableStatement call; // Procedures e Function
		              // o open abre a conexaao//
		public void open() throws Exception {                 // esse nome cadastro é o banco que criamos//
		    String url = "jdbc:postgresql://localhost:5432/cadastro1";
		    String user = "postgres";
		    String password = "Mar2025";    //senha que criei na instalacao do postgree//
		    try {
		        Class.forName("org.postgresql.Driver");
		        con = DriverManager.getConnection(url, user, password);      
		    } catch (SQLException | ClassNotFoundException ex) {
		        System.out.println("Erro ao conectar com o banco");
		        throw new Exception(ex);
		    }
		}
		              //o close fecha a conexao//
		public void close() throws Exception{		
			con.close();
			
		}
	}

