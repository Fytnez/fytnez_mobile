import 'package:fytnez_mobile/src/apis/fytnez/generic_route.dart';
import 'package:fytnez_mobile/src/dtos/hydric_consumption_dto.dart';

class HydricConsumptionRoute extends GenericRoute<HydricConsumptionDTO> {
  @override
  String getPath() => 'register/hydric_consumption';

  @override
  HydricConsumptionDTO fromMap(Map<String, dynamic> map) {
    return HydricConsumptionDTO.fromMap(map);
  }
}
