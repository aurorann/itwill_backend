package crawling0328;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test09_NaverMovie {

	public static void main(String[] args) {
		//네이버 영화 평점 후기 크롤링하기
		//예)스즈메의 문단속 영화 평점 제목을 공감순으로 정렬 후 크롤링 하기(대략 9,441건)
		//suzume.txt 파일에 저장하기		
		
		try {
			
			String fileName="I:/java202301/suzume.txt";
			FileWriter fw=new FileWriter(fileName, true);//추가모드
			PrintWriter out=new PrintWriter(fw, true);

			String URL="https://movie.naver.com/movie/bi/mi/pointWriteFormList.naver";			
			for(int p=1; p<=945; p++) {
			String params="?code=215932";//영화코드번호
			   	   params+="&type=after";
			   	   params+="&isActualPointWriteExecute=false";
			   	   params+="&isMileageSubscriptionAlready=false";
			   	   params+="&isMileageSubscriptionReject=false";
				   params+="&order=sympathyScore";
				   params+="&page="+p;

			Document doc = Jsoup.connect(URL+params).get();
			//System.out.println(doc.toString()); //소스		
			
			
			Elements elements=doc.select(".score_reple p");	
			elements.select(".ico_viewer").remove();
			
				for(Element element : elements) {
					System.out.println(element.text());
					out.println(element.text());
				}//for end				
			}//for end	
			
			out.close();
			fw.close();
			System.out.println("-----------------suzume.txt 평점 저장 완성");
		} catch (Exception e) {
			System.out.println("크롤링 실패 : " + e);
		}//end	

	}//main() end
}//class end
