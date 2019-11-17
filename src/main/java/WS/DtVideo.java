/**
 * DtVideo.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package WS;

public class DtVideo  implements java.io.Serializable {
    private int id;

    private java.lang.String nombre;

    private java.lang.Boolean privado;

    private java.lang.String canal;

    private java.lang.String descripcion;

    private java.lang.Integer duracion;

    private java.lang.String categoria;

    private java.util.Calendar fechaPub;

    private java.util.Calendar fechaUltimaConsulta;

    private java.lang.Integer cantidadConsultas;

    private java.lang.String url;

    private WS.DtComentario[] com;

    private java.lang.String[] valoracionesPositivas;

    private java.lang.String[] valoracionesNegativas;

    public DtVideo() {
    }

    public DtVideo(
           int id,
           java.lang.String nombre,
           java.lang.Boolean privado,
           java.lang.String canal,
           java.lang.String descripcion,
           java.lang.Integer duracion,
           java.lang.String categoria,
           java.util.Calendar fechaPub,
           java.util.Calendar fechaUltimaConsulta,
           java.lang.Integer cantidadConsultas,
           java.lang.String url,
           WS.DtComentario[] com,
           java.lang.String[] valoracionesPositivas,
           java.lang.String[] valoracionesNegativas) {
           this.id = id;
           this.nombre = nombre;
           this.privado = privado;
           this.canal = canal;
           this.descripcion = descripcion;
           this.duracion = duracion;
           this.categoria = categoria;
           this.fechaPub = fechaPub;
           this.fechaUltimaConsulta = fechaUltimaConsulta;
           this.cantidadConsultas = cantidadConsultas;
           this.url = url;
           this.com = com;
           this.valoracionesPositivas = valoracionesPositivas;
           this.valoracionesNegativas = valoracionesNegativas;
    }


    /**
     * Gets the id value for this DtVideo.
     * 
     * @return id
     */
    public int getId() {
        return id;
    }


    /**
     * Sets the id value for this DtVideo.
     * 
     * @param id
     */
    public void setId(int id) {
        this.id = id;
    }


    /**
     * Gets the nombre value for this DtVideo.
     * 
     * @return nombre
     */
    public java.lang.String getNombre() {
        return nombre;
    }


    /**
     * Sets the nombre value for this DtVideo.
     * 
     * @param nombre
     */
    public void setNombre(java.lang.String nombre) {
        this.nombre = nombre;
    }


    /**
     * Gets the privado value for this DtVideo.
     * 
     * @return privado
     */
    public java.lang.Boolean getPrivado() {
        return privado;
    }


    /**
     * Sets the privado value for this DtVideo.
     * 
     * @param privado
     */
    public void setPrivado(java.lang.Boolean privado) {
        this.privado = privado;
    }


    /**
     * Gets the canal value for this DtVideo.
     * 
     * @return canal
     */
    public java.lang.String getCanal() {
        return canal;
    }


    /**
     * Sets the canal value for this DtVideo.
     * 
     * @param canal
     */
    public void setCanal(java.lang.String canal) {
        this.canal = canal;
    }


    /**
     * Gets the descripcion value for this DtVideo.
     * 
     * @return descripcion
     */
    public java.lang.String getDescripcion() {
        return descripcion;
    }


    /**
     * Sets the descripcion value for this DtVideo.
     * 
     * @param descripcion
     */
    public void setDescripcion(java.lang.String descripcion) {
        this.descripcion = descripcion;
    }


    /**
     * Gets the duracion value for this DtVideo.
     * 
     * @return duracion
     */
    public java.lang.Integer getDuracion() {
        return duracion;
    }


    /**
     * Sets the duracion value for this DtVideo.
     * 
     * @param duracion
     */
    public void setDuracion(java.lang.Integer duracion) {
        this.duracion = duracion;
    }


    /**
     * Gets the categoria value for this DtVideo.
     * 
     * @return categoria
     */
    public java.lang.String getCategoria() {
        return categoria;
    }


    /**
     * Sets the categoria value for this DtVideo.
     * 
     * @param categoria
     */
    public void setCategoria(java.lang.String categoria) {
        this.categoria = categoria;
    }


    /**
     * Gets the fechaPub value for this DtVideo.
     * 
     * @return fechaPub
     */
    public java.util.Calendar getFechaPub() {
        return fechaPub;
    }


    /**
     * Sets the fechaPub value for this DtVideo.
     * 
     * @param fechaPub
     */
    public void setFechaPub(java.util.Calendar fechaPub) {
        this.fechaPub = fechaPub;
    }


    /**
     * Gets the fechaUltimaConsulta value for this DtVideo.
     * 
     * @return fechaUltimaConsulta
     */
    public java.util.Calendar getFechaUltimaConsulta() {
        return fechaUltimaConsulta;
    }


    /**
     * Sets the fechaUltimaConsulta value for this DtVideo.
     * 
     * @param fechaUltimaConsulta
     */
    public void setFechaUltimaConsulta(java.util.Calendar fechaUltimaConsulta) {
        this.fechaUltimaConsulta = fechaUltimaConsulta;
    }


    /**
     * Gets the cantidadConsultas value for this DtVideo.
     * 
     * @return cantidadConsultas
     */
    public java.lang.Integer getCantidadConsultas() {
        return cantidadConsultas;
    }


    /**
     * Sets the cantidadConsultas value for this DtVideo.
     * 
     * @param cantidadConsultas
     */
    public void setCantidadConsultas(java.lang.Integer cantidadConsultas) {
        this.cantidadConsultas = cantidadConsultas;
    }


    /**
     * Gets the url value for this DtVideo.
     * 
     * @return url
     */
    public java.lang.String getUrl() {
        return url;
    }


    /**
     * Sets the url value for this DtVideo.
     * 
     * @param url
     */
    public void setUrl(java.lang.String url) {
        this.url = url;
    }


    /**
     * Gets the com value for this DtVideo.
     * 
     * @return com
     */
    public WS.DtComentario[] getCom() {
        return com;
    }


    /**
     * Sets the com value for this DtVideo.
     * 
     * @param com
     */
    public void setCom(WS.DtComentario[] com) {
        this.com = com;
    }

    public WS.DtComentario getCom(int i) {
        return this.com[i];
    }

    public void setCom(int i, WS.DtComentario _value) {
        this.com[i] = _value;
    }


    /**
     * Gets the valoracionesPositivas value for this DtVideo.
     * 
     * @return valoracionesPositivas
     */
    public java.lang.String[] getValoracionesPositivas() {
        return valoracionesPositivas;
    }


    /**
     * Sets the valoracionesPositivas value for this DtVideo.
     * 
     * @param valoracionesPositivas
     */
    public void setValoracionesPositivas(java.lang.String[] valoracionesPositivas) {
        this.valoracionesPositivas = valoracionesPositivas;
    }

    public java.lang.String getValoracionesPositivas(int i) {
        return this.valoracionesPositivas[i];
    }

    public void setValoracionesPositivas(int i, java.lang.String _value) {
        this.valoracionesPositivas[i] = _value;
    }


    /**
     * Gets the valoracionesNegativas value for this DtVideo.
     * 
     * @return valoracionesNegativas
     */
    public java.lang.String[] getValoracionesNegativas() {
        return valoracionesNegativas;
    }


    /**
     * Sets the valoracionesNegativas value for this DtVideo.
     * 
     * @param valoracionesNegativas
     */
    public void setValoracionesNegativas(java.lang.String[] valoracionesNegativas) {
        this.valoracionesNegativas = valoracionesNegativas;
    }

    public java.lang.String getValoracionesNegativas(int i) {
        return this.valoracionesNegativas[i];
    }

    public void setValoracionesNegativas(int i, java.lang.String _value) {
        this.valoracionesNegativas[i] = _value;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof DtVideo)) return false;
        DtVideo other = (DtVideo) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            this.id == other.getId() &&
            ((this.nombre==null && other.getNombre()==null) || 
             (this.nombre!=null &&
              this.nombre.equals(other.getNombre()))) &&
            ((this.privado==null && other.getPrivado()==null) || 
             (this.privado!=null &&
              this.privado.equals(other.getPrivado()))) &&
            ((this.canal==null && other.getCanal()==null) || 
             (this.canal!=null &&
              this.canal.equals(other.getCanal()))) &&
            ((this.descripcion==null && other.getDescripcion()==null) || 
             (this.descripcion!=null &&
              this.descripcion.equals(other.getDescripcion()))) &&
            ((this.duracion==null && other.getDuracion()==null) || 
             (this.duracion!=null &&
              this.duracion.equals(other.getDuracion()))) &&
            ((this.categoria==null && other.getCategoria()==null) || 
             (this.categoria!=null &&
              this.categoria.equals(other.getCategoria()))) &&
            ((this.fechaPub==null && other.getFechaPub()==null) || 
             (this.fechaPub!=null &&
              this.fechaPub.equals(other.getFechaPub()))) &&
            ((this.fechaUltimaConsulta==null && other.getFechaUltimaConsulta()==null) || 
             (this.fechaUltimaConsulta!=null &&
              this.fechaUltimaConsulta.equals(other.getFechaUltimaConsulta()))) &&
            ((this.cantidadConsultas==null && other.getCantidadConsultas()==null) || 
             (this.cantidadConsultas!=null &&
              this.cantidadConsultas.equals(other.getCantidadConsultas()))) &&
            ((this.url==null && other.getUrl()==null) || 
             (this.url!=null &&
              this.url.equals(other.getUrl()))) &&
            ((this.com==null && other.getCom()==null) || 
             (this.com!=null &&
              java.util.Arrays.equals(this.com, other.getCom()))) &&
            ((this.valoracionesPositivas==null && other.getValoracionesPositivas()==null) || 
             (this.valoracionesPositivas!=null &&
              java.util.Arrays.equals(this.valoracionesPositivas, other.getValoracionesPositivas()))) &&
            ((this.valoracionesNegativas==null && other.getValoracionesNegativas()==null) || 
             (this.valoracionesNegativas!=null &&
              java.util.Arrays.equals(this.valoracionesNegativas, other.getValoracionesNegativas())));
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
        _hashCode += getId();
        if (getNombre() != null) {
            _hashCode += getNombre().hashCode();
        }
        if (getPrivado() != null) {
            _hashCode += getPrivado().hashCode();
        }
        if (getCanal() != null) {
            _hashCode += getCanal().hashCode();
        }
        if (getDescripcion() != null) {
            _hashCode += getDescripcion().hashCode();
        }
        if (getDuracion() != null) {
            _hashCode += getDuracion().hashCode();
        }
        if (getCategoria() != null) {
            _hashCode += getCategoria().hashCode();
        }
        if (getFechaPub() != null) {
            _hashCode += getFechaPub().hashCode();
        }
        if (getFechaUltimaConsulta() != null) {
            _hashCode += getFechaUltimaConsulta().hashCode();
        }
        if (getCantidadConsultas() != null) {
            _hashCode += getCantidadConsultas().hashCode();
        }
        if (getUrl() != null) {
            _hashCode += getUrl().hashCode();
        }
        if (getCom() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getCom());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getCom(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getValoracionesPositivas() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getValoracionesPositivas());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getValoracionesPositivas(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getValoracionesNegativas() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getValoracionesNegativas());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getValoracionesNegativas(), i);
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
        new org.apache.axis.description.TypeDesc(DtVideo.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://WS/", "dtVideo"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("id");
        elemField.setXmlName(new javax.xml.namespace.QName("", "id"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("nombre");
        elemField.setXmlName(new javax.xml.namespace.QName("", "nombre"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("privado");
        elemField.setXmlName(new javax.xml.namespace.QName("", "privado"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "boolean"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("canal");
        elemField.setXmlName(new javax.xml.namespace.QName("", "canal"));
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
        elemField.setFieldName("duracion");
        elemField.setXmlName(new javax.xml.namespace.QName("", "duracion"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("categoria");
        elemField.setXmlName(new javax.xml.namespace.QName("", "categoria"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("fechaPub");
        elemField.setXmlName(new javax.xml.namespace.QName("", "fechaPub"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "dateTime"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("fechaUltimaConsulta");
        elemField.setXmlName(new javax.xml.namespace.QName("", "fechaUltimaConsulta"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "dateTime"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("cantidadConsultas");
        elemField.setXmlName(new javax.xml.namespace.QName("", "cantidadConsultas"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("url");
        elemField.setXmlName(new javax.xml.namespace.QName("", "url"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("com");
        elemField.setXmlName(new javax.xml.namespace.QName("", "com"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://WS/", "dtComentario"));
        elemField.setMinOccurs(0);
        elemField.setNillable(true);
        elemField.setMaxOccursUnbounded(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("valoracionesPositivas");
        elemField.setXmlName(new javax.xml.namespace.QName("", "valoracionesPositivas"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(true);
        elemField.setMaxOccursUnbounded(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("valoracionesNegativas");
        elemField.setXmlName(new javax.xml.namespace.QName("", "valoracionesNegativas"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(true);
        elemField.setMaxOccursUnbounded(true);
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
