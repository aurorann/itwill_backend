import java.io.FileReader;

public class TypeTest {

	public static void main(String[] args) {
		
		/*
		System.out.println("TypeTest...");
		
		for(int i=0; i<args.length; i++) {
			System.out.println(args[i]);
		}//for end
		*/
		
		String filename=args[0];
		
		FileReader fr=null;
		
		
		try {
			fr=new FileReader(filename);
			while(true) {
				int data=fr.read();
				if(data==-1) {
					break;
				}//if end
				System.out.printf("%c", data);
			}
		}catch (Exception e) {
			System.out.println("failure : "+e);
		}finally {
			try {
				if(fr!=null) {fr.close();}
			} catch (Exception e) {}
		}//end
		
		
		
		
		

	}//main() end
}//class end
