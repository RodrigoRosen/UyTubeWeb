$("#altaUsuario").validate({
           rules: {
               contrasena: { 
                 required: true,
                    minlength: 6,
                    maxlength: 10,

               } , 

                   confcontrasena: { 
                    equalTo: "#contrasena",
                     minlength: 6,
                     maxlength: 10
               } ,
               
               nickname:{
            	   required: true,
            	   maxlenght: 8
               }


           },
     messages:{
         contrasena: { 
                 required:"Password Requerido",
                 minlength: "Minimo 6 caracteres",
                 maxlength: "Maximo 10 caracteres"
               },
       confcontrasena: { 
         equalTo: "El password debe ser igual al anterior",
         minlength: "Minimo 6 caracteres",
         maxlength: "Maximo 10 caracteres"
       }
     }
});