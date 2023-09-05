import 'package:fytnez_mobile/src/apis/fytnez/generic_route.dart';
import 'package:fytnez_mobile/src/dtos/user_dto.dart';

class UserRoute extends GenericRoute<UserDTO> {
  @override
  String getPath() => 'register/users';

  @override
  UserDTO fromMap(Map<String, dynamic> map) {
    return UserDTO.fromMap(map);
  }
}
