
import java.io.*;

/*
 * @name TagGetter
 * @purpose gets from a reader a tag ("<...>") or an inter-tag text
 * 
 * 
 */
class TagGetter{
    int lastChar;
    Reader r;

    public TagGetter(Reader r) throws IOException{
        this.r = r;
        lastChar = this.r.read();
    }

    public String next() throws IOException{
        switch(lastChar){
            case '<':    return nextTag(lastChar);      // start of "<...>"
            case -1 :    return null;                   // End Of File
            default :    return nextText(lastChar);     // regular text
        }
    }

    // ------------- protected methods below ------------------ //

    String nextTag(int c) throws IOException{
        if( c!='<' ) throw new IOException("Illegal argument to getTag():"+c);
        StringBuffer s = new StringBuffer();
        s.append((char)c);

        while( (c=r.read()) != -1 ){
            s.append((char)c);
            if(c=='>') {
                lastChar = r.read();
                return s.toString();
            }
        }
        return null;
    }


    String nextText(int c) throws IOException{

        StringBuffer s = new StringBuffer();
        s.append((char)c);

        while( (c=r.read()) != -1 ){
            if(c=='<') {
                lastChar = c;
                return s.toString();
            }
            s.append((char)c);
        }
        return null;
    }


/*
    public static void main(String[] args)
        throws FileNotFoundException, IOException
    {
        if( args.length < 1 ){
            System.out.println("Usage: java TagGetter filename.html");
            return;
        }

        System.out.println("Loading file "+args[0]);

        FileReader r = new FileReader(args[0]);
        TagGetter  t = new TagGetter(r);
        String s;
        
        while( (s = t.next()) != null ){
            System.out.println("Next tag:--------------");
            System.out.println(s);
        }
        System.out.println("End of file --------------");
    }
*/
}
