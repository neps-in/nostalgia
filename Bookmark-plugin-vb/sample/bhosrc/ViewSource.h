// ViewSource.h : Declaration of the CViewSource

#ifndef __VIEWSOURCE_H_
#define __VIEWSOURCE_H_

#include "resource.h"       // main symbols
#include <ExDisp.h>
#include "HTMLCodeDlg.h"
#include <shlwapi.h>
#include <msHtml.h>

const TCHAR REG_KEY[] = _T("Software\\MSDN\\BHO");
const TCHAR REG_VAL[] = _T("ShowWindowAtStartup");
const int H_DLGBUTTONBAR = 20;
const int W_BUTTON = 90;
const int PADDING = 5;

/////////////////////////////////////////////////////////////////////////////
// CViewSource
class ATL_NO_VTABLE CViewSource : 
	public CComObjectRootEx<CComSingleThreadModel>,
	public CComCoClass<CViewSource, &CLSID_ViewSource>,
	public IObjectWithSiteImpl<CViewSource>,
	public IDispatchImpl<IViewSource, &IID_IViewSource, &LIBID_HTMLEDITLib>
{
public:
	CViewSource() : m_dlgCode(this) 
	{
		m_bDocumentCompleted = false;

		RECT rc;
		SystemParametersInfo(SPI_GETWORKAREA, 0, &rc, 0);
		
		CopyRect(&m_rcIE, &rc);
		m_rcIE.bottom = (rc.bottom*6/10); 

		CopyRect(&m_rcHTML, &rc);
		m_rcHTML.top = m_rcIE.bottom; 
	}
	

DECLARE_REGISTRY_RESOURCEID(IDR_VIEWSOURCE)

DECLARE_PROTECT_FINAL_CONSTRUCT()

BEGIN_COM_MAP(CViewSource)
	COM_INTERFACE_ENTRY(IViewSource)
	COM_INTERFACE_ENTRY(IDispatch)
	COM_INTERFACE_ENTRY(IObjectWithSite)
END_COM_MAP()

// IObjectWithSite
public:
	STDMETHOD(SetSite)(IUnknown *pUnkSite);

// IDispatch
public:    
	STDMETHOD(Invoke)(DISPID, REFIID, LCID, WORD, DISPPARAMS*, 
		              VARIANT*, EXCEPINFO*, UINT*);

// IViewSource	
public:
	STDMETHOD(OnDocumentComplete)(BOOL bForceWindow=false);
	STDMETHOD(OnQuit)(void);
	STDMETHOD(EnableCodeWindow)(BOOL);
	STDMETHOD(GetCodeWindowRect)(LPRECT);
	STDMETHOD(ApplyChanges)(BSTR);
	BOOL GetCodeWindowStatus(void);

private:
	STDMETHOD(Connect)(void);
	STDMETHOD(Disconnect)(void);
	STDMETHOD(GetDocumentContent)(void);
	STDMETHOD(RetrieveBrowserWindow)(void);
	BOOL ManageSourceCodeWindow(BOOL);
	static BOOL CALLBACK WndEnumProc(HWND, LPARAM); 
	static LRESULT CALLBACK IEKeyboardProc(int, WPARAM, LPARAM); 

private:
	CComQIPtr<IWebBrowser2, &IID_IWebBrowser2> m_spWebBrowser2;
    CComQIPtr<IConnectionPointContainer, &IID_IConnectionPointContainer> m_spCPC;
	CComPtr<IHTMLElement> m_pBody;
	BOOL m_bDocumentCompleted;
	DWORD m_dwCookie;
	HWND m_hwndBrowser;
	CHTMLCodeDlg m_dlgCode;
	RECT m_rcIE, m_rcHTML;
};

#endif //__VIEWSOURCE_H_
