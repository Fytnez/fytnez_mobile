import 'package:fytnez_mobile/src/dtos/generic_dto.dart';

class UserDTO extends GenericDTO {
  String? _name;
  DateTime? _birthDate;
  int? _height;
  int? _weight;
  String? _email;
  String? _password;

  UserDTO({
    super.id,
    required String name,
    required DateTime birthDate,
    required int height,
    required int weight,
    required String email,
    String? password,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  })  : _name = name,
        _birthDate = birthDate,
        _height = height,
        _weight = weight,
        _email = email,
        _password = password;
}
