// To parse this JSON data, do
//
//     final usuarioModel = usuarioModelFromJson(jsonString);

import 'dart:convert';

UsuarioModel usuarioModelFromJson(String str) => UsuarioModel.fromJson(json.decode(str));

String usuarioModelToJson(UsuarioModel data) => json.encode(data.toJson());

class UsuarioModel {
    int usuarioId;
    String ci;
    String mail;
    String extencion;
    String nombre;
    String paterno;
    String materno;
    int estadoId;

    UsuarioModel({
        this.usuarioId,
        this.ci,
        this.mail,
        this.extencion,
        this.nombre,
        this.paterno,
        this.materno,
        this.estadoId,
    });

    factory UsuarioModel.fromJson(Map<String, dynamic> json) => new UsuarioModel(
        usuarioId: json["usuario_id"],
        ci: json["ci"],
        mail: json["mail"],
        extencion: json["extencion"],
        nombre: json["nombre"],
        paterno: json["paterno"],
        materno: json["materno"],
        estadoId: json["estado_id"],
    );

    Map<String, dynamic> toJson() => {
        "usuario_id": usuarioId,
        "ci": ci,
        "mail": mail,
        "extencion": extencion,
        "nombre": nombre,
        "paterno": paterno,
        "materno": materno,
        "estado_id": estadoId,
    };
}
