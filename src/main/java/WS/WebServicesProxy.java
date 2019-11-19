package WS;

public class WebServicesProxy implements WS.WebServices {
  private String _endpoint = null;
  private WS.WebServices webServices = null;
  
  public WebServicesProxy() {
    _initWebServicesProxy();
  }
  
  public WebServicesProxy(String endpoint) {
    _endpoint = endpoint;
    _initWebServicesProxy();
  }
  
  private void _initWebServicesProxy() {
    try {
      webServices = (new WS.WebServicesServiceLocator()).getWebServicesPort();
      if (webServices != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)webServices)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)webServices)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (webServices != null)
      ((javax.xml.rpc.Stub)webServices)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public WS.WebServices getWebServices() {
    if (webServices == null)
      _initWebServicesProxy();
    return webServices;
  }
  
  public java.lang.String[] listasXCatPublicas(java.lang.String arg0) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.listasXCatPublicas(arg0);
  }
  
  public java.lang.String[] listarCanalesPublicos() throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.listarCanalesPublicos();
  }
  
  public java.lang.Object[] listarVideosPrivados(java.lang.String arg0) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.listarVideosPrivados(arg0);
  }
  
  public java.lang.String[] videosXCatPublicos(java.lang.String arg0) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.videosXCatPublicos(arg0);
  }
  
  public WS.DtVideo[] buscarVideosPublicos(java.lang.String arg0) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.buscarVideosPublicos(arg0);
  }
  
  public WS.DtCanal[] buscarCanalesPublicos(java.lang.String arg0) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.buscarCanalesPublicos(arg0);
  }
  
  public java.lang.Object[] listarDatosUsuario(java.lang.String arg0) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.listarDatosUsuario(arg0);
  }
  
  public java.lang.Object[] listarListasPublicas() throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.listarListasPublicas();
  }
  
  public WS.DtLista[] buscarListasPublicas(java.lang.String arg0) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.buscarListasPublicas(arg0);
  }
  
  public WS.DtVideo[] videosEnListaPublica(WS.DtLista arg0) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.videosEnListaPublica(arg0);
  }
  
  public WS.DtLista[] listarListasParticulares(WS.DtUsuario arg0) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.listarListasParticulares(arg0);
  }
  
  public boolean ingresarComentario(WS.DtComentario arg0) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.ingresarComentario(arg0);
  }
  
  public void seleccionarComentario(WS.DtComentario arg0) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    webServices.seleccionarComentario(arg0);
  }
  
  public void modificarUsuarioCanal(WS.DtUsuario arg0, WS.DtCanal arg1) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    webServices.modificarUsuarioCanal(arg0, arg1);
  }
  
  public void ingresarTipoLista(boolean arg0) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    webServices.ingresarTipoLista(arg0);
  }
  
  public boolean valorarVideoPublico(int arg0, java.lang.String arg1, boolean arg2) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.valorarVideoPublico(arg0, arg1, arg2);
  }
  
  public void modificarListaParticular(WS.DtLista arg0, WS.DtLista arg1) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    webServices.modificarListaParticular(arg0, arg1);
  }
  
  public java.lang.Object[] listarVideosPublicos() throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.listarVideosPublicos();
  }
  
  public void seleccionarCategoria(java.lang.String arg0) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    webServices.seleccionarCategoria(arg0);
  }
  
  public WS.DtUsuario seleccionarUsuario(java.lang.String arg0) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.seleccionarUsuario(arg0);
  }
  
  public void dejarSeguir() throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    webServices.dejarSeguir();
  }
  
  public boolean ingresarUsuario(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, java.lang.String arg3, java.lang.String arg4, java.util.Calendar arg5, java.lang.String arg6, WS.DtCanal arg7) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.ingresarUsuario(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
  }
  
  public void finCasoUso() throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    webServices.finCasoUso();
  }
  
  public java.lang.String findDuenioLista(int arg0) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.findDuenioLista(arg0);
  }
  
  public java.lang.String[] listarCategorias() throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.listarCategorias();
  }
  
  public boolean bajaUsuario(java.lang.String arg0) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.bajaUsuario(arg0);
  }
  
  public java.lang.String[] listarVideos() throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.listarVideos();
  }
  
  public WS.DtVideo seleccionarVideo(java.lang.String arg0) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.seleccionarVideo(arg0);
  }
  
  public boolean crearLista(WS.DtUsuario arg0, java.lang.String arg1, boolean arg2, java.lang.String arg3) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.crearLista(arg0, arg1, arg2, arg3);
  }
  
  public WS.DtLista findLista(int arg0) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.findLista(arg0);
  }
  
  public boolean login(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.login(arg0, arg1);
  }
  
  public java.lang.String[] listarUsuarios() throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.listarUsuarios();
  }
  
  public boolean ingresarVideo(java.lang.String arg0, int arg1, java.lang.String arg2, java.lang.String arg3, java.util.Calendar arg4) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.ingresarVideo(arg0, arg1, arg2, arg3, arg4);
  }
  
  public void seguirUsuario() throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    webServices.seguirUsuario();
  }
  
  public WS.DtLista seleccionarLista(java.lang.String arg0) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.seleccionarLista(arg0);
  }
  
  public void editarVideo(WS.DtVideo arg0) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    webServices.editarVideo(arg0);
  }
  
  public boolean agregarVideo(java.lang.String arg0, WS.DtLista arg1) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.agregarVideo(arg0, arg1);
  }
  
  public void quitarVideo(WS.DtVideo arg0) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    webServices.quitarVideo(arg0);
  }
  
  public WS.DtVideo findVideo(int arg0) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.findVideo(arg0);
  }
  
  public WS.DtVideo[] videosEnLista(WS.DtLista arg0) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.videosEnLista(arg0);
  }
  
  public java.lang.String findDuenioVideo(int arg0) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.findDuenioVideo(arg0);
  }
  
  public boolean altaCategoria(java.lang.String arg0) throws java.rmi.RemoteException{
    if (webServices == null)
      _initWebServicesProxy();
    return webServices.altaCategoria(arg0);
  }
  
  
}