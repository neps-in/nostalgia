// ViewSource.cpp : Implementation of CViewSource
#include "stdafx.h"
#include "HTMLEdit.h"
#include "ViewSource.h"
#include <ExDispID.h>

/////////////////////////////////////////////////////////////////////////////
// Global variables used in this module
static HHOOK g_hHook=NULL;		// Handle for the keyboard hook
static CViewSource *g_pThis;	// Pointer to this class


/////////////////////////////////////////////////////////////////////////////
// CViewSource


/////////////////////////////////////////////////////////////////////////////
// SetSite - Initializes the BHO
// 
HRESULT CViewSource::SetSite(IUnknown *pUnkSite)
{
	// Retrieve and store the IWebBrowser2 pointer 
	m_spWebBrowser2 = pUnkSite; 
	if (m_spWebBrowser2 == NULL)
		return E_INVALIDARG;
	
	// Retrieve and store the IConnectionPointerContainer pointer
	m_spCPC = m_spWebBrowser2;
	if (m_spCPC == NULL) 
		return E_POINTER;

	// Retrieve and store the HWND of the browser. Plus install
	// a keyboard hook 
	RetrieveBrowserWindow();

	// Connect to the container for receiving event notifications
	return Connect();
}


/////////////////////////////////////////////////////////////////////////////
// Connect - Register to the container as an event handler
// 
HRESULT CViewSource::Connect(void)
{
	HRESULT hr;
	CComPtr<IConnectionPoint> spCP;

	// Receives the connection point for WebBrowser events
    hr = m_spCPC->FindConnectionPoint(
			DIID_DWebBrowserEvents2, 
			&spCP);
    if (FAILED(hr))
		return hr;

    // Pass the event handlers to the container
	hr = spCP->Advise( 
			reinterpret_cast<IDispatch*>(this), 
			&m_dwCookie);

    return hr; 
}


/////////////////////////////////////////////////////////////////////////////
// Disconnect - Unregister as an event handler module
// 
HRESULT CViewSource::Disconnect(void)
{
	HRESULT hr;
	CComPtr<IConnectionPoint> spCP;

	// Receives the connection point for WebBrowser events
    hr = m_spCPC->FindConnectionPoint(
			DIID_DWebBrowserEvents2, 
			&spCP);
    if (FAILED(hr))
		return hr;

    // Stop getting event notifications
	hr = spCP->Unadvise(m_dwCookie);
    return hr;
}


/////////////////////////////////////////////////////////////////////////////
// Invoke - Switch-procedure for events
// 
HRESULT CViewSource::Invoke(DISPID dispidMember, REFIID riid, LCID lcid, WORD wFlags,
	DISPPARAMS* pDispParams, VARIANT* pvarResult,
    EXCEPINFO*  pExcepInfo,  UINT* puArgErr)
{
   if (!pDispParams)
      return E_INVALIDARG;
 
   // Document complete
   if (dispidMember == DISPID_DOCUMENTCOMPLETE)
   {
	   OnDocumentComplete();
	   m_bDocumentCompleted = true;
   }

   // Download complete (to catch refresh and F5)
   if (dispidMember == DISPID_DOWNLOADCOMPLETE)
	   if (m_bDocumentCompleted)
		OnDocumentComplete();

   // Quit
   if (dispidMember == DISPID_ONQUIT)
		OnQuit();

   return S_OK;
}


/////////////////////////////////////////////////////////////////////////////
// OnDocumentComplete - A new document's been initialized
// and is available through the WebBrowser's Document property
// 
HRESULT CViewSource::OnDocumentComplete(BOOL bForceWindow)
{
	// bForceWindow if set to TRUE force the Code Window to
	// be displayed
	
	// Show the code window if necessary
	if (ManageSourceCodeWindow(bForceWindow))
	{
		// Fill the code window with the HTML source code
		GetDocumentContent();

		// Move the IE window in the upper portion of the screen
		MoveWindow(m_hwndBrowser, m_rcIE.left, m_rcIE.top,
		   (m_rcIE.right-m_rcIE.left), 
		   (m_rcIE.bottom-m_rcIE.top), true);
	}

	return S_OK;
}


/////////////////////////////////////////////////////////////////////////////
// OnQuit - The browser (and the BHO) is terminating
// 
HRESULT CViewSource::OnQuit()
{
	// Unregister as an event listener 
	Disconnect();

	// Destroy the Code Window
	m_dlgCode.DestroyWindow(); 
	
	// Unregister the keyboard hook previously installed
	UnhookWindowsHookEx(g_hHook);

	return S_OK;
}


/////////////////////////////////////////////////////////////////////////////
// ManageSourceCodeWindow - Display the Code Window if required
// 
BOOL CViewSource::ManageSourceCodeWindow(BOOL bForceWindow)
{
	// Whether the Code Window should be initially displayed
	// is a persistent information stored in the registry

	// Read the state from the registry
	BOOL bShowCodeWindow;
	if (bForceWindow)
		bShowCodeWindow = true;
	else
		bShowCodeWindow = GetCodeWindowStatus();

	// If here, the Code Window must be shown
	if (bShowCodeWindow) 
	{
		// Unless it's already visible...
		if (!IsWindowVisible(m_dlgCode.m_hWnd)) 
		{
			// The Code Window is created as a child of IE
			m_dlgCode.Create(m_hwndBrowser);
			m_dlgCode.ShowWindow(SW_SHOWNORMAL);
		}
	}

	return true;
}


/////////////////////////////////////////////////////////////////////////////
// GetDocumentContent - Retrieve the HTML source code and display
// it in the Code Window
// 
HRESULT CViewSource::GetDocumentContent()
{
	USES_CONVERSION;

    // Get the WebBrowser's document object
	CComPtr<IDispatch> pDisp;
	HRESULT hr = m_spWebBrowser2->get_Document(&pDisp);
	if (FAILED(hr))
		return hr;

	// Verify that what we get is a pointer to a IHTMLDocument2 
	// interface. To be sure, let's query for 
	// the IHTMLDocument2 interface (through smart pointers)
	CComQIPtr<IHTMLDocument2, &IID_IHTMLDocument2> spHTML;
	spHTML = pDisp;

	// The previous step is sufficient to keep Explorer aside
	// without an explicit check against the loader module

	// Extract the source code of the document
	if (spHTML)
	{
		// Get the BODY object
		hr = spHTML->get_body(&m_pBody); 
		if (FAILED(hr))
			return hr;

		// Get the HTML text
		BSTR bstrHTMLText;
		hr = m_pBody->get_outerHTML(&bstrHTMLText); 
		if (FAILED(hr))
			return hr;

		// Convert the text from Unicode to ANSI
		LPTSTR psz = new TCHAR[SysStringLen(bstrHTMLText)];
		lstrcpy(psz, OLE2T(bstrHTMLText));
		
		// Enable changes to the text
		HWND hwnd = m_dlgCode.GetDlgItem(IDC_TEXT);
		EnableWindow(hwnd, true);

		hwnd = m_dlgCode.GetDlgItem(IDC_APPLY);
		EnableWindow(hwnd, true);

		// Set the text in the Code Window
		m_dlgCode.SetDlgItemText(IDC_TEXT, psz); 
		delete [] psz;
	}
	else	// The document isn't a HTML page
	{
		m_dlgCode.SetDlgItemText(IDC_TEXT, _T("")); 
		HWND hwnd = m_dlgCode.GetDlgItem(IDC_TEXT);
		EnableWindow(hwnd, false);

		hwnd = m_dlgCode.GetDlgItem(IDC_APPLY);
		EnableWindow(hwnd, false);
	}

 	return S_OK;  
}


/////////////////////////////////////////////////////////////////////////////
// ApplyChanges - Modify the content of the document
// 
HRESULT CViewSource::ApplyChanges(BSTR bstrHTMLText)
{
	// Set a new content for the page being viewed through IE.
	// This content comes from what the user entered in the Code
	// Window
	m_pBody->put_innerHTML(bstrHTMLText);
	return S_OK;
}


/////////////////////////////////////////////////////////////////////////////
// RetrieveBrowserWindow - Get the HWND of the browser
// 
HRESULT CViewSource::RetrieveBrowserWindow()
{
	// To get the HWND of the browser we need to enumerate
	// all the windows belonging to this thread. We could
	// check for the window's class name if it wasn't changed
	// from Windows 95/NT 4.0 to Windows 98. With Windows 98
	// the class name is the same as any other open folder, so
	// there's no certainty of uniqueness.

	// Get the HWND of the browser's window
	EnumThreadWindows( 
		GetCurrentThreadId(),
		WndEnumProc,
		reinterpret_cast<LPARAM>(&m_hwndBrowser) );

	if (!IsWindow(m_hwndBrowser))
		return E_POINTER;

	// We need a way to toggle the view state of the Code
	// Window. By the means of a local hook we'll be able
	// to handle keys before they are sent to the IE wndproc

	// Set the keyboard hook
	g_hHook = SetWindowsHookEx( WH_KEYBOARD, 
			reinterpret_cast<HOOKPROC>(IEKeyboardProc), 
			NULL, 
			GetCurrentThreadId() );

	// Store pointer to this class. This global pointer will
	// be used by the hook procedure which is a static member
	// of the class and couldn't access otherwise its members
	g_pThis = this;
	return S_OK;
}


/////////////////////////////////////////////////////////////////////////////
// WndEnumProc - Enumeration procedure for thread's windows
// 
BOOL CALLBACK CViewSource::WndEnumProc(HWND hwnd, LPARAM lParam)
{
	TCHAR szClassName[MAX_PATH];
	GetClassName(hwnd, szClassName, MAX_PATH);

	// IEFrame was the window's class name under Win95. The
	// other is the title under Win98.
	if (!lstrcmpi(szClassName, _T("CabinetWClass")) ||
        !lstrcmpi(szClassName, _T("IEFrame")))
	{
		// We need to return the HWND found if any. The lParam
		// is a pointer to the HWND to be used the return buffer
		HWND *phWnd = reinterpret_cast<HWND*>(lParam);
		*phWnd = hwnd;

		// Return FALSE to stop enumeration once we've found the 
		// expected window
		return false;
	}

	// Return TRUE to continue enumerating windows
	return true;
}


/////////////////////////////////////////////////////////////////////////////
// IEKeyboardProc - Keyboard hook procedure. It's a static member
// of the class and needs g_pThis to access the class members
// 
LRESULT CALLBACK CViewSource::IEKeyboardProc(int nCode, 
	WPARAM wParam, LPARAM lParam)
{
	// Typical start-off for any hook
	if( nCode <0 )
		return CallNextHookEx(g_hHook, nCode, wParam, lParam);

	// Process the key only once
	if ((lParam & 0x80000000) || (lParam & 0x40000000))
		return CallNextHookEx(g_hHook, nCode, wParam, lParam);

	// The key we're interested in is F12. If it's been pressed
	// then forces the Code Window to be refreshed
	if (wParam==VK_F12)	
		g_pThis->OnDocumentComplete(true);

	// Typical end for any hook procedure
	return CallNextHookEx(g_hHook, nCode, wParam, lParam);
}


/////////////////////////////////////////////////////////////////////////////
// EnableCodeWindow - Make persistent the view state for the 
// Code Window
// 
HRESULT CViewSource::EnableCodeWindow(BOOL bVisible)
{
	SHSetValue(HKEY_CURRENT_USER, REG_KEY, REG_VAL,
		REG_DWORD, &bVisible, sizeof(DWORD)); 
	return S_OK;
}


/////////////////////////////////////////////////////////////////////////////
// GetCodeWindowStatus - Read from registry the view state for
// the Code Window
// 
BOOL CViewSource::GetCodeWindowStatus(void)
{
	DWORD dwType, dwVal=true;
	DWORD dwSize=sizeof(DWORD);
	
	SHGetValue(HKEY_CURRENT_USER, REG_KEY, REG_VAL, 
		&dwType, &dwVal, &dwSize);
	return dwVal;
}


/////////////////////////////////////////////////////////////////////////////
// GetCodeWindowRect - Set the rectangle for the Code Window
// 
HRESULT CViewSource::GetCodeWindowRect(LPRECT lprc)
{
	// Both the rectangle of IE and the Code Window are
	// calculated by the class constructor
	CopyRect(lprc, &m_rcHTML);
	return S_OK;
}



/*  End of module: ViewSource.cpp  */