package coreservlets;

/**
 *
 * @author Kamran
 */
import java.util.*;

public class UI{

	private static Tree compTree;
	private static Node currentNode = new Node();
        

        
	public static void printOptions(){

		System.out.println("1. Add data.");
		System.out.println("2. Add children.");
		System.out.println("3. Print.");
		System.out.println("4. Move to another node.");

	}

	public static void menu(){

		Scanner sc = new Scanner(System.in);
		int option;
		String name;

		
			System.out.println("\nYou are at " + currentNode.getName() + " node.");
			System.out.println("What would you like to do?\n");
			printOptions();
			System.out.print("\nSelect an option: ");
			option = Integer.parseInt(sc.nextLine());

			switch(option){
				case 1:{
					if(compTree==null){
						System.out.print("Enter the name of the node: ");
						name = sc.nextLine();
						compTree = new Tree(name);
						currentNode = compTree.getRoot();
					}	
					
					menu();
					break;
				}
					
				case 2:{
					System.out.print("Enter the name of the child node: ");
					name = sc.nextLine();
					compTree.addChild(currentNode,name);
					menu();
					break;
				}
				case 3:{
					currentNode.print();
					menu();
					break;
				}
				case 4:{
					System.out.print("Enter the name of the node you would like to move to: ");
					name = sc.nextLine();
					currentNode = compTree.search(name,compTree.getRoot());
					menu();
					break;
				}

			}

	
	} 

	public static void main(String[] args){
		menu();
	}
}
