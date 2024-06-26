import 'package:micro_common/micro_common.dart';

import '../../../core/enums/department_type_enum.dart';
import '../../domain/entities/person_result_entity.dart';

class PersonResultModel extends PersonResultEntity {
  const PersonResultModel({
    required super.adult,
    required super.gender,
    required super.id,
    required super.knownFor,
    required super.knownForDepartment,
    required super.name,
    required super.originalName,
    required super.popularity,
    super.profilePath,
  });

  factory PersonResultModel.fromJson(Map<String, dynamic> map) {
    return PersonResultModel(
      adult: map['adult'],
      gender: map['gender'],
      id: map['id'],
      knownFor: List.from(map['known_for'])
          .map((e) => KnownForModel.fromJson(e))
          .toList(),
      knownForDepartment: getDepartmentTypeEnum(map['known_for_department']),
      name: map['name'],
      originalName: map['original_name'],
      popularity: map['popularity'],
      profilePath: map['profile_path'],
    );
  }
}