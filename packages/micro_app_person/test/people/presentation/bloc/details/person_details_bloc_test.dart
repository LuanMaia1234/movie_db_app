import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_person/src/core/enums/department_type_enum.dart';
import 'package:micro_app_person/src/core/enums/gender_type_enum.dart';
import 'package:micro_app_person/src/people/domain/entities/person_details_entity.dart';
import 'package:micro_app_person/src/people/domain/usecases/get_person_details_usecase.dart';
import 'package:micro_app_person/src/people/presentation/bloc/details/person_details_bloc.dart';
import 'package:micro_app_person/src/people/presentation/bloc/details/person_details_event.dart';
import 'package:micro_app_person/src/people/presentation/bloc/details/person_details_state.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockGetPersonDetailsUseCase extends Mock
    implements GetPersonDetailsUseCase {}

void main() {
  late MockGetPersonDetailsUseCase getPersonDetailsUseCase;
  late PersonDetailsBloc bloc;

  setUp(() {
    getPersonDetailsUseCase = MockGetPersonDetailsUseCase();
    bloc = PersonDetailsBloc(getPersonDetailsUseCase);
  });

  tearDown(() {
    bloc.close();
  });

  const tId = 31;

  final tPersonDetailsEntity = PersonDetailsEntity(
    adult: false,
    alsoKnownAs: const ['Thomas Jeffrey Hanks'],
    biography: 'Thomas Jeffrey Hanks (born July 9, 1956) is an American actor and filmmaker',
    birthday: DateTime.now(),
    deathDay: null,
    gender: GenderTypeEnum.male,
    homepage: null,
    id: 31,
    imdbId: 'nm0000158',
    knownForDepartment: DepartmentTypeEnum.acting,
    name: 'Tom Hanks',
    placeOfBirth: 'Concord, California, USA',
    popularity: 82.989,
    profilePath: '/xndWFsBlClOJFRdhSt4NBwiPq2o.jpg',
  );

  test('Should initiate state equals to PersonDetailsInitial', () async {
    expect(bloc.state, equals(const PersonDetailsInitial()));
  });

  group('getDetails', () {
    blocTest<PersonDetailsBloc, PersonDetailsState>(
      'Should emit the correct state sequence when getPersonDetailsUseCase returns success',
      build: () {
        when(() => getPersonDetailsUseCase(tId))
            .thenAnswer((_) async => Right(tPersonDetailsEntity));
        return bloc;
      },
      act: (bloc) {
        bloc.add(const GetPersonDetailsEvent(id: tId));
      },
      expect: () => <dynamic>[
        isA<PersonDetailsLoading>(),
        isA<PersonDetailsSuccess>(),
      ],
    );

    blocTest<PersonDetailsBloc, PersonDetailsState>(
      'Should emit the correct state sequence when getPersonDetailsUseCase returns error',
      build: () {
        when(() => getPersonDetailsUseCase(tId))
            .thenAnswer((_) async => Left(ApiException('Ocorreu algum erro')));
        return bloc;
      },
      act: (bloc) {
        bloc.add(const GetPersonDetailsEvent(id: tId));
      },
      expect: () => <dynamic>[
        isA<PersonDetailsLoading>(),
        isA<PersonDetailsError>(),
      ],
    );
  });
}