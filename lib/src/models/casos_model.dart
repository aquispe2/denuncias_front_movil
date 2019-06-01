import 'dart:convert';

CasosModel casosModelFromJson(String str) => CasosModel.fromJson(json.decode(str));

String casosModelToJson(CasosModel data) => json.encode(data.toJson());

class CasosModel {
    int casoId;
    String descripcion;
    int usuarioId;
    int estadoId;
    String fotoUrl;

    CasosModel({
        this.casoId,
        this.descripcion='',
        this.usuarioId=0,
        this.estadoId=0,
        this.fotoUrl='',
    });

    factory CasosModel.fromJson(Map<String, dynamic> json) => new CasosModel(
        casoId: json["caso_id"],
        descripcion: json["descripcion"],
        usuarioId: json["usuario_id"],
        estadoId: json["estado_id"],
        fotoUrl: json["fotoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "caso_id": casoId,
        "descripcion": descripcion,
        "usuario_id": usuarioId,
        "estado_id": estadoId,
        "fotoUrl": fotoUrl,
    };
}