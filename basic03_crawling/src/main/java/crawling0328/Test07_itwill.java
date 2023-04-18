package crawling0328;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test07_itwill {

	public static void main(String[] args) {
		//아이티윌 웹페이지의 공지사항 제목만 크롤링
		//URL에 웹페이지 경로가 나오지 않는 경우
		
		
		try {
			
			String fileName="I:/java202301/itwill.txt";
			FileWriter fw=new FileWriter(fileName, true);//추가모드
			PrintWriter out=new PrintWriter(fw, true);
			
			String URL="https://www.itwill.co.kr/cmn/board/BBSMSTR_000000000071/bbsList.do";	
			
			for(int p=1; p<=4; p++) {
				String params="?bbsId=BBSMSTR_000000000071&currentMenuNo=1031100&searchCondition=0&searchKeyword=";
						params+="&pageIndex="+p;
				Document doc = Jsoup.connect(URL+params).get();
				//System.out.println(doc.toString()); //소스				
				
				Elements elements=doc.select(".bgcol01");
				elements.select(".ac").remove();
				
				//다른 방법
				//Elements elements=doc.select(".bgcol01>td:nth-child(2)");
				//Elements elements=doc.select(".bgcol01 a");
				
				
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
