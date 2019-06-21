/*
<html>
<head><title>Bookmark Menu Applet Window</title></head>
<body onLoad="document.applets["BookmarkMenuApplet"].setTarget(opener.name);">

    <applet code="BookmarkMenuApplet.class" name="BookmarkMenuApplet"
        height=20 width=100>
        <param name=filename   value="bookmark.html">
        <param name=target     value="j1menutarget">
    </applet>

    WARNING: Use either parameter 'target' or setTarget() method.
             Don't use both!
</body></html>
 */
import java.applet.*;
import java.awt.event.*;
import java.awt.*;            // for Menu
import java.net.*;            // for URL, MalformedURLException
import java.io.*;             // for InputStream, Reader 

public class BookmarkMenuApplet extends Applet 
{
    final PopupMenu m = new PopupMenu();;
    final Button    b = new Button();

    String    target = "j1menu";            // target name of browser window
    String    filename = "bookmark.htm";    // file to read bookmarks from

    final Applet a = this;                  // only final variables can be used in inner anonymous classes

    ActionListener jumpToUrl =              // When a menu is clicked, jump to corresponding URL
        new ActionListener(){       
            public void actionPerformed(ActionEvent e) {
                try{  
                    URL url = new URL(e.getActionCommand());    // the menu's action command stores URL 
                        a.getAppletContext().showDocument(url,target);    // load the URL to the target browser window
                }catch(MalformedURLException me){
                    showStatus("Malformed URL: "+e.getActionCommand());
                }
            }
        }
    ;
 

    public void init() 
    {
        setLayout(new BorderLayout(0,0));   // BorderLayout can display a button ...
                                            // ...with the size of the applet
        b.setLabel("Loading...");
        b.setSize(this.getSize());      // button should occupy the whole applet

        add(b);                         // Clicking on this button ...
        add(m);                         // ...will activate this popup menu
        validate();                     // Draw the applet as soon as possible
                                        // ..although it will not be ready for a while
                                        // That will make it look as if it is fast!
                                        
        // Clicking on the button should open the popup menu

        b.addActionListener( new ActionListener(){
                public void actionPerformed(ActionEvent e){
                    Rectangle r = b.getBounds();
                    m.show(a, r.x, r.y+r.height); 
                }
       });

       // Load the menu items from the bookmark file

       getParameters();

        try{                                             // now load menu description file

        MenuLoader loader = new MenuLoader(              // create new menu loader...
                m                                        // .. to load this menu... 
            ,   getBookmarksReader(filename)             // .. from this file 
            ,   jumpToUrl                                // .. jump to URL when menu clicked
            );
 
        addAboutMenuItem(m, jumpToUrl,                   // Add "About this applet" menu item
            getCodeBase().toString()+"readme.html");     // Description file in the same directory where this applet is

        loader.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e) {
                if( e.getActionCommand().equals("done") )
                        b.setLabel("Bookmarks");
                else    b.setLabel("Error");
            }
        });
        loader.start();

        }catch(IOException e){
            showStatus("IOException:"+e);
            b.setLabel("Loading Error");
            b.setEnabled(false);
        }
    }

    /* This method can be called from a JavaScript to 
     *  specify target window for opening bookmarks
     */
    public void setTarget(String target){
        this.target = target;
    }


    // ---------------- protected methods ---------------

    Reader getBookmarksReader(String filename) throws IOException{
        return new InputStreamReader( 
                    new URL(getDocumentBase(), filename)
                        .openStream()
        );
    }

    void getParameters(){
        String t = getParameter("target");
        if( t != null ) target = t;
        
        t = getParameter("filename");
        if( t!= null ) filename = t;
    }

    /*
     * addAboutMenuItem()
     * @purpose Adds "About" menu item as the 1st item in the menu
     */
    static void addAboutMenuItem(PopupMenu m, ActionListener action, String url)
    {
        MenuItem i = new MenuItem("About \"Bookmark Menu Applet\"");
        i.setActionCommand(url);
        i.addActionListener(action);

        m.insertSeparator(0);
        m.insert(i,0);
    }

    // ---------------- methods for testing ----------------

    void debug(String msg){ System.out.println(msg); }    

    /*
    public URL getDocumentBase(){
        try{
            return new URL("file:.");
        }catch(MalformedURLException e){
            showStatus("MalformedURLException:"+e);
            return null;
        }
    }

    public void showStatus(String status){System.out.println(status);}

    public static void main(String[] args)
    {
        Frame f = new Frame("Bookmark Tester");
        f.setSize(300,200);
        
        final Applet a = new j1menu();
        f.add(a);
        f.addWindowListener( new WindowListener(){
            public void windowClosed(WindowEvent e)  {}
            public void windowClosing(WindowEvent e) {  System.exit(0); }
            public void windowActivated(WindowEvent e)  {}
            public void windowDeactivated(WindowEvent e){}
            public void windowIconified(WindowEvent e)  { a.stop(); }
            public void windowDeiconified(WindowEvent e){ a.start(); }
            public void windowOpened(WindowEvent e) {  a.init(); a.start();}
        });
        f.show();
    }
    */
}
