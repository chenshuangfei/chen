package web;

import java.io.Serializable;

public class ResultBean<T> implements Serializable{
	private static final long serialVersionUID = 1L;
	public static final int NO_LOGIN = -1;
	public static final int SUCCESS = 0;
	public static final int CHECK_FAIL = 1;
	public static final int NO_PERMISSION = 2;
	public static final int UNKNOWN_EXCEPTION = -99;
	private String msg = "success";
	private int code = SUCCESS;
	private int count;
	private T data;
	
	public ResultBean() {
		super();
	}
	
	public ResultBean(T data,int count) {
		super();
		this.data = data;
		this.count = count;
	}
	
	public ResultBean(Throwable e) {
		super();
		this.msg = e.getMessage();
		this.code = UNKNOWN_EXCEPTION;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
}
