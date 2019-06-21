
import java.awt.*;
import java.awt.event.*;        // for ActionListener, ActionEvent
import java.lang.Thread;
import java.io.*;
import java.util.Stack;

public class MenuLoader extends Thread 
{
    Menu           m;                // root menu to be loaded
    ActionListener l;                // will be called when a menu is clicked
    ActionListener doneListener;     // will be called when the loading is done
    BookmarkParser p;                // used to parse an HTML bookmark file

    public MenuLoader(Menu m, Reader r, ActionListener l) 
        throws IOException
    {
        this.m = m;
        this.p = new BookmarkParser(r);
        this.l = l;
    }

    public void addActionListener(ActionListener l){
        this.doneListener = l;
    }

    public void run()
    {    
        MenuBuilder b = new MenuBuilder(m, l);
 
        try{
        while( p.next() != BookmarkParser.EOF ){
            switch(p.getType()){
            case p.BOOKMARK:
                b.addBookmark(p.getName(), p.getLink());    
                break;
            case p.FOLDER:
                b.startSubmenu(p.getName());
                break;
            case p.FOLDER_END:
                b.endSubmenu();
                break;
            case p.SEPARATOR:
                b.addSeparator();
                break;
            default:
                break;
            }
        }//while

        notifyListener("done");

        }catch(IOException e){
            notifyListener("error");
        }

    }

    void notifyListener(String command){
        if( doneListener != null ) {
            doneListener.actionPerformed(
                new ActionEvent(this, 0, command)
            );
        }
    }


};


class MenuBuilder{

    Stack s = new Stack();
    ActionListener l;

    public MenuBuilder(Menu m, ActionListener l){
        s.push(m);
        this.l = l;
    }

    public void addBookmark(String name, String link){
        MenuItem i = new MenuItem(name);
        i.setActionCommand(link);
        i.addActionListener(l);
        getCurrentMenu().add(i);
    }
    public void addSeparator(){    getCurrentMenu().addSeparator();    }
    public void startSubmenu(String name){
        Menu sub = new Menu(name);
        getCurrentMenu().add(sub);
        s.push(sub);  
    }
    public void endSubmenu() {     s.pop();    }
    
    Menu    getCurrentMenu(){
        return (Menu)(s.peek());
    }

}


