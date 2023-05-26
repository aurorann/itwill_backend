package crawling0328;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test08_NaverMovie {

	public static void main(String[] args) {
		//네이버 영화 평점 후기 크롤링하기
		
		
		try {

			String URL="https://movie.naver.com/movie/bi/mi/pointWriteFormList.naver";			
			String params="?code=215932";
				   params+="&type=after";
				   params+="&isActualPointWriteExecute=false";
				   params+="&isMileageSubscriptionAlready=false";
				   params+="&isMileageSubscriptionReject=false";
				   params+="&page=1";
			Document doc = Jsoup.connect(URL+params).get();
			//System.out.println(doc.toString()); //소스				
			
			
			/*
			//1) 평점 제목이 있는 요소//
			//<span id="_filtered_ment_0"> </span>
			//
			//<span id="_filtered_ment_9"> </span>			
			
			for(int ment=0; ment<=9; ment++) {
				Elements elements=doc.select("#_filtered_ment_"+ment);
				for(Element element : elements) {
					System.out.println(element.text());
				}//for end	
			}//for end	 	
			*/
			//////////////////////////////////////////////////////////////
			
			
			//2) 평점 제목이 있는 요소
			
			Elements elements=doc.select(".score_reple p");//<span class="score_reple">의 <p>만 가져오기
			
			//불필요한 요소 제거하기 <span class="ico_viewer">관람객</span>
			elements.select(".ico_viewer").remove();
			
			for(Element element : elements) {
				System.out.println(element.text());
			}//for end		
			
		} catch (Exception e) {
			System.out.println("크롤링 실패 : " + e);
		}//end	

	}//main() end
}//class end
