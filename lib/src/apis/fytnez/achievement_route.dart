import 'package:fytnez_mobile/src/apis/fytnez/generic_route.dart';
import 'package:fytnez_mobile/src/dtos/achievement_dto.dart';

class AchievementRoute extends GenericRoute<AchievementDTO> {
  @override
  String getPath() => 'register/achievements';
}
