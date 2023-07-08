import 'package:fytnez_mobile/src/dtos/user_dto.dart';

class UserFormData {
  String name = '';
  DateTime? birthday;
  int height = 0;
  int weight = 0;
  String email = '';
  String password = '';
  String passwordConfirmation = '';

  UserDTO toDTO() => UserDTO(
        name: name,
        birthday: birthday!,
        height: height,
        weight: weight,
        email: email,
        password: password,
      );
}
