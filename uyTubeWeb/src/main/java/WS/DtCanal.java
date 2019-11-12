/**
 * DtCanal.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package WS;

import java.util.HashMap;
import java.util.Map;

public class DtCanal  implements java.io.Serializable {
    private java.lang.String nombre;

    private java.lang.String descripcion;

    private java.lang.String nick;

    private boolean privado;

    private WS.DtCanalListasReproduccionEntry[] listasReproduccion;

    private WS.DtCanalListaVideosEntry[] listaVideos;

    public DtCanal() {
    }

    public DtCanal(
           java.lang.String nombre,
           java.lang.String descripcion,
           java.lang.String nick,
           boolean privado,
           WS.DtCanalListasReproduccionEntry[] listasReproduccion,
           WS.DtCanalListaVideosEntry[] listaVideos) {
           this.nombre = nombre;
           this.descripcion = descripcion;
           this.nick = nick;
           this.privado = privado;
           this.listasReproduccion = listasReproduccion;
           this.listaVideos = listaVideos;
    }
    public DtCanal(String nombre,String desc,String nick,boolean p) {
            this.nombre = nombre;
            this.descripcion = desc;
            this.nick = nick;
            this.privado = p;
            this.listasReproduccion = null;
            this.listaVideos = null;
     }


    /**
     * Gets the nombre value for this DtCanal.
     * 
     * @return nombre
     */
    public java.lang.String getNombre() {
        return nombre;
    }


    /**
     * Sets the nombre value for this DtCanal.
     * 
     * @param nombre
     */
    public void setNombre(java.lang.String nombre) {
        this.nombre = nombre;
    }


    /**
     * Gets the descripcion value for this DtCanal.
     * 
     * @return descripcion
     */
    public java.lang.String getDescripcion() {
        return descripcion;
    }


    /**
     * Sets the descripcion value for this DtCanal.
     * 
     * @param descripcion
     */
    public void setDescripcion(java.lang.String descripcion) {
        this.descripcion = descripcion;
    }


    /**
     * Gets the nick value for this DtCanal.
     * 
     * @return nick
     */
    public java.lang.String getNick() {
        return nick;
    }


    /**
     * Sets the nick value for this DtCanal.
     * 
     * @param nick
     */
    public void setNick(java.lang.String nick) {
        this.nick = nick;
    }


    /**
     * Gets the privado value for this DtCanal.
     * 
     * @return privado
     */
    public boolean isPrivado() {
        return privado;
    }


    /**
     * Sets the privado value for this DtCanal.
     * 
     * @param privado
     */
    public void setPrivado(boolean privado) {
        this.privado = privado;
    }


    /**
     * Gets the listasReproduccion value for this DtCanal.
     * 
     * @return listasReproduccion
     */
    public Map<Integer, DtLista> getListasReproduccion() {
    	Map<Integer, DtLista> retorno = new HashMap<Integer, DtLista>();
    	for(DtCanalListasReproduccionEntry e: this.listasReproduccion) {
    		retorno.put(e.getKey(),e.getValue());
    	}
        return retorno;
    }


    /**
     * Sets the listasReproduccion value for this DtCanal.
     * 
     * @param listasReproduccion
     */
    public void setListasReproduccion(WS.DtCanalListasReproduccionEntry[] listasReproduccion) {
        this.listasReproduccion = listasReproduccion;
    }


    /**
     * Gets the listaVideos value for this DtCanal.
     * 
     * @return listaVideos
     */
    public Map<Integer, DtVideo> getListaVideos() {
    	Map<Integer, DtVideo> retorno = new HashMap<Integer, DtVideo>();
    	for(DtCanalListaVideosEntry e: this.listaVideos) {
    		retorno.put(e.getKey(),e.getValue());
    	}
        return retorno;
    }


    /**
     * Sets the listaVideos value for this DtCanal.
     * 
     * @param listaVideos
     */
    public void setListaVideos(WS.DtCanalListaVideosEntry[] listaVideos) {
        this.listaVideos = listaVideos;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof DtCanal)) return false;
        DtCanal other = (DtCanal) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.nombre==null && other.getNombre()==null) || 
             (this.nombre!=null &&
              this.nombre.equals(other.getNombre()))) &&
            ((this.descripcion==null && other.getDescripcion()==null) || 
             (this.descripcion!=null &&
              this.descripcion.equals(other.getDescripcion()))) &&
            ((this.nick==null && other.getNick()==null) || 
             (this.nick!=null &&
              this.nick.equals(other.getNick()))) &&
            this.privado == other.isPrivado();
        __equalsCalc = null;
        return _equals;
    }

    private boolean __hashCodeCalc = false;
    public synchronized int hashCode() {
        if (__hashCodeCalc) {
            return 0;
        }
        __hashCodeCalc = true;
        int _hashCode = 1;
        if (getNombre() != null) {
            _hashCode += getNombre().hashCode();
        }
        if (getDescripcion() != null) {
            _hashCode += getDescripcion().hashCode();
        }
        if (getNick() != null) {
            _hashCode += getNick().hashCode();
        }
        _hashCode += (isPrivado() ? Boolean.TRUE : Boolean.FALSE).hashCode();
        if (getListasReproduccion() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getListasReproduccion());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getListasReproduccion(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getListaVideos() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getListaVideos());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getListaVideos(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(DtCanal.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://WS/", "dtCanal"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("nombre");
        elemField.setXmlName(new javax.xml.namespace.QName("", "nombre"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("descripcion");
        elemField.setXmlName(new javax.xml.namespace.QName("", "descripcion"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("nick");
        elemField.setXmlName(new javax.xml.namespace.QName("", "nick"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("privado");
        elemField.setXmlName(new javax.xml.namespace.QName("", "privado"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "boolean"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("listasReproduccion");
        elemField.setXmlName(new javax.xml.namespace.QName("", "listasReproduccion"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://WS/", ">>dtCanal>listasReproduccion>entry"));
        elemField.setNillable(false);
        elemField.setItemQName(new javax.xml.namespace.QName("", "entry"));
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("listaVideos");
        elemField.setXmlName(new javax.xml.namespace.QName("", "listaVideos"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://WS/", ">>dtCanal>listaVideos>entry"));
        elemField.setNillable(false);
        elemField.setItemQName(new javax.xml.namespace.QName("", "entry"));
        typeDesc.addFieldDesc(elemField);
    }

    /**
     * Return type metadata object
     */
    public static org.apache.axis.description.TypeDesc getTypeDesc() {
        return typeDesc;
    }

    /**
     * Get Custom Serializer
     */
    public static org.apache.axis.encoding.Serializer getSerializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanSerializer(
            _javaType, _xmlType, typeDesc);
    }

    /**
     * Get Custom Deserializer
     */
    public static org.apache.axis.encoding.Deserializer getDeserializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanDeserializer(
            _javaType, _xmlType, typeDesc);
    }

}
