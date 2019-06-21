// EventsDlg.cpp : Implementation of CEventsDlg
#include "stdafx.h"
#include "EventsDlg.h"

/////////////////////////////////////////////////////////////////////////////
// CEventsDlg

CEventsDlg::CEventsDlg()
{
   m_nHorizExtent = (int)::SendMessage(m_hwndEventsLst, LB_GETHORIZONTALEXTENT, 0, 0L);
}

CEventsDlg::~CEventsDlg()
{
}

LRESULT CEventsDlg::OnInitDialog(UINT uMsg, WPARAM wParam, LPARAM lParam, BOOL& bHandled)
{
   m_hwndEventsLst = GetDlgItem(IDC_EVENTS_LIST);   

	return 1;
}

LRESULT CEventsDlg::OnOK(WORD wNotifyCode, WORD wID, HWND hWndCtl, BOOL& bHandled)
{
	EndDialog(wID);
   m_hwndEventsLst = NULL;

	return 0;
}

void CEventsDlg::AddEventToList(const char* pszEvent)
{
   if (m_hwndEventsLst)
   {
      ::SendMessage(m_hwndEventsLst, LB_ADDSTRING, 0, (LPARAM)pszEvent); 

      //
      // Set the Horizontal extent so that the
      // horizontal scroll bar will be shown.
      //
      SIZE size;
      GetTextExtentPoint32(::GetDC(m_hwndEventsLst), pszEvent, strlen(pszEvent), &size);

      if (size.cx > m_nHorizExtent)
         m_nHorizExtent = size.cx;
   
      ::SendMessage(m_hwndEventsLst, LB_SETHORIZONTALEXTENT, m_nHorizExtent, 0L);
   }
}


