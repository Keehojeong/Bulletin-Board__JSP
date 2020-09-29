package vo;

public class BoardVO {
	private String board_idx;
	private String board_name;
	private String board_email;
	private String board_title;
	private String board_div;
	private String board_from_date;
	private String board_to_date;
	private String board_content;
	private String board_pw;
	
	public String getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(String board_idx) {
		this.board_idx = board_idx;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	public String getBoard_email() {
		return board_email;
	}
	public void setBoard_email(String board_email) {
		this.board_email = board_email;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_div() {
		return board_div;
	}
	public void setBoard_div(String board_div) {
		this.board_div = board_div;
	}
	public String getBoard_from_date() {
		return board_from_date;
	}
	public void setBoard_from_date(String board_from_date) {
		this.board_from_date = board_from_date;
	}
	public String getBoard_to_date() {
		return board_to_date;
	}
	public void setBoard_to_date(String board_to_date) {
		this.board_to_date = board_to_date;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_pw() {
		return board_pw;
	}
	public void setBoard_pw(String board_pw) {
		this.board_pw = board_pw;
	}
	
	@Override
	public String toString() {
		return "BoardVO [board_idx=" + board_idx + ", board_name=" + board_name + ", board_email=" + board_email
				+ ", board_title=" + board_title + ", board_div=" + board_div + ", board_from_date=" + board_from_date
				+ ", board_to_date=" + board_to_date + ", board_content=" + board_content + ", board_pw=" + board_pw
				+ "]";
	}
	
	
}
