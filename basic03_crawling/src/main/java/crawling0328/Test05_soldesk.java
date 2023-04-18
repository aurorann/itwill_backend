package crawling0328;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test05_soldesk {

	public static void main(String[] args) {
		//과제) 솔디스크 웹페이지에서 공지사항 제목만 크롤링해서
		//		soldesk.txt파일에 저장하기
		//https://soldesk.com/Notice
		
		try {
			
			String fileName="I:/java202301/soldesk.txt";
			FileWriter fw=new FileWriter(fileName, true);//추가모드
			PrintWriter out=new PrintWriter(fw, true);
			
			String URL="https://soldesk.com/Notice";	
			
			for(int p=1; p<=2; p++) {
				String params="?page="+p;
				Document doc = Jsoup.connect(URL+params).get();
				//System.out.println(doc.toString()); //소스			
				Elements elements=doc.select(".tit");
				for(Element element : elements) {
					System.out.println(element.text());
					out.println(element.text());
				}//for end				
					
			}//for end

			
		} catch (Exception e) {
			System.out.println("크롤링 실패 : " + e);
		}//end	
		
		
		

	}//main() end
}//class end
