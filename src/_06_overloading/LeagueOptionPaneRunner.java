package _06_overloading;

public class LeagueOptionPaneRunner {
	public static void main(String[] args) {
	
		LeagueOptionPane league = new LeagueOptionPane();
		league.showMessageDialog("The League is the Best");
		league.showMessageDialog("Hello, my name is Mr.Computer", "Welcome");
		league.showMessageDialog("Hello, my name is Mr.Computer", "Welcome", "java.png");
		
		System.out.println("test");
		
	}
}
