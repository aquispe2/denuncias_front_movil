class PostCasos {
  final String descripcion;
  final int usuario_id;
  final int estado_id;
 
  PostCasos({ this.descripcion, this.usuario_id, this.estado_id});
 
  factory PostCasos.fromJson(Map<String, dynamic> json) {
    return PostCasos(
      descripcion: json['descripcion'],
      usuario_id: json['usuario_id'].toInt(),
      estado_id: json['estado_id'].toInt(),
    );
  }
 
  Map toMap() {
    var map = new Map<String, dynamic>();
    map["descripcion"] = descripcion;
    map["usuario_id"] = usuario_id;
    map["estado_id"] = estado_id;
    return map;
  }
}