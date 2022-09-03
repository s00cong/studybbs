package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	/**
	 * DAO : Database 접근 객체
	 * 실질적으로 DB에서 회원 정보를 불러오거나 넣을때 사용함
	 * */
	
	private Connection conn; // Connection : DB에 접근하게 해주는 객체
	private PreparedStatement pstmt; 
	private ResultSet rs;
	
	public UserDAO() { //생성자 만들어주기
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS"; //bbs란 db에 접속할 수 있도록 해주는것
			String dbID = "root";
			String dbPassword = "subin1156";
			Class.forName("com.mysql.jdbc.Driver");//mysql driver를 찾을 수 있도록, driver: mysql에 접속할 수 있도록 매개체 역할을 함.
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword); //url,id,pwd를 이용해서 접속할 수 있도록 설정해줌.
			//접속을 완료하게 되면 conn객체 안에 접속된 정보가 담기게 됨
		}catch (Exception e) {
			e.printStackTrace();
		}// 이부분이 실제로 db에 접속하게 해주는 부분
	}
	
	public int login(String userID, String userPassword){//실제로 로그인을 시도하는 함수
		/***
		 * 로그인 기능이 구현됨
		 * 이 기능 실제로 사용해서 사용자에게 로그인 결과를 알려주는 페이지를 만들어야함.
		 * ==> 그게 바로 로그인 action페이지
		 * 
		 * loginAction 페이지에 id,pwd 보내면 거기서 처리해줌. 
		 */
		String SQL = "SELECT userPassword FROM USER WHERE userID= ? ";
		System.out.println("!!!!!!!!!!SQL is "+SQL);
		try {
			pstmt = conn.prepareStatement(SQL); //pstmt에 어떠한 정해진 sql문장을 db에 삽입하는 형식으로 인스턴스 가지고 옴
			pstmt.setString(1,userID); //****젤 중요한 부분**** 하나의 문장을(pstmt) 미리 준비해 놨다가 ?에 매개변수로 받은 것을 가져다 놓는 형식 
			//해킹 같은거 피하기 위해
			System.out.println(userID);
			
			rs = pstmt.executeQuery();// sql에 값 넣었을 때의 결과값을 저장하는 변수 
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				}
				else
					return 0; //비밀 번호가 틀렸단 뜻
			}//db에 아이디,비번이 있을 때
			return -1; // 회원이 실제로 존재하지 않을 때
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // database 오류를 의미함.
	}// 한 계정에 대한 로그인 해주는 함수
	
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,user.getUserID());
			pstmt.setString(2,user.getUserPassword());
			pstmt.setString(3,user.getUserName());
			pstmt.setString(4,user.getUserGender());
			pstmt.setString(5,user.getUserEmail());
			return pstmt.executeUpdate();
			//insert  쿼리 문은 반드시 0이상의 실행 결과를 반환하기 때문에 이렇게만 해도 됨
		} catch(Exception e){
			e.printStackTrace();
		}
		return -1; //DB 오류
	}
}


