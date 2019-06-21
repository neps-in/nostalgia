
import java.awt.*;
import java.io.*;

public class MenuLoaderTester extends Frame {

    MenuLoaderTester(String filename) throws IOException{
        Reader r = new FileReader(filename);

    }
    public boolean handleEvent(Event evt) {
        if(evt.id == Event.WINDOW_DESTROY) 
            System.exit(0);
        else 
            return super.handleEvent(evt);
        return true;
    }
    
    public static void main(String[] args)
        throws IOException
    {
        if( args.length != 1 ){
            System.out.println("Usage: java MenuLoader bookmark.htm");
            return;
        }

        Menu m = new Menu("Bookmarks");
        MenuBar mb = new MenuBar();
        mb.add(m);

        Frame f = new MenuLoaderTester(args[0]);
        f.setSize(300,200);
        f.setMenuBar(mb);
        f.show();

        Reader r = new FileReader(args[0]);
        MenuLoader l = new MenuLoader(m, r);
        System.out.println("Starting menu loader");
        l.start();
    }

}
