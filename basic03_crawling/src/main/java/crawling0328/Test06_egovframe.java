package crawling0328;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test06_egovframe {

	public static void main(String[] args) {
		try {
			
			String fileName="I:/java202301/egovframe.txt";
			FileWriter fw=new FileWriter(fileName, true);//추가모드
			PrintWriter out=new PrintWriter(fw, true);
			
			String URL="https://www.egovframe.go.kr/home/ntt/nttList.do";	
			
			for(int p=0; p<=210; p+=10) {
				String params="?searchKey=&searchValue=&menuNo=74&bbsId=6";
						params+="&pagerOffset="+p;
				Document doc = Jsoup.connect(URL+params).get();
				//System.out.println(doc.toString()); //소스			
				
				Elements elements=doc.select(".lnk");
				/*
				 	<div class=".list_item">
				 		<div class="al">
			 		</div>
				 	<div class=".list_item">
				 		<div class="al">
			 		</div>
				 
				 Elements elements=doc.select(".list_item");
				 //class="al" 요소 제거하기
				 elements.select(".al").remove()				 
				 */
				
				
				
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
