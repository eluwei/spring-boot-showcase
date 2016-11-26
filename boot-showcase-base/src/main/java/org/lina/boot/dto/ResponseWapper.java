package org.lina.boot.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class ResponseWapper implements Serializable {
	private static final long serialVersionUID = 1L;
	

	private int procCode;
	private Object payload;
	private StringBuffer message=new StringBuffer(100);
	private Exception exception;

	public ResponseWapper execSuccess(){
		procCode=200;
		return this;
	}
	public ResponseWapper execSuccess(Object data){
		procCode = 200;
		payload = data;
		return this;
	}
	public ResponseWapper execFailue(){
		procCode=99999;
		return this;
	}
	public ResponseWapper addMessage(String msg){
		message.append(msg);
		return this;
	}
	public ResponseWapper addException(Exception ec){
		exception = ec;
		return this;
	}
	public static ResponseWapper create(){
		return new ResponseWapper();
	}
}
