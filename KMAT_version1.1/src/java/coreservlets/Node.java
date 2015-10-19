package coreservlets;
/**
 *
 * @author Kamran
 */

import java.util.*;

public class Node implements java.io.Serializable{

    private String name;
    private Node parent;
    private ArrayList<Node> children;

    public Node(){
    	this.name = "root";
    	this.parent = null;
    	this.children = new ArrayList<>();
    }

    public Node(String name){
    	this.name = name;
    	this.parent = null;
    	this.children = new ArrayList<>();
    }

    public void setName(String name){
    	this.name = name;
    }

    public void setParent(Node parent){
    	this.parent = parent;
    }

    public String getName(){
    	return name;
    }

    public ArrayList<Node> getChildren(){
    	return children;
    }

    public void print(){
    	printData();
    	printParent();
    	printSiblings();
    	printChildren();
    }

    public void printData(){
    	System.out.println("\nName: " + name);
    }

    public void printParent(){
    	if(parent==null)
    		System.out.println("Parent: " + parent);
    	else
    		System.out.println("Parent: " + parent.getName());
    }

    public void printSiblings(){
    	if(parent==null)
    		System.out.println("Siblings: " + parent);
    	else{
    		System.out.print("Siblings: ");
    		ArrayList<Node> siblings = parent.getChildren();
    		if( siblings.isEmpty())
    			System.out.print("null");
    		else{
    			for(int i=0;i<siblings.size();++i){
    			Node child = siblings.get(i);
    			if(!child.getName().equals(name))
    				System.out.print(child.getName() + "\t");
    			}
    		}
    	System.out.println();
    	}	
    	
    }

    public void printChildren(){
    	System.out.print("Children: ");
    	if( children.isEmpty())
    		System.out.print("null");
    	else{
    		for(int i=0;i<children.size();++i){
    		Node child = children.get(i);
    		System.out.print(child.getName() + "\t");
    		}
    	}
    	System.out.println();
    }

}
