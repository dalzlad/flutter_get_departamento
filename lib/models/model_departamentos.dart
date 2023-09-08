
import 'dart:convert';


DepartamentoModel dataModelFromJson(String str) => DepartamentoModel.fromJson(json.decode(str));

String dataModelToJson(DepartamentoModel data) => json.encode(data.toJson());

class DepartamentoModel {
    DepartamentoModel({
        required this.departamentos,
        
    });


    List<DepartamentoApi> departamentos;
   

    factory DepartamentoModel.fromJson(List<dynamic> json) => DepartamentoModel(
        departamentos: List<DepartamentoApi>.from(json.map((x) => DepartamentoApi.fromJson(x))),
       
    );

    Map<String, dynamic> toJson() => {
        "departamentos": List<dynamic>.from(departamentos.map((x) => x.toJson())),
        
    };
}

class DepartamentoApi {
    DepartamentoApi({
    required this.nomdepto,
    required this.iddepto,
    required this.deptolatitud,
    required this.deptolongitud,
        
        
    });

    String nomdepto;
    String iddepto;
    String deptolatitud;
    String deptolongitud;
      
    
    factory DepartamentoApi.fromJson(Map<String, dynamic> json) => DepartamentoApi(
      nomdepto: json["nomdepto"],
      iddepto: json["iddepto"],
      deptolatitud: json["deptolatitud"],
      deptolongitud: json["deptolongitud"],
        
    );

    Map<String, dynamic> toJson() => {
        "nomdepto": nomdepto,
        "iddepto": iddepto,
        "deptolatitud": deptolatitud,
        "deptolongitud": deptolongitud,
        
    };
}

  