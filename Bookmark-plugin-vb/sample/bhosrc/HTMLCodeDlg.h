// HTMLCodeDlg.h : Declaration of the CHTMLCodeDlg

#ifndef __HTMLCODEDLG_H_
#define __HTMLCODEDLG_H_

#include "resource.h"       // main symbols
#include <atlhost.h>

class CViewSource;

/////////////////////////////////////////////////////////////////////////////
// CHTMLCodeDlg
class CHTMLCodeDlg : 
	public CAxDialogImpl<CHTMLCodeDlg>
{
public:
	CHTMLCodeDlg(CViewSource *pParent);
	~CHTMLCodeDlg();

	CViewSource *m_pParent;
	enum { IDD = IDD_HTMLCODEDLG };

BEGIN_MSG_MAP(CHTMLCodeDlg)
	MESSAGE_HANDLER(WM_INITDIALOG, OnInitDialog)
	MESSAGE_HANDLER(WM_DESTROY, OnDestroy)
	COMMAND_ID_HANDLER(IDC_APPLY, OnApplyChanges)
	COMMAND_ID_HANDLER(IDC_SHOW, OnShowAtStartup)
	COMMAND_ID_HANDLER(IDCANCEL, OnCancel)
END_MSG_MAP()

	LRESULT OnInitDialog(UINT, WPARAM, LPARAM, BOOL&);
	LRESULT OnDestroy(UINT, WPARAM, LPARAM, BOOL&);
	LRESULT OnCancel(WORD, WORD, HWND, BOOL&);
	LRESULT OnShowAtStartup(WORD, WORD, HWND, BOOL&);
	LRESULT OnApplyChanges(WORD, WORD, HWND, BOOL&);
};

#endif //__HTMLCODEDLG_H_
