/**
 * WebServices.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package WS;

public interface WebServices extends java.rmi.Remote {
    public WS.DtVideo seleccionarVideo(java.lang.String arg0) throws java.rmi.RemoteException;
    public void finCasoUso() throws java.rmi.RemoteException;
    public void dejarSeguir() throws java.rmi.RemoteException;
    public java.lang.String[] listarUsuarios() throws java.rmi.RemoteException;
    public WS.DtLista seleccionarLista(java.lang.String arg0) throws java.rmi.RemoteException;
    public boolean agregarVideo(java.lang.String arg0, WS.DtLista arg1) throws java.rmi.RemoteException;
    public boolean altaCategoria(java.lang.String arg0) throws java.rmi.RemoteException;
    public WS.DtLista findLista(int arg0) throws java.rmi.RemoteException;
    public java.lang.String findDuenioLista(int arg0) throws java.rmi.RemoteException;
    public java.lang.String findDuenioVideo(int arg0) throws java.rmi.RemoteException;
    public boolean ingresarUsuario(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, java.lang.String arg3, java.lang.String arg4, java.util.Calendar arg5, java.lang.String arg6, WS.DtCanal arg7) throws java.rmi.RemoteException;
    public void editarVideo(WS.DtVideo arg0) throws java.rmi.RemoteException;
    public java.lang.String[] listarVideos() throws java.rmi.RemoteException;
    public boolean crearLista(WS.DtUsuario arg0, java.lang.String arg1, boolean arg2, java.lang.String arg3) throws java.rmi.RemoteException;
    public void quitarVideo(WS.DtVideo arg0) throws java.rmi.RemoteException;
    public WS.DtVideo[] videosEnLista(WS.DtLista arg0) throws java.rmi.RemoteException;
    public boolean ingresarVideo(java.lang.String arg0, int arg1, java.lang.String arg2, java.lang.String arg3, java.util.Calendar arg4) throws java.rmi.RemoteException;
    public boolean login(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException;
    public void seguirUsuario() throws java.rmi.RemoteException;
    public java.lang.String[] listarCategorias() throws java.rmi.RemoteException;
    public WS.DtVideo findVideo(int arg0) throws java.rmi.RemoteException;
    public void seleccionarCategoria(java.lang.String arg0) throws java.rmi.RemoteException;
    public java.lang.Object[] listarDatosUsuario(java.lang.String arg0) throws java.rmi.RemoteException;
    public java.lang.String[] listarCanalesPublicos() throws java.rmi.RemoteException;
    public WS.DtCanal[] buscarCanalesPublicos(java.lang.String arg0) throws java.rmi.RemoteException;
    public WS.DtVideo[] videosEnListaPublica(WS.DtLista arg0) throws java.rmi.RemoteException;
    public boolean valorarVideoPublico(int arg0, java.lang.String arg1, boolean arg2) throws java.rmi.RemoteException;
    public java.lang.Object[] listarVideosPrivados(java.lang.String arg0) throws java.rmi.RemoteException;
    public java.lang.Object[] listarListasPublicas() throws java.rmi.RemoteException;
    public java.lang.String[] listasXCatPublicas(java.lang.String arg0) throws java.rmi.RemoteException;
    public WS.DtLista[] buscarListasPublicas(java.lang.String arg0) throws java.rmi.RemoteException;
    public java.lang.String[] videosXCatPublicos(java.lang.String arg0) throws java.rmi.RemoteException;
    public WS.DtVideo[] buscarVideosPublicos(java.lang.String arg0) throws java.rmi.RemoteException;
    public void modificarUsuarioCanal(WS.DtUsuario arg0, WS.DtCanal arg1) throws java.rmi.RemoteException;
    public void ingresarTipoLista(boolean arg0) throws java.rmi.RemoteException;
    public WS.DtLista[] listarListasParticulares(WS.DtUsuario arg0) throws java.rmi.RemoteException;
    public boolean ingresarComentario(WS.DtComentario arg0) throws java.rmi.RemoteException;
    public WS.DtUsuario seleccionarUsuario(java.lang.String arg0) throws java.rmi.RemoteException;
    public void modificarListaParticular(WS.DtLista arg0, WS.DtLista arg1) throws java.rmi.RemoteException;
    public java.lang.Object[] listarVideosPublicos() throws java.rmi.RemoteException;
    public void seleccionarComentario(WS.DtComentario arg0) throws java.rmi.RemoteException;
}
