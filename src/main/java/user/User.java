package user;

public class User {
	/**
	 * 변수를 만들어준다.
	 * 변수를 만들어 줄때는 db에서 만들었던 dbtable과 동일한 형태로 넣어주기
	 * 이렇게 해야 회원정보들이 db와 동일하게 java안에 담길수있다.
	 * 그 후 jsp서버에서 사용할 수 있는 형태로 만들기위해 getter setter를 만들어준다.
	 * ==> 이렇게 하면 회원정보를 다룰 수 있는 database 및 java beans가 만들어짐
	 * 
	 * javabeans: 하나의 데이터를 관리하고 처리할수있는 기법을 jsp에서 구현하는 것
	 * */
	private String userID;
	private String userPassword;
	private String userName;
	private String userGender;
	private String userEmail;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
}
