import 'package:fytnez_mobile/src/dtos/generic_dto.dart';

class UserDTO extends GenericDTO {
  String? _name;
  DateTime? _birthday;
  int? _height;
  int? _weight;
  String? _email;
  String? _password;

  UserDTO({
    super.id,
    required String name,
    required DateTime birthday,
    required int height,
    required int weight,
    required String email,
    String? password,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  })  : _name = name,
        _birthday = birthday,
        _height = height,
        _weight = weight,
        _email = email,
        _password = password;

  @override
  Map<String, dynamic> dtoToMap() {
    return {
      'name': _name,
      'birthday': _birthday?.toIso8601String(),
      'height': _height,
      'weight': _weight,
      'email': _email,
      'password': _password,
    };
  }
}
