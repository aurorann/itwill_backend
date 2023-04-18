package oop0323;

import java.io.FileInputStream;

public class Test02_input {

	public static void main(String[] args) {
		//파일 입출력(.txt)
		//File : .txt .pdf .xls .csv .ppt .jpg
		
		//byte형 : 1바이트 할당
		//char형 : 2바이트 할당
		
		//1) byte기반 -> 한글깨짐
		
		String filename="I:/java202301/workspace/java_class/basic01_java/src/oop0323/data.txt";

		FileInputStream fis=null;
		
		try {
			fis=new FileInputStream(filename);
			while(true) {
				int data=fis.read();
				if(data==-1) {
					break;
				}//if end
				//System.out.println(data);
				System.out.printf("%c",data);
			}//while end
			
		}catch (Exception e) {
			System.out.println(e);
		}finally {
			//자원반납
			try {
				if(fis!=null) {fis.close();}
			}catch (Exception e) {}
		}//end
		
		
	}//main() end
}//class end
