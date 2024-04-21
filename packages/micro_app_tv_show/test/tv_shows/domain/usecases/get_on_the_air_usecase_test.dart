import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/entities/tv_show_entity.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/repositories/i_tv_show_repository.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/usecases/get_on_the_air_usecase.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockTVShowRepository extends Mock implements ITVShowRepository {}

void main() {
  late MockTVShowRepository repository;
  late GetOnTheAirUseCase getOnTheAirUseCase;

  setUp(() {
    repository = MockTVShowRepository();
    getOnTheAirUseCase = GetOnTheAirUseCase(repository);
  });

  final tListTVShowEntity = [
    TVShowEntity(
      backdropPath: '/mAJ84W6I8I272Da87qplS2Dp9ST.jpg',
      firstAirDate: DateTime.now(),
      genreIds: const [9648, 18],
      id: 202250,
      name: 'Dirty Linen',
      originCountry: const ['PH'],
      originalLanguage: 'tl',
      originalName: 'Dirty Linen',
      overview:
          'To exact vengeance, a young woman infiltrates the household of an influential family as a housemaid to expose their dirty secrets. However, love will get in the way of her revenge plot.',
      popularity: 2797.914,
      posterPath: '/aoAZgnmMzY9vVy9VWnO3U5PZENh.jpg',
      voteAverage: 5,
      voteCount: 13,
    ),
  ];

  test('Should return a TVShowEntity when call repository', () async {
    when(() => repository.getOnTheAir())
        .thenAnswer((_) async => Right(tListTVShowEntity));
    final result = await getOnTheAirUseCase();
    expect(result, Right<Exception, List<TVShowEntity>>(tListTVShowEntity));
  });

  test('Should return an exception when call repository', () async {
    when(() => repository.getOnTheAir())
        .thenAnswer((_) async => Left(Exception('Ocorreu algum erro')));
    final result = await getOnTheAirUseCase();
    expect(result.isLeft(), true);
  });
}