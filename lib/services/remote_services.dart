import 'dart:convert';

import 'package:app/models/agenda.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();
  static String token = "";
  
  static Future<dynamic> authenticate(email, senha) async {

    final headers = {"Content-Type": "application/json"};
    final user = { "email": email, "password": senha };
    final String url = 'https://cmd-londrina.herokuapp.com/authenticate';

    final response = await client.post(Uri.parse(url), headers: headers, body: json.encode(user));

    final body = jsonDecode(response.body);

    if(body.containsKey("token")){
      token = 'Bearer ' + body["token"];
    }

    return body;

  }

  static Future<dynamic> getTurmas() async {
    String url = 'https://cmd-londrina.herokuapp.com/turmas';
    var headerAuth = { "Authorization": token };

    var response = await client.get(Uri.parse(url), headers: headerAuth);
    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      return decode;
    } else {
      return null;
    }
  }

  static Future<dynamic> getAgenda(int usuario) async {
    String url = 'https://cmd-londrina.herokuapp.com/agendas/' + usuario.toString();
    var headerAuth = { "Authorization": token };

    var response = await client.get(Uri.parse(url), headers: headerAuth);
    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      return decode;
    } else {
      return null;
    }
  }

  Future<int> getDisponibilidade(String data, int periodo) async {
    String url = 'https://cmd-londrina.herokuapp.com/disponibilidade/' +
        data +
        "/" +
        periodo.toString();
    var headerAuth = { "Authorization": token };

    var response = await client.get(Uri.parse(url), headers: headerAuth);
    return int.parse(response.body);
  }

  Future<int> postAgenda(Agenda agenda) async {
    String url = 'https://cmd-londrina.herokuapp.com/agendas';

    final headers = {"Content-Type": "application/json", "Authorization": token };

    final body = {
      "data_agendamento": agenda.dataAgendamento,
      "user_id": agenda.usuarioId,
      "qtd_solicitada_ipad": agenda.qtdSolicitadaIpda,
      "periodo_aula": agenda.periodo
    };

    var response = await client.post(Uri.parse(url),
        headers: headers, body: json.encode(body));
    if (response.statusCode == 200) {
      return 200;
    }
    return response.statusCode;
  }
}
