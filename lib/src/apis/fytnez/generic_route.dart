import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fytnez_mobile/src/views/dialogs/generic_dialogs.dart';
import 'package:http/http.dart' as http;
import 'package:fytnez_mobile/src/dtos/generic_dto.dart';

abstract class GenericRoute<DTO extends GenericDTO> {
  final String? _apiRoute = dotenv.env['FYTNEZ_API_URL'];

  String getPath();

  DTO fromMap(Map<String, dynamic> map);

  @protected
  getRouteName() => _apiRoute;

  Future<bool> create(DTO dto) async {
    final url = Uri.parse('$_apiRoute/${getPath()}/');
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(dto.toMap()));

    switch (response.statusCode) {
      case HttpStatus.created:
        return true;

      case HttpStatus.badRequest:
        GenericDialogs.showAlertDialog(
            'Não foi possível criar: ${response.body}');
        return false;

      default:
        GenericDialogs.showAlertDialog(
            'Não foi possível criar: ${response.body}');
        return false;
    }
  }

  Future<List<DTO>> listAll() async {
    final url = Uri.parse('$_apiRoute/${getPath()}/');
    final response = await http.get(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }
    );

    print(response);

    switch(response.statusCode) {
        case HttpStatus.ok:
          final List<dynamic> jsonResponse = json.decode(response.body);
          return jsonResponse.map((dtoJson) => this.fromMap(dtoJson)).toList();

        default:
          GenericDialogs.showAlertDialog(
              'Não foi buscar os registros: ${response.body}');
          return [];
    }
  }
}
