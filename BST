package javaapplication2;

/**
 *
 * @author Walaa Alfahmi
 */
public class BST {

    Node root;
    int size;

    class Node {

        int element;
        Node left;
        Node right;

        public Node(int e) {
            element = e;
        }
    }

    public BST() {

    }

    public void insert(int e) {
        Node newest = new Node(e);
        Node current = root;
        Node parent = null;
        if (root == null) {
            root = newest;
        } else {
            current = root;
            parent = null;
            while (current != null) {
                if (e < current.element) {
                    parent = current;
                    current = current.left;
                } else if (e > current.element) {
                    parent = current;
                    current = current.right;
                } else {
                    return;
                }
            }
            if (e < parent.element) {
                parent.left = newest;
            } else {
                parent.right = newest;
            }
        }
        size++;
    }
    
    public boolean search(int e){
        Node current = root;
        while(current != null){
            if(current.element == e){
                return true;
            } else if(current.element > e){
                current = current.left;
            } else {
                current = current.right;
            }
        }
        return false;
    }
    
    public void inorder(Node node){
        if(node != null){
            inorder(node.left);
            System.out.print(node.element + " ");
            inorder(node.right);
        }
        
    }
    
    public void postorder(Node node){
        if(node != null){
            postorder(node.left);
            postorder(node.right);
            System.out.print(node.element + " ");
        }
        
    }

    public void preorder(Node node){
        if(node != null){
            System.out.print(node.element + " ");
            preorder(node.left);
            preorder(node.right);
        }
        
    }
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        BST bst = new BST();
        bst.insert(2);
        bst.insert(3);
        bst.insert(1);
        bst.insert(5);
        System.out.println(bst.search(0));
        bst.inorder(bst.root);
        System.out.println("");
        bst.postorder(bst.root);
        System.out.println("");
        bst.preorder(bst.root);
        System.out.println("");
        System.out.println("root: "+bst.root.element +" and size: "+bst.size);
    }

}
