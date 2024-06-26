import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../core/enums/department_type_enum.dart';

class PersonResultEntity extends Equatable {
  const PersonResultEntity({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownFor,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
  });

  final bool adult;
  final int gender;
  final int id;
  final List<KnownForEntity> knownFor;
  final DepartmentTypeEnum knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;

  @override
  String toString() {
    return 'PersonResultEntity(adult: $adult,'
        ' gender: $gender,'
        ' id: $id,'
        ' knownFor: $knownFor,'
        ' knownForDepartment: $knownForDepartment,'
        ' name: $name,'
        ' originalName: $originalName,'
        ' popularity: $popularity,'
        ' profilePath: $profilePath)';
  }

  @override
  List<Object?> get props => [
    adult,
    gender,
    id,
    knownFor,
    knownForDepartment,
    name,
    popularity,
    profilePath,
  ];
}
