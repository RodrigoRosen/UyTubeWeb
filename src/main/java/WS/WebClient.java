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
		if(o != null) {
			Map<String, String> retorno = new HashMap<String, String>();
			for(int i = 0 ; i < (o.length)-1; i++) {
				retorno.put((String)o[i], (String)o[++i]);
			}
			return retorno;
		}else {return null;}		
	}
	public static HashMap<Integer, String> integerString(Object[] o){
		if(o != null) {
			HashMap<Integer, String> retorno = new HashMap<Integer, String>();
			for(int i = 0 ; i < (o.length)-1; i++) {
				retorno.put((Integer)o[i], (String)o[++i]);
			}
			return retorno;
		}else {return null;}		
	}
	
	public static List<DtLista> buscarListasPublicas(String s) {
		start();
		if(ws != null) {
			try {
				DtLista[] lp = ws.buscarListasPublicas(s);
				if(lp != null) {
					List<DtLista> lst = new ArrayList<DtLista>();
					for(DtLista l: lp) {
						lst.add(l);
					}
					return lst;
				}else {return null;}
			}catch (RemoteException e) {
				e.printStackTrace();
				return null;
			}
		}else {return null;}
	}	
	public static Map<String, String> videosXCatPublicos(String s){
		start();
		if(ws != null) {
			try {
				Object[] o = ws.videosXCatPublicos(s);
				return stringString(o);
			}catch (RemoteException e) {
				e.printStackTrace();
				return null;
			}
		}else {return null;}	
	}
	public static Map<String, String> listasXCatPublicas(String s){
		start();
		if(ws != null) {
			try {
				Object[] o = ws.listasXCatPublicas(s);
				return stringString(o);
			}catch (RemoteException e) {
				e.printStackTrace();
				return null;
			}
		}else {return null;}	
	}
	public static HashMap<Integer, String> listarVideosPrivados(String s){
		start();
		if(ws != null) {
			try {
				Object[] o = ws.listarVideosPrivados(s);
				return integerString(o);
			}catch (RemoteException e) {
				e.printStackTrace();
				return null;
			}
		}else {return null;}	
	}
	public static Map<DtUsuario, DtCanal> listarDatosUsuario(String s){
		start();
		if(ws != null) {
			try {
				Object[] o = ws.listarDatosUsuario(s);
				if(o != null) {
					Map<DtUsuario, DtCanal> retorno = new HashMap<DtUsuario, DtCanal>();
					for(int i = 0 ; i < (o.length)-1; i++) {
						retorno.put((DtUsuario)o[i], (DtCanal)o[++i]);
					}
					return retorno;
				}else {return null;}
			}catch (RemoteException e) {
				e.printStackTrace();
				return null;
			}
		}else {return null;}	
	}
	public static Map<String, String> listarCanalesPublicos(){
		start();
		if(ws != null) {
			try {
				Object[] o = ws.listarCanalesPublicos();
				return stringString(o);
			}catch (RemoteException e) {
				e.printStackTrace();
				return null;
			}
		}else {return null;}		
	}
	public static HashMap<Integer, String> listarVideosPublicos(){
		start();
		if(ws != null) {
			try {
				Object[] o = ws.listarVideosPublicos();
				return integerString(o);
			}catch (RemoteException e) {
				e.printStackTrace();
				return null;
			}
		}else {
			return null;
		}		
	}
	public static HashMap<Integer, String> listarListasPublicas(){
		start();
		if(ws != null) {
			try {
				Object[] o = ws.listarListasPublicas();
				return integerString(o);
			}catch (RemoteException e) {
				e.printStackTrace();
				return null;
			}
		}else {return null;}		
	}
	public static ArrayList<String> listarCategorias(){
		start();
		if(ws != null) {
			try {
				String[] o = ws.listarCategorias();
				if(o != null) {
					ArrayList<String> retorno = new ArrayList<String>();
					for(String s: o) {
						retorno.add(s);
					}
					return retorno;
				}else {return null;}
			}catch (RemoteException e) {
				e.printStackTrace();
				return null;
			}
		}else {return null;}		
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
	
	public static Map<String, DtUsuario> stringUsuario(Object[] o){
		if(o != null) {
			Map<String, DtUsuario> retorno = new HashMap<String, DtUsuario>();
			for(int i = 0 ; i < (o.length)-1; i++) {
				retorno.put((String)o[i], (DtUsuario)o[++i]);
			}
			return retorno;
		}else {return null;}
	}	
	public static Map<String, DtUsuario> getSeguidores(DtUsuario usr){
		if(usr != null) {
			return stringUsuario(usr.getSeguidores());
		}else {return null;}
	}
	public static Map<String, DtUsuario> getSeguidos(DtUsuario usr){
		if(usr != null) {
			return stringUsuario(usr.getSeguidos());
		}else {return null;}
	}
	
	public static Map<Integer, DtVideo> getListaVideos(DtCanal can){
		if(can != null) {
			DtCanalListaVideosEntry[] o = can.getListaVideos();
			if(o != null) {
				Map<Integer, DtVideo> retorno = new HashMap<Integer, DtVideo>();
				for(int i = 0 ; i < (o.length)-1; i++) {
					System.out.println("#######################################################################################"+i+" - "+o.length);
					retorno.put(o[i].getKey(), o[++i].getValue()); 
				}
				return retorno;
			}else {return null;}
		}else {return null;}
	}
	public static Map<Integer, DtLista> getListasReproduccion(DtCanal can){
		if(can != null) {
			DtCanalListasReproduccionEntry[] o = can.getListasReproduccion();
			if(o != null) {
				Map<Integer, DtLista> retorno = new HashMap<Integer, DtLista>();
				System.out.println("#######################################################################################"+" - "+o.length);
				for(int i = 0 ; i < (o.length)-1; i++) {
					System.out.println("#######################################################################################"+i+" - "+o.length);
					retorno.put(o[i].getKey(), o[++i].getValue()); 
				}
				return retorno;
			}else {return null;}
		}else {return null;}
	}
	
	public static String getDate(Calendar c) {
		return new SimpleDateFormat("dd/mm/yyyy").format(c.getTime());
	}
	
}
