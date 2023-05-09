<<<<<<< HEAD
import java.util.Scanner;

public class Main {

	public static void main(String[] args) {

		Scanner in=new Scanner(System.in);
		
		int a=in.nextInt();
		int b=in.nextInt();
		
		in.close();
		System.out.println(a+b);
        System.out.println(a-b);
        System.out.println(a*b);
        System.out.println(a/b);
        System.out.println(a%b);



	}

=======
import java.util.*;
import java.io.*;

public class Main{
	
	public static void main(String[] args) throws IOException{
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		String year=br.readLine();
		
		int a = Integer.parseInt(year);
		
		System.out.println(a-543);
		
		
		
	}
	
>>>>>>> refs/remotes/origin/master
}