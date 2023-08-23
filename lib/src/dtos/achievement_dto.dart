import 'package:fytnez_mobile/src/dtos/generic_dto.dart';

class AchievementDTO extends GenericDTO {
  String? _name;
  int? _points;
  bool? _isSecret;
  String? _type;
  String? _icon;
  String? _description;
  String? _hexColor;

  AchievementDTO({
    super.id,
    required String name,
    required int points,
    required bool isSecret,
    required String type,
    required String icon,
    required String description,
    required String? hexColor,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  })  : _name = name,
      _points = points,
      _isSecret = isSecret,
      _type = type,
      _icon = icon,
      _description = description,
      _hexColor = hexColor;

  AchievementDTO.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    _name = map['name'];
    _name = map['name'];
    _points = map['points'];
    _isSecret = map['is_secret'];
    _type = map['type'];
    _icon = map['icon'];
    _description = map['description'];
    _hexColor = map['hex_color'];
  }

  @override
  Map<String, dynamic> dtoToMap() {
    return {
      'name': _name,
      'points': _points,
      'is_secret': _isSecret,
      'type': _type,
      'icon': _icon,
      'description': _description,
      'color': _hexColor
    };
  }

  String getName() {
    if (_name == null) {
      throw Exception('_name not found');
    }

    return _name!;
  }

  String getDescription() {
    if (_description == null) {
      return '';
    }

    return _description!;
  }

  String getIcon() {
    if (_icon == null) {
      throw Exception('_icon not found');
    }

    return _icon!;
  } 

  String getHexColor() {
    if (_hexColor == null) {
      throw Exception('_hexColor not found');
    }

    return _hexColor!;
  } 
}
