// HTMLCodeDlg.cpp : Implementation of CHTMLCodeDlg
#include "stdafx.h"
#include "HTMLCodeDlg.h"

#include "HTMLEdit.h"
#include "ViewSource.h"


/////////////////////////////////////////////////////////////////////////////
// CHTMLCodeDlg


/////////////////////////////////////////////////////////////////////////////
// CHTMLCodeDlg constructor and destructor
// 
CHTMLCodeDlg::CHTMLCodeDlg(CViewSource* pParent) : 
	m_pParent(pParent)
{
	// Store the pointer to the CViewSource class
}

CHTMLCodeDlg::~CHTMLCodeDlg()
{
}


/////////////////////////////////////////////////////////////////////////////
// OnInitDialog - Responds to the WM_INITDIALOG message
// 
LRESULT CHTMLCodeDlg::OnInitDialog(UINT uMsg, WPARAM wParam, 
	LPARAM lParam, BOOL& bHandled)
{
	// Move the Code Window to its rectangle
	RECT rc;
	m_pParent->GetCodeWindowRect(&rc);
	MoveWindow(rc.left, rc.top,
		   (rc.right-rc.left), 
		   (rc.bottom-rc.top), true);

	// Move the edit box inside the dialog
	RECT rcEdit;
	SetRect(&rcEdit, 0, 0, (rc.right-rc.left)-PADDING,
		(rc.bottom-rc.top)-2*(H_DLGBUTTONBAR+PADDING));

	::MoveWindow(GetDlgItem(IDC_TEXT), 0, 0, 
		(rcEdit.right-rcEdit.left),
		(rcEdit.bottom-rcEdit.top), true);

	// Move button and checkbox inside the dialog
	::MoveWindow(GetDlgItem(IDC_APPLY), 
		(rcEdit.right-rcEdit.left)-(W_BUTTON+PADDING), 
		rcEdit.bottom+PADDING,
		W_BUTTON, H_DLGBUTTONBAR, true);

	::MoveWindow(GetDlgItem(IDC_SHOW), 2, rcEdit.bottom+PADDING,
		(rcEdit.right-rcEdit.left)/2, 20, true);

	// Check the "Show at startup" flag
	CheckDlgButton(IDC_SHOW, m_pParent->GetCodeWindowStatus());
	return 1;  
}


/////////////////////////////////////////////////////////////////////////////
// OnDestroy - Responds to the WM_DESTROY message
// 
LRESULT CHTMLCodeDlg::OnDestroy(UINT, WPARAM, LPARAM, BOOL&)
{
	// Set the registry on exit
	m_pParent->EnableCodeWindow(IsDlgButtonChecked(IDC_SHOW));
	return 1;  
}


/////////////////////////////////////////////////////////////////////////////
// OnCancel - Responds to the IDCANCEL command notification 
// 
LRESULT CHTMLCodeDlg::OnCancel(WORD wNotifyCode, WORD wID, 
	HWND hWndCtl, BOOL& bHandled)
{
	EndDialog(wID);
	return 0;
}


/////////////////////////////////////////////////////////////////////////////
// OnApplyChanges - The user clicked to apply changes
// 
LRESULT CHTMLCodeDlg::OnApplyChanges(WORD wNotifyCode, WORD wID, 
	HWND hWndCtl, BOOL& bHandled)
{
	// Retrieve the Code Window text as Unicode string
	BSTR bstrHTMLText;
	GetDlgItemText(IDC_TEXT, bstrHTMLText);	

	// Ask to apply the changes
	m_pParent->ApplyChanges(bstrHTMLText);
	return 0;
}


/////////////////////////////////////////////////////////////////////////////
// OnShowAtStartup - The user checked the "Show at startup" flag
// 
LRESULT CHTMLCodeDlg::OnShowAtStartup(WORD wNotifyCode, WORD wID, 
	HWND hWndCtl, BOOL& bHandled)
{
	// Save the new setting to the registry
	m_pParent->EnableCodeWindow(IsDlgButtonChecked(IDC_SHOW));
	return 0;
}


/*  End of module: HTMLCodeDlg.cpp  */