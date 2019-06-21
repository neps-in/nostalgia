// IEHlprObj.cpp : Implementation of CIEHlprObj
#include "stdafx.h"
#include "IEHelper.h"
#include "IEHlprObj.h"
#include "ExDispID.h"
#include <strstrea.h>


const char* const pszAppName = "IEHelper";

/////////////////////////////////////////////////////////////////////////////
// CIEHlprObj

//
// CIEHlprObj Methods
//

CIEHlprObj::~CIEHlprObj()
{
}

BOOL CIEHlprObj::ManageConnection(enum ConnectType eConnectType)
{
   if (!m_spWebBrowser2)
      return S_OK;

   HRESULT hr;

   //
   // If eConnectType is Advise then we are advising IE that we
   // want to handle events.  If eConnectType is Unadvise, we are
   // telling IE that we no longer want to handle events.
   //
   CComQIPtr<IConnectionPointContainer,
             &IID_IConnectionPointContainer> spCPContainer(m_spWebBrowser2);

   if (spCPContainer != NULL)
   {
      CComPtr<IConnectionPoint> spConnectionPoint;

      hr = spCPContainer->FindConnectionPoint(DIID_DWebBrowserEvents2, &spConnectionPoint);
      if (SUCCEEDED(hr))
      {
         if (eConnectType == Advise)
         {
            //
            // Advise the client site of our desire to be handle events
            //
            hr = spConnectionPoint->Advise((IDispatch*)this, &m_dwCookie);
            if (FAILED(hr))
               ATLTRACE("\n%s: ManageConnection(): Failed to Advise\n\n", pszAppName);
         }
         else
         {
            // Remove us from the list of people interested...
            hr = spConnectionPoint->Unadvise(m_dwCookie);
            if (FAILED(hr))
               ATLTRACE("\npszAppName: ManageConnection(): Failed to Unadvise\n\n", pszAppName);
         }
      }
   }

   return (SUCCEEDED(hr));
}

//
// IOleObjectWithSite Methods
//
STDMETHODIMP CIEHlprObj::SetSite(IUnknown *pUnkSite)
{
   USES_CONVERSION;

   if (!pUnkSite)
      ATLTRACE("\nSetSite(): pUnkSite is NULL\n\n");
   else
   {
      // Query pUnkSite for the IWebBrowser2 interface.
      m_spWebBrowser2 = pUnkSite;

      if (m_spWebBrowser2)
      {
         // Create the events dialog box
         m_dlgEvents.Create(::GetDesktopWindow());
         m_dlgEvents.ShowWindow(SW_SHOWNORMAL);

         // Connect to the browser in order to handle events.
         if (!ManageConnection(Advise))
            ::MessageBox(NULL, _T("Failure sinking events from IWebBrowser2"), pszAppName, MB_OK);
      }
   }

   return S_OK;
}


//
// IDispatch Methods
//
STDMETHODIMP CIEHlprObj::Invoke(DISPID dispidMember, REFIID riid, LCID lcid, WORD wFlags,
                                DISPPARAMS* pDispParams, VARIANT* pvarResult,
                                EXCEPINFO*  pExcepInfo,  UINT* puArgErr)
{
   USES_CONVERSION;
   strstream strEventInfo;

   if (!pDispParams)
      return E_INVALIDARG;

   //
   // Get the current URL
   //  
   LPOLESTR lpURL = NULL;
   m_spWebBrowser2->get_LocationURL(&lpURL);

   switch (dispidMember)
   {
      //
      // The parameters for this DISPID are as follows:
      // [0]: Cancel flag  - VT_BYREF|VT_BOOL
      // [1]: HTTP headers - VT_BYREF|VT_VARIANT
      // [2]: Address of HTTP POST data  - VT_BYREF|VT_VARIANT 
      // [3]: Target frame name - VT_BYREF|VT_VARIANT 
      // [4]: Option flags - VT_BYREF|VT_VARIANT
      // [5]: URL to navigate to - VT_BYREF|VT_VARIANT
      // [6]: An object that evaluates to the top-level or frame
      //      WebBrowser object corresponding to the event. 
      //
      case DISPID_BEFORENAVIGATE2:
         strEventInfo << "BeforeNavigate2: ";

         if (pDispParams->cArgs >= 5 && pDispParams->rgvarg[5].vt == (VT_BYREF|VT_VARIANT))
         {
            CComVariant varURL(*pDispParams->rgvarg[5].pvarVal);
            varURL.ChangeType(VT_BSTR);

            strEventInfo << OLE2T(varURL.bstrVal);
         }
         else
            strEventInfo << "NULL";

         strEventInfo << ends;
         break;

      //
      // The parameters for this DISPID:
      // [0]: URL navigated to - VT_BYREF|VT_VARIANT
      // [1]: An object that evaluates to the top-level or frame
      //      WebBrowser object corresponding to the event. 
      //
      case DISPID_NAVIGATECOMPLETE2:
         if (pDispParams->rgvarg[0].vt == (VT_BYREF|VT_VARIANT))
         {
            CComVariant varURL(*pDispParams->rgvarg[0].pvarVal);
            varURL.ChangeType(VT_BSTR);
  
            strEventInfo << "NavigateComplete2: "
                         << OLE2T(varURL.bstrVal)
                         << ends;
         }
         break;

      //
      // The parameters for this DISPID:
      // [0]: New status bar text - VT_BSTR
      //
      case DISPID_STATUSTEXTCHANGE:
         LPOLESTR lpStatusText;

         m_spWebBrowser2->get_StatusText(&lpStatusText);
         strEventInfo << "StatusTextChange: ";

         if (!strcmp(OLE2T(lpStatusText), ""))
            strEventInfo << "NULL";
         else
            strEventInfo << OLE2T(lpStatusText);

         strEventInfo << ends;
         break;

      //
      // The parameters for this DISPID:
      // [0]: Maximum progress - VT_I4
      // [1]: Amount of total progress - VT_I4
      //
      case DISPID_PROGRESSCHANGE:
         strEventInfo << "ProgressChange: ";

         if (pDispParams->cArgs == 0)
            strEventInfo << "NULL";
         else
         {
            if (pDispParams->rgvarg[0].vt == VT_I4)
               strEventInfo << pDispParams->rgvarg[0].lVal;

            if (pDispParams->cArgs > 1 && pDispParams->rgvarg[1].vt == VT_I4)
               strEventInfo << ", " << pDispParams->rgvarg[1].lVal;
         }

         strEventInfo << ends;
         break;

      case DISPID_DOCUMENTCOMPLETE:
         strEventInfo << "DocumentComplete" << ends;
         break;

      case DISPID_DOWNLOADBEGIN:
         strEventInfo << "DownloadBegin" << ends;
         break;

      case DISPID_DOWNLOADCOMPLETE:
         strEventInfo << "DownloadComplete" << ends;
         break;

      //
      // The parameters for this DISPID:
      // [0]: Enabled state - VT_BOOL
      // [1]: Command identifier - VT_I4
      //
      case DISPID_COMMANDSTATECHANGE:
         strEventInfo << "CommandStateChange: ";

         if (pDispParams->cArgs == 0)
            strEventInfo << "NULL";
         else
         {
            if (pDispParams->rgvarg[0].vt == VT_BOOL)
               strEventInfo << (pDispParams->rgvarg[0].boolVal ? "True" : "False");

            if (pDispParams->cArgs > 1 && pDispParams->rgvarg[1].vt == VT_I4)
               strEventInfo << ", " << pDispParams->rgvarg[1].lVal;
         }

         strEventInfo << ends;
         break;

      case DISPID_NEWWINDOW2:
         strEventInfo << "NewWindow2" << ends;
         break;

      //
      // The parameters for this DISPID:
      // [0]: Document title - VT_BSTR
      //
      case DISPID_TITLECHANGE:
         strEventInfo << "TitleChange: ";

         if (pDispParams->cArgs > 0 && pDispParams->rgvarg[0].vt == VT_BSTR)
            strEventInfo << OLE2T(pDispParams->rgvarg[0].bstrVal);
         else
            strEventInfo << "NULL";

         strEventInfo << ends;
         break;

      //
      // The parameters for this DISPID:
      // [0]: Name of property that changed - VT_BSTR
      //
      case DISPID_PROPERTYCHANGE:
         strEventInfo << "PropertyChange: ";

         if (pDispParams->cArgs > 0 && pDispParams->rgvarg[0].vt == VT_BSTR)
            strEventInfo << OLE2T(pDispParams->rgvarg[0].bstrVal);
         else
            strEventInfo << "NULL";

         strEventInfo << ends;
         break;

      //
      // The parameters for this DISPID:
      // [0]: Address of cancel flag - VT_BYREF|VT_BOOL
      //
      case DISPID_QUIT:
         strEventInfo << "Quit" << ends;

         ManageConnection(Unadvise);
         m_dlgEvents.DestroyWindow();
         break;

      default:
         strEventInfo << "Unknown Event" << dispidMember << ends;
         break;
   }

   m_dlgEvents.AddEventToList(strEventInfo.str());

   return S_OK;
}
