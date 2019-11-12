/**
 * DtUsuario.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package WS;

public class DtUsuario  implements java.io.Serializable {
    private java.lang.String nickname;

    private java.lang.String email;

    private java.lang.String password;

    private java.lang.String nombre;

    private java.lang.String apellido;

    private java.util.Calendar fechaNac;

    private java.lang.String img;

    private WS.DtUsuarioSeguidoresEntry[] seguidores;

    private WS.DtUsuarioSeguidosEntry[] seguidos;

    public DtUsuario() {
    }

    public DtUsuario(
           java.lang.String nickname,
           java.lang.String email,
           java.lang.String password,
           java.lang.String nombre,
           java.lang.String apellido,
           java.util.Calendar fechaNac,
           java.lang.String img,
           WS.DtUsuarioSeguidoresEntry[] seguidores,
           WS.DtUsuarioSeguidosEntry[] seguidos) {
           this.nickname = nickname;
           this.email = email;
           this.password = password;
           this.nombre = nombre;
           this.apellido = apellido;
           this.fechaNac = fechaNac;
           this.img = img;
           this.seguidores = seguidores;
           this.seguidos = seguidos;
    }


    /**
     * Gets the nickname value for this DtUsuario.
     * 
     * @return nickname
     */
    public java.lang.String getNickname() {
        return nickname;
    }


    /**
     * Sets the nickname value for this DtUsuario.
     * 
     * @param nickname
     */
    public void setNickname(java.lang.String nickname) {
        this.nickname = nickname;
    }


    /**
     * Gets the email value for this DtUsuario.
     * 
     * @return email
     */
    public java.lang.String getEmail() {
        return email;
    }


    /**
     * Sets the email value for this DtUsuario.
     * 
     * @param email
     */
    public void setEmail(java.lang.String email) {
        this.email = email;
    }


    /**
     * Gets the password value for this DtUsuario.
     * 
     * @return password
     */
    public java.lang.String getPassword() {
        return password;
    }


    /**
     * Sets the password value for this DtUsuario.
     * 
     * @param password
     */
    public void setPassword(java.lang.String password) {
        this.password = password;
    }


    /**
     * Gets the nombre value for this DtUsuario.
     * 
     * @return nombre
     */
    public java.lang.String getNombre() {
        return nombre;
    }


    /**
     * Sets the nombre value for this DtUsuario.
     * 
     * @param nombre
     */
    public void setNombre(java.lang.String nombre) {
        this.nombre = nombre;
    }


    /**
     * Gets the apellido value for this DtUsuario.
     * 
     * @return apellido
     */
    public java.lang.String getApellido() {
        return apellido;
    }


    /**
     * Sets the apellido value for this DtUsuario.
     * 
     * @param apellido
     */
    public void setApellido(java.lang.String apellido) {
        this.apellido = apellido;
    }


    /**
     * Gets the fechaNac value for this DtUsuario.
     * 
     * @return fechaNac
     */
    public java.util.Calendar getFechaNac() {
        return fechaNac;
    }


    /**
     * Sets the fechaNac value for this DtUsuario.
     * 
     * @param fechaNac
     */
    public void setFechaNac(java.util.Calendar fechaNac) {
        this.fechaNac = fechaNac;
    }


    /**
     * Gets the img value for this DtUsuario.
     * 
     * @return img
     */
    public java.lang.String getImg() {
        return img;
    }


    /**
     * Sets the img value for this DtUsuario.
     * 
     * @param img
     */
    public void setImg(java.lang.String img) {
        this.img = img;
    }


    /**
     * Gets the seguidores value for this DtUsuario.
     * 
     * @return seguidores
     */
    public WS.DtUsuarioSeguidoresEntry[] getSeguidores() {
        return seguidores;
    }


    /**
     * Sets the seguidores value for this DtUsuario.
     * 
     * @param seguidores
     */
    public void setSeguidores(WS.DtUsuarioSeguidoresEntry[] seguidores) {
        this.seguidores = seguidores;
    }


    /**
     * Gets the seguidos value for this DtUsuario.
     * 
     * @return seguidos
     */
    public WS.DtUsuarioSeguidosEntry[] getSeguidos() {
        return seguidos;
    }


    /**
     * Sets the seguidos value for this DtUsuario.
     * 
     * @param seguidos
     */
    public void setSeguidos(WS.DtUsuarioSeguidosEntry[] seguidos) {
        this.seguidos = seguidos;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof DtUsuario)) return false;
        DtUsuario other = (DtUsuario) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.nickname==null && other.getNickname()==null) || 
             (this.nickname!=null &&
              this.nickname.equals(other.getNickname()))) &&
            ((this.email==null && other.getEmail()==null) || 
             (this.email!=null &&
              this.email.equals(other.getEmail()))) &&
            ((this.password==null && other.getPassword()==null) || 
             (this.password!=null &&
              this.password.equals(other.getPassword()))) &&
            ((this.nombre==null && other.getNombre()==null) || 
             (this.nombre!=null &&
              this.nombre.equals(other.getNombre()))) &&
            ((this.apellido==null && other.getApellido()==null) || 
             (this.apellido!=null &&
              this.apellido.equals(other.getApellido()))) &&
            ((this.fechaNac==null && other.getFechaNac()==null) || 
             (this.fechaNac!=null &&
              this.fechaNac.equals(other.getFechaNac()))) &&
            ((this.img==null && other.getImg()==null) || 
             (this.img!=null &&
              this.img.equals(other.getImg()))) &&
            ((this.seguidores==null && other.getSeguidores()==null) || 
             (this.seguidores!=null &&
              java.util.Arrays.equals(this.seguidores, other.getSeguidores()))) &&
            ((this.seguidos==null && other.getSeguidos()==null) || 
             (this.seguidos!=null &&
              java.util.Arrays.equals(this.seguidos, other.getSeguidos())));
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
        if (getNickname() != null) {
            _hashCode += getNickname().hashCode();
        }
        if (getEmail() != null) {
            _hashCode += getEmail().hashCode();
        }
        if (getPassword() != null) {
            _hashCode += getPassword().hashCode();
        }
        if (getNombre() != null) {
            _hashCode += getNombre().hashCode();
        }
        if (getApellido() != null) {
            _hashCode += getApellido().hashCode();
        }
        if (getFechaNac() != null) {
            _hashCode += getFechaNac().hashCode();
        }
        if (getImg() != null) {
            _hashCode += getImg().hashCode();
        }
        if (getSeguidores() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getSeguidores());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getSeguidores(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getSeguidos() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getSeguidos());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getSeguidos(), i);
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
        new org.apache.axis.description.TypeDesc(DtUsuario.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://WS/", "dtUsuario"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("nickname");
        elemField.setXmlName(new javax.xml.namespace.QName("", "nickname"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("email");
        elemField.setXmlName(new javax.xml.namespace.QName("", "email"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("password");
        elemField.setXmlName(new javax.xml.namespace.QName("", "password"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
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
        elemField.setFieldName("apellido");
        elemField.setXmlName(new javax.xml.namespace.QName("", "apellido"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("fechaNac");
        elemField.setXmlName(new javax.xml.namespace.QName("", "fechaNac"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "dateTime"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("img");
        elemField.setXmlName(new javax.xml.namespace.QName("", "img"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("seguidores");
        elemField.setXmlName(new javax.xml.namespace.QName("", "seguidores"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://WS/", ">>dtUsuario>seguidores>entry"));
        elemField.setNillable(false);
        elemField.setItemQName(new javax.xml.namespace.QName("", "entry"));
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("seguidos");
        elemField.setXmlName(new javax.xml.namespace.QName("", "seguidos"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://WS/", ">>dtUsuario>seguidos>entry"));
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
