package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DAO {
	// Parâmetros de conexão
	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://127.0.0.1:3306/dbagenda?useTimezone=true&serverTimezone=UTC";
	private String user = "root";
	private String password = "Linux@1991V4";

	private Connection conectar() {
		Connection con = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);

			return con;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

//	CRUD CREATE
	public void inserirContato(JavaBeans contato) {
		String create = "INSERT INTO contatos (nome, fone, email) VALUES (?,?,?)";

		try {

			// abrir a conexão
			Connection con = conectar();

			// preparar a query para a execução
			PreparedStatement pst = con.prepareStatement(create);

			// substituir os parametros (?) pelas variaveis javabeans
			pst.setString(1, contato.getNome());
			pst.setString(2, contato.getFone());
			pst.setString(3, contato.getEmail());

			// executar a query
			pst.executeUpdate();

			// encerrar a conexão
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

//	CRUD READ
	public ArrayList<JavaBeans> listarContatos() {

		// criando objeto para acessar a classe java beans
		ArrayList<JavaBeans> contatos = new ArrayList<>();

		String read = "SELECT * FROM contatos c;";

		try {

			Connection con = conectar();

			PreparedStatement pst = con.prepareStatement(read);

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				// variaveis de apoio
				String idcon = rs.getString(1);
				String nome = rs.getString(2);
				String fone = rs.getString(3);
				String email = rs.getString(4);

				// populando o array list
				contatos.add(new JavaBeans(idcon, nome, fone, email));
			}

			con.close();

			return contatos;

		} catch (Exception e) {
			System.out.println(e);

			return null;
		}

	}

//	CRUD UPDATE
//	SELECIONAR CONTATO
	public void selecionarContato(JavaBeans contato) {
		String read = "select * from contatos where idcon = ?";
		
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(read);
			
			pst.setString(1, contato.getIdcon());
			
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				contato.setIdcon(rs.getString(1));
				contato.setNome(rs.getString(2));
				contato.setFone(rs.getString(3));
				contato.setEmail(rs.getString(4));
			}
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	// editar
	public void alterarContato(JavaBeans contato) {
		String update = "update contatos set nome =?, fone =?, email=? where idcon=?";
		
		try {
			Connection con = conectar();
			
			PreparedStatement pst = con.prepareStatement(update);
			
			pst.setString(1, contato.getNome());
			pst.setString(2, contato.getFone());
			pst.setString(3, contato.getEmail());
			pst.setString(4, contato.getIdcon());
			
			pst.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	// CRUD DELETAR
	public void deletarContato(JavaBeans contato) {
		String delete = "delete from contatos where idcon=?";
		
		try {
			Connection con = conectar();
			
			PreparedStatement pst = con.prepareStatement(delete);
			
			pst.setString(1, contato.getIdcon());
			
			pst.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
