package coreservlets;

/**
 *
 * @author Kamran
 */

import java.util.*;

public class Tree implements java.io.Serializable{

    private final Node root;
    public Node currentNode;

    public Tree(String name){
        root = new Node(name);
    }

    public Node getRoot(){
    	return root;
    }

    public void addChild(Node parent,String name){
    	Node child = new Node(name);
    	parent.getChildren().add(child);
    	child.setParent(parent);
    }

    public Node search(String name,Node start){
    	if(start.getName().equals(name))
			return start;
    	else{
    		ArrayList<Node> children = start.getChildren();
    		Node nodeToReturn = null;
    		for(int i=0;i<children.size() && nodeToReturn==null;++i)
    			nodeToReturn = search(name,children.get(i));
    		return nodeToReturn;
    	}
    }

    
}
