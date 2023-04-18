package oop0322;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class Test01_list {

	public static void main(String[] args) {
		//Java Collection Framework
		//->자료를 모아서 저장할 수 있는 클래스 및 인터페이스
		/*
			List  : 순서(Index)가 있다. 인덱스는 0부터 시작
					Vector, ArrayList ~~
			Set   : 순서가 없다
					HashSet ~~
					
			Map   : 순서가 없다. Key와 Value로 구성되어 있다
					HashMap, Properties ~~
					
			
			interface List{}
			class Vector{}
			class ArrayList
			
			interface Set{}
			
			interface Map{}
		
		
		*/
		////////////////////////////////////////////////
		
		//배열 : 자료를 모아 놓을 수 있음
		int[] num=new int[100];
		
		
		//1. List 계열
		//<E> Element 요소
		Vector vec=new Vector();
		vec.add(3);
		vec.add(2.4);
		vec.add('R');
		vec.add("KOREA");
		vec.add(new Integer(5));
		vec.add(new Double(6.7));
		
		//Integer inte=new Integer(5)	Old Version
		//Integer inte=5
		
		System.out.println(vec.size());//6 요소의 갯수
		
		for(int i=0; i<vec.size(); i++) {
			System.out.println(vec.get(i));
		}//for end
		
		vec.remove(0);					//0번째 요소 제거하기
		System.out.println(vec.size());	//5
		
		vec.removeAllElements();		//vec요소 전부 제거하기
		System.out.println(vec.size());	//0
		
		if(vec.isEmpty()) {//요소의 갯수가 0개 인지?
			System.out.println("비어 있다");
		}else {
			System.out.println("비어 있지 않다");
		}//if end
		//////////////////////////////////////////////////
		
		
		//다형성
		List list=new ArrayList();		
		list.add(5);
		list.add(6.7);
		list.add('M');
		list.add("SEOUL");
		
		System.out.println(list.size());//4
		
		
		//문) remove() 이용해서 list 요소를 전부 삭제하시오
		for(int i=list.size()-1; i>=0; i--) {//배열[0]부터 지우면 배열이 흐트러진다
			list.remove(i);
		}
		System.out.println(list.size());//0
		
		
		/*
		경은코드
		list.removeAll(list);
		System.out.println(list.size());
		*/
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

	}//main() end
}//class end
