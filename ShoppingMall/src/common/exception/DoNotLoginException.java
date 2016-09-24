package common.exception;

public class DoNotLoginException extends RuntimeException{
	
	public DoNotLoginException(String msg) {
		super(msg);
	}
}
