package org.lina.boot.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class RESTResponseDTO implements Serializable {
	private static final long serialVersionUID = 1L;
	

	private int procCode;
	private Object payload;
	private StringBuffer message=new StringBuffer(100);
	private Exception exception;

	public RESTResponseDTO execSuccess(){
		procCode=200;
		return this;
	}
	public RESTResponseDTO execSuccess(Object data){
		procCode = 200;
		payload = data;
		return this;
	}
	public RESTResponseDTO execFailue(){
		procCode=99999;
		return this;
	}
	public RESTResponseDTO addMessage(String msg){
		message.append(msg);
		return this;
	}
	public RESTResponseDTO addException(Exception ec){
		exception = ec;
		return this;
	}
	public static RESTResponseDTO create(){
		return new RESTResponseDTO();
	}
}
