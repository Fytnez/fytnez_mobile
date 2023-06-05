import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fytnez_mobile/src/dtos/generic_dto.dart';
import 'package:http/http.dart' as http;

abstract class GenericRoute<DTO extends GenericDTO> {
  final String? _apiRoute = dotenv.env['FYTNEZ_API_URL'];
  
  String getPath();

  @protected
  getRouteName() => _apiRoute;

  Future<bool> create(DTO dto) async {
    var url = Uri.parse('$_apiRoute/${getPath()}');
    var response = await http.post(url, body: dto.toMap());    
    return response.statusCode == HttpStatus.created;
  }
}