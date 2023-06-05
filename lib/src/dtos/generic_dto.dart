import 'package:flutter/material.dart';

abstract class GenericDTO {
  dynamic _id;
  DateTime? _createdAt;
  DateTime? _updatedAt;
  DateTime? _deletedAt;

  GenericDTO({
    dynamic id,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  })  : _id = id,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _deletedAt = deletedAt;

  GenericDTO.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _createdAt =
        map['created_at'] != null ? DateTime.parse(map['created_at']) : null;
    _updatedAt =
        map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null;
    _deletedAt =
        map['deleted_at'] != null ? DateTime.parse(map['deleted_at']) : null;
  }

  @protected
  Map<String, dynamic> dtoToMap();

  dynamic getId() => _id;

  DateTime? getCreatedAt() => _createdAt;

  DateTime? getUpdatedAt() => _updatedAt;

  DateTime? getDeletedAt() => _deletedAt;

  Map<String, dynamic> toMap() {
    final genericDtoJson = {
      'id': _id,
      'created_at': _createdAt?.toIso8601String(),
      'updated_at': _updatedAt?.toIso8601String(),
      'deleted_at': _deletedAt?.toIso8601String(),
    };
    final dtoJson = dtoToMap();
    return {...dtoJson, ...genericDtoJson};
  }
}