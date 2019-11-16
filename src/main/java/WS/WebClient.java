package WS;

import java.rmi.RemoteException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.rpc.ServiceException;

public class WebClient {
	private static WebServices ws = null;	
	private static void start() {
		if(ws == null) {
			WebServicesService wsLocator = new WebServicesServiceLocator();
			try {
				ws = wsLocator.getWebServicesPort();				
			}catch (ServiceException e) {e.printStackTrace();}
		}
	}
	
	public static Map<String, String> stringString(Object[] o){
		Map<String, String> retorno = new HashMap<String, String>();
		if(o != null) {
			for(int i = 0 ; i < (o.length)-1; i++) {
				retorno.put((String)o[i], (String)o[++i]);
			}
		}
		return retorno;	
	}
	public static HashMap<Integer, String> integerString(Object[] o){
		HashMap<Integer, String> retorno = new HashMap<Integer, String>();
		if(o != null) {
			for(int i = 0 ; i < (o.length)-1; i++) {
				retorno.put((Integer)o[i], (String)o[++i]);
			}
		}
		return retorno;	
	}
	
	public static List<DtLista> buscarListasPublicas(String s) {
		List<DtLista> lst = new ArrayList<DtLista>();
		start();
		if(ws != null) {
			try {
				DtLista[] lp = ws.buscarListasPublicas(s);
				if(lp != null) {
					for(DtLista l: lp) {
						lst.add(l);
					}
				}
			}catch (RemoteException e) { e.printStackTrace();}
		}
		return lst;
	}	
	public static Map<String, String> videosXCatPublicos(String s){
		Map<String, String> retorno = new HashMap<String, String>();
		start();
		if(ws != null) {
			try {
				Object[] o = ws.videosXCatPublicos(s);
				retorno = stringString(o);
			}catch (RemoteException e) { e.printStackTrace();}
		}
		return retorno;		
	}
	public static Map<String, String> listasXCatPublicas(String s){
		Map<String, String> retorno = new HashMap<String, String>();
		start();
		if(ws != null) {
			try {
				Object[] o = ws.listasXCatPublicas(s);
				retorno = stringString(o);
			}catch (RemoteException e) { e.printStackTrace();}
		}
		return retorno;	
	}
	public static HashMap<Integer, String> listarVideosPrivados(String s){
		HashMap<Integer, String> retorno = new HashMap<Integer, String>();
		start();
		if(ws != null) {
			try {
				Object[] o = ws.listarVideosPrivados(s);
				retorno = integerString(o);
			}catch (RemoteException e) { e.printStackTrace();}
		}
		return retorno;
	}
	public static Map<DtUsuario, DtCanal> listarDatosUsuario(String s){
		Map<DtUsuario, DtCanal> retorno = new HashMap<DtUsuario, DtCanal>();
		start();
		if(ws != null) {
			try {
				Object[] o = ws.listarDatosUsuario(s);
				if(o != null) {
					for(int i = 0 ; i < (o.length)-1; i++) {
						retorno.put((DtUsuario)o[i], (DtCanal)o[++i]);
					}
				}
			}catch (RemoteException e) { e.printStackTrace();}
		}
		return retorno;
	}
	public static Map<String, String> listarCanalesPublicos(){
		Map<String, String> retorno = new HashMap<String, String>();
		start();
		if(ws != null) {
			try {
				Object[] o = ws.listarCanalesPublicos();
				retorno = stringString(o);
			}catch (RemoteException e) { e.printStackTrace();}
		}
		return retorno;	
	}
	public static HashMap<Integer, String> listarVideosPublicos(){
		HashMap<Integer, String> retorno = new HashMap<Integer, String>();
		start();
		if(ws != null) {
			try {
				Object[] o = ws.listarVideosPublicos();
				retorno = integerString(o);
			}catch (RemoteException e) { e.printStackTrace();}
		}
		return retorno;
	}
	public static HashMap<Integer, String> listarListasPublicas(){
		HashMap<Integer, String> retorno = new HashMap<Integer, String>();
		start();
		if(ws != null) {
			try {
				Object[] o = ws.listarListasPublicas();
				retorno = integerString(o);
			}catch (RemoteException e) { e.printStackTrace();}
		}
		return retorno;
	}
	public static ArrayList<String> listarCategorias(){
		ArrayList<String> retorno = new ArrayList<String>();
		start();
		if(ws != null) {
			try {
				String[] o = ws.listarCategorias();
				if(o != null) {
					for(String s: o) {
						retorno.add(s);
					}
				}
			}catch (RemoteException e) { e.printStackTrace();}
		}
		return retorno;	
	}
	
	public static DtUsuario getSeguido(DtUsuario usr,String nick) {
		if((usr != null)&&(nick != null)) {
			DtUsuarioSeguidosEntry[] aux = usr.getSeguidos();
			for(DtUsuarioSeguidosEntry s: aux) {
				if(s.getKey().equals(nick)) {
					return s.getValue();
				}
			}
			return null;
		}else {return null;}
	}
	
	public static Map<String, DtUsuario> getSeguidores(DtUsuario usr){
		Map<String, DtUsuario> retorno = new HashMap<String, DtUsuario>();
		if(usr != null) {
			DtUsuarioSeguidoresEntry[] seguidores = usr.getSeguidores();
			if(seguidores != null && seguidores.length > 0) {
				for(DtUsuarioSeguidoresEntry o: seguidores) {
					retorno.put(o.getKey(), o.getValue());
				}
			}
		}
		return retorno;
	}
	public static Map<String, DtUsuario> getSeguidos(DtUsuario usr){
		Map<String, DtUsuario> retorno = new HashMap<String, DtUsuario>();
		if(usr != null) {
			DtUsuarioSeguidosEntry[] seguidores = usr.getSeguidos();
			if(seguidores != null && seguidores.length > 0) {
				for(DtUsuarioSeguidosEntry o: seguidores) {
					retorno.put(o.getKey(), o.getValue());
				}
			}
		}
		return retorno;
	}
	
	public static Map<Integer, DtVideo> getListaVideos(DtCanal can){
		Map<Integer, DtVideo> retorno = new HashMap<Integer, DtVideo>();
		if(can != null) {
			DtCanalListaVideosEntry[] o = can.getListaVideos();
			if(o != null) {
				for(int i = 0 ; i < (o.length); i++) {					
					retorno.put(o[i].getKey(), o[i].getValue()); 
				}
			}
		}
		return retorno;
	}
	public static Map<Integer, DtLista> getListasReproduccion(DtCanal can){
		Map<Integer, DtLista> retorno = new HashMap<Integer, DtLista>();
		if(can != null) {
			DtCanalListasReproduccionEntry[] o = can.getListasReproduccion();
			if(o != null) {
				for(int i = 0 ; i < (o.length); i++) {
					retorno.put(o[i].getKey(), o[++i].getValue()); 
				}
			}
		}
		return retorno;
	}
	
	public static String getDate(Calendar c) {
		return new SimpleDateFormat("dd/mm/yyyy").format(c.getTime());
	}
	
	public static DtUsuario newUsuario(String nick, String img) {
		return new DtUsuario(nick, null, null, null, null, null, img, new DtUsuarioSeguidoresEntry[0], new DtUsuarioSeguidosEntry[0]);
	}
}
