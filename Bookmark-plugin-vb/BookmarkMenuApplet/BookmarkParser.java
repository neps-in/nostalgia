
import java.io.*;


public class BookmarkParser {

    public static final int EOF         = -1;
    public static final int UNKNOWN     =  0;
    public static final int BOOKMARK    =  1;
    public static final int FOLDER      =  2;
    public static final int FOLDER_END  =  3;
    public static final int SEPARATOR   =  4;
            
    int         type = UNKNOWN;
    TagGetter   t;
    String      name, link;
                

    public BookmarkParser(Reader r)
            throws IOException
    {
        t = new TagGetter(r);
    }

    public int    getType(){        return type;   }
    public String getName(){        return name;   }
    public String getLink(){        return link;   }


    public int next() throws IOException{
        String s = t.next();

        if( s == null ) return EOF;

        if( isItem(s) ){
            s = t.next();
            if( isFolder(s) )     return nextFolder(s);
            if( isBookmark(s))    return nextBookmark(s);
            error("ITEM: Unknown type: "+s);
            return UNKNOWN;
        }
        else if( isFolderEnd(s))  return nextFolderEnd(s);
        else if( isSeparator(s))  return nextSeparator(s);
        else                      return nextUnknown(s);
    }

    

    // ------------------- protected methods below -----------------//

    boolean isItem     (String s) { return s.equals("<DT>"); }
    boolean isFolder   (String s) { return s.startsWith("<H3"); }
    boolean isBookmark (String s) { return s.startsWith("<A HREF"); }
    boolean isFolderEnd(String s) { return s.equals("</DL>"); }
    boolean isSeparator(String s) { return s.equals("<HR>"); }

    int nextFolder   (String s)   throws IOException
    {
        name = t.next();    link = null;
        String folderEnd = t.next();
        if( !folderEnd.equals("</H3>") )
            error("FOLDER_END: expected </H3>, got "+folderEnd);
        return type = FOLDER;
    }

    int nextBookmark (String s) throws IOException
    {
        int firstQuote;
        link = s.substring(
                firstQuote = s.indexOf('"') + 1
           ,    s.indexOf('"', firstQuote)
        );
        name = t.next();
        if( name.equals("</A>") )                            // no bookmark name specified
            name = "";
        else {
            String bookmarkEnd = t.next();
            if( ! bookmarkEnd.equals("</A>") )              // clear until the end of <A ..>...</A>
                error("ITEM: Expected </A>, got "+bookmarkEnd
                    +", bookmark name=" + name);
        }
        return type = BOOKMARK;
    }

    int nextFolderEnd(String s){    return type = FOLDER_END;}
    int nextSeparator(String s){    return type = SEPARATOR;}
    int nextUnknown  (String s){    return type = UNKNOWN;}

/*

    public static void main(String args[])
        throws FileNotFoundException, IOException
    {
         if( args.length < 1 ){
            System.out.println("Usage: java BookmarkParser bookmark.htm");
            return;
        }

        System.out.println("Loading file "+args[0]);

        FileReader r = new FileReader(args[0]);
        BookmarkParser p = new BookmarkParser(r);

        while( p.next() != BookmarkParser.EOF ){
            switch(p.getType()){
            case p.BOOKMARK:
                print("BOOKMARK: " + p.getName() + " -> " + p.getLink());    
                break;
            case p.FOLDER:
                print("FOLDER START ----" + p.getName() );
                break;
            case p.FOLDER_END:
                print("FOLDER END ----");
                break;
            default:
                break;
            }
        }    // while
    }
*/
    static void print(String s){ System.out.println(s); }
    static void error(String s){ System.out.println("*** " + s); }

}
