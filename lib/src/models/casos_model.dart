import 'dart:convert';

CasosModel casosModelFromJson(String str) => CasosModel.fromJson(json.decode(str));

String casosModelToJson(CasosModel data) => json.encode(data.toJson());

class CasosModel {
    int casoId;
    String descripcion;
    int usuarioId;
    int estadoId;
    String fotoUrl;
    String direccion;
    String respuestaCaso;
    String latitud;
    String longitud;



    CasosModel({
        this.casoId,
        this.descripcion='',
        this.usuarioId=0,
        this.estadoId=0,
        this.fotoUrl='',
        this.direccion='',
        this.respuestaCaso='',
        this.latitud='',
        this.longitud=''
    });

    factory CasosModel.fromJson(Map<String, dynamic> json) => new CasosModel(
        casoId: json["caso_id"],
        descripcion: json["descripcion"],
        usuarioId: json["usuario_id"],
        estadoId: json["estado_id"],
        fotoUrl: json["fotoUrl"],
        direccion: json["direccion"],
        respuestaCaso: json["respuesta_caso"],
        latitud: json["latitud"],
        longitud: json["longitud"]
    );

    Map<String, dynamic> toJson() => {
        "caso_id": casoId,
        "descripcion": descripcion,
        "usuario_id": usuarioId,
        "estado_id": estadoId,
        "fotoUrl": fotoUrl,
        "direccion": direccion,
        "respuesta_caso": respuestaCaso,
        "latitud":latitud,
        "longitud":longitud
    };
}