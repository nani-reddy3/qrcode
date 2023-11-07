package com.QRgenerator.controller;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.QRgenerator.util.QrcodeGenerator;


@Controller
public class MainController {
	
	
	
	@RequestMapping("/qrcode")
	public String getexcelupload() {
	
		return "qrcodegen";		
	}
	
	@RequestMapping("/test")
	public @ResponseBody String testingMethod() {
		Date dt = new Date();
		return dt.toString();		
	}
	
	@RequestMapping(value="/qrreceive", method = RequestMethod.POST)
	public @ResponseBody String getqrreceive(@RequestParam("url") String url) throws Exception{
		try {
			
			QrcodeGenerator.qrcode(url);
			
		} catch (Exception ex) {
			System.out.printf("exception in /savefileupload",ex);
		
		}
		return null;
	}


}
