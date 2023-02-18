package kr.or.workFit.vo.byhutil;

public class CurrMailCode {
	
	private String currMailCode;
	
	private static CurrMailCode instance;
	
	private CurrMailCode() {
		
		
	}
	
	
	
	public String getCurrMailCode() {
		return currMailCode;
	}


	public void setCurrMailCode(String currMailCode) {
		this.currMailCode = currMailCode;
	}



	public static CurrMailCode getInstance() {
		if(instance == null) instance = new CurrMailCode();
		
		return instance;
	}
	

}
