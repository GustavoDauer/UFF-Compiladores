/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.ArrayList;
import java.util.List;

public class Node {
    Token info;
    List<Node> children;
    
    public Node(){
        this.info = new Token("Vazio");
        this.children = new ArrayList<>();
    }
    
    public Node(Token info) {
        if(info != null)
            this.info = info;
        else
            this.info = new Token("Vazio");
        
        this.children = new ArrayList<>();
    }  
    
    public void addChildren(Token info){
        if(info != null)
            children.add(new Node(info));
    }
    
    public void addChildren(Node node){
        if(node != null)
            children.add(node);
    }
    
    @Override
    public String toString() {
        print();
        return "";
    }

    public void print() {
        print("", true);
    }

    private void print(String prefix, boolean isTail) {
        String tab = "";
        String space = "";
        if(isTail){
            tab = "└── ";
            space ="    ";
        } else{
            tab = "├── ";
            space = "│   ";
        }    
        System.out.println(prefix + tab + info.val);
        for (int i = 0; i < children.size() - 1; i++) {
            if(children.get(i) != null)
                children.get(i).print(prefix + space, false);
        }
        if (children.size() > 0) {
            if(children.get(children.size() - 1) != null)
                children.get(children.size() - 1).print(prefix + space, true);
        }
    }
}
