import 'package:fytnez_mobile/src/dtos/generic_dto.dart';

class HydricConsumptionDTO extends GenericDTO {
  final int qntyConsumption;
  final String date;
  final int userId;

  HydricConsumptionDTO({
    dynamic id,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    required this.qntyConsumption,
    required this.date,
    required this.userId,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
          deletedAt: deletedAt,
        );
  factory HydricConsumptionDTO.fromMap(Map<String, dynamic> map) {
    return HydricConsumptionDTO(
      id: map['id'],
      createdAt:
          map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt:
          map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      deletedAt:
          map['deleted_at'] != null ? DateTime.parse(map['deleted_at']) : null,
      qntyConsumption: map['qnty_consumption'],
      date: map['date'],
      userId: map['user_id'],
    );
  }

  @override
  Map<String, dynamic> dtoToMap() {
    return {
      'qnty_consumption': qntyConsumption,
      'date': date,
      'user_id': userId,
    };
  }
}
