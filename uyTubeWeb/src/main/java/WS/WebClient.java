package WS;

import java.rmi.RemoteException;
import java.util.ArrayList;
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
			} catch (ServiceException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public static List<DtLista> buscarListasPublicas(String s) {
		start();
		if(ws != null) {
			try {
				DtLista[] lp = ws.buscarListasPublicas(s);
				List<DtLista> lst = new ArrayList<DtLista>();
				for(DtLista l: lp) {
					lst.add(l);
				}
				return lst;
			}catch (RemoteException e) {
				e.printStackTrace();
				return null;
			}
		}else {
			return null;
		}
	}
	
	public static Map<String, String> videosXCatPublicos(String s){
		start();
		if(ws != null) {
			try {
				Object[] o = ws.videosXCatPublicos(s);
				Map<String, String> retorno = new HashMap<String, String>();
				for(int i = 0 ; i < o.length; i++) {
					retorno.put((String)o[i], (String)o[++i]);
				}
				return retorno;
			}catch (RemoteException e) {
				e.printStackTrace();
				return null;
			}
		}else {
			return null;
		}		
	}
	public static Map<String, String> listasXCatPublicas(String s){
		start();
		if(ws != null) {
			try {
				Object[] o = ws.listasXCatPublicas(s);
				Map<String, String> retorno = new HashMap<String, String>();
				for(int i = 0 ; i < o.length; i++) {
					retorno.put((String)o[i], (String)o[++i]);
				}
				return retorno;
			}catch (RemoteException e) {
				e.printStackTrace();
				return null;
			}
		}else {
			return null;
		}		
	}
	public static HashMap<Integer, String> listarVideosPrivados(String s){
		start();
		if(ws != null) {
			try {
				Object[] o = ws.listarVideosPrivados(s);
				HashMap<Integer, String> retorno = new HashMap<Integer, String>();
				for(int i = 0 ; i < o.length; i++) {
					retorno.put((Integer)o[i], (String)o[++i]);
				}
				return retorno;
			}catch (RemoteException e) {
				e.printStackTrace();
				return null;
			}
		}else {
			return null;
		}		
	}
	public static Map<DtUsuario, DtCanal> listarDatosUsuario(String s){
		start();
		if(ws != null) {
			try {
				Object[] o = ws.listarVideosPrivados(s);
				Map<DtUsuario, DtCanal> retorno = new HashMap<DtUsuario, DtCanal>();
				for(int i = 0 ; i < o.length; i++) {
					retorno.put((DtUsuario)o[i], (DtCanal)o[++i]);
				}
				return retorno;
			}catch (RemoteException e) {
				e.printStackTrace();
				return null;
			}
		}else {
			return null;
		}		
	}
	public static Map<String, String> listarCanalesPublicos(){
		start();
		if(ws != null) {
			try {
				Object[] o = ws.listarCanalesPublicos();
				Map<String, String> retorno = new HashMap<String, String>();
				for(int i = 0 ; i < o.length; i++) {
					retorno.put((String)o[i], (String)o[++i]);
				}
				return retorno;
			}catch (RemoteException e) {
				e.printStackTrace();
				return null;
			}
		}else {
			return null;
		}		
	}
	public static HashMap<Integer, String> listarVideosPublicos(){
		start();
		if(ws != null) {
			try {
				Object[] o = ws.listarVideosPublicos();
				HashMap<Integer, String> retorno = new HashMap<Integer, String>();
				for(int i = 0 ; i < o.length; i++) {
					retorno.put((Integer)o[i], (String)o[++i]);
				}
				return retorno;
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
				HashMap<Integer, String> retorno = new HashMap<Integer, String>();
				for(int i = 0 ; i < o.length; i++) {
					retorno.put((Integer)o[i], (String)o[++i]);
				}
				return retorno;
			}catch (RemoteException e) {
				e.printStackTrace();
				return null;
			}
		}else {
			return null;
		}		
	}
	
	public static ArrayList<String> listarCategorias(){
		start();
		if(ws != null) {
			try {
				Object[] o = ws.listarCategorias();
				ArrayList<String> retorno = new ArrayList<String>();
				for(int i = 0 ; i < o.length; i++) {
					retorno.add((String)o[i]);
				}
				return retorno;
			}catch (RemoteException e) {
				e.printStackTrace();
				return null;
			}
		}else {
			return null;
		}			
	}
	
}
