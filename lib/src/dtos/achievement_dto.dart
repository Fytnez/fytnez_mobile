import 'package:fytnez_mobile/src/dtos/generic_dto.dart';
import 'package:fytnez_mobile/src/views/pages/user/user_form/user_form_data.dart';
import 'package:fytnez_mobile/src/extensions/date_time_extensions.dart';

class AchievementDTO extends GenericDTO {
  String? _name;
  int? _points;
  bool? _isSecret;
  String? _type;
  String? _icon;

  AchievementDTO({
    super.id,
    required String name,
    required int points,
    required bool isSecret,
    required String type,
    required String icon,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  })  : _name = name,
      _points = points,
      _isSecret = isSecret,
      _type = type,
      _icon = icon;

  @override
  Map<String, dynamic> dtoToMap() {
    return {
      'name': _name,
      'points': _points,
      'is_secret': _isSecret,
      'type': _type,
      'icon': _icon,
    };
  }
}
