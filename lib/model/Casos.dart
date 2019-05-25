class Casos{
  int caso_id;
  String descripcion;
  int usuario_id;
  int estado_id;

  factory Casos(Map jsonMap){
    try{
      return new Casos.deserialize(jsonMap);
    } catch(ex){
      throw ex;
    }
  }
 

  Casos.deserialize(Map json) :
    caso_id = json ["caso_id"].toInt(),
    descripcion = json["descripcion"],
    usuario_id = json["usuario_id"].toInt(),
    estado_id = json["estado_id"].toInt();

    
  
}

