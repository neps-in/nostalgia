/* this file contains the actual definitions of */
/* the IIDs and CLSIDs */

/* link this file in with the server and any clients */


/* File created by MIDL compiler version 5.01.0164 */
/* at Sat Dec 13 20:40:40 2003
 */
/* Compiler settings for D:\My b h o\sample\bhosrc\HTMLEdit.idl:
    Oicf (OptLev=i2), W1, Zp8, env=Win32, ms_ext, c_ext
    error checks: allocation ref bounds_check enum stub_data 
*/
//@@MIDL_FILE_HEADING(  )
#ifdef __cplusplus
extern "C"{
#endif 


#ifndef __IID_DEFINED__
#define __IID_DEFINED__

typedef struct _IID
{
    unsigned long x;
    unsigned short s1;
    unsigned short s2;
    unsigned char  c[8];
} IID;

#endif // __IID_DEFINED__

#ifndef CLSID_DEFINED
#define CLSID_DEFINED
typedef IID CLSID;
#endif // CLSID_DEFINED

const IID IID_IViewSource = {0x1E1B2878,0x88FF,0x11D2,{0x8D,0x96,0xD7,0xAC,0xAC,0x95,0x95,0x1F}};


const IID LIBID_HTMLEDITLib = {0x1E1B286C,0x88FF,0x11D2,{0x8D,0x96,0xD7,0xAC,0xAC,0x95,0x95,0x1F}};


const CLSID CLSID_ViewSource = {0x1E1B2879,0x88FF,0x11D2,{0x8D,0x96,0xD7,0xAC,0xAC,0x95,0x95,0x1F}};


#ifdef __cplusplus
}
#endif

