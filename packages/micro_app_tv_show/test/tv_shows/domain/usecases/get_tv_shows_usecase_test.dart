import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_tv_show/src/core/enums/tv_show_type_enum.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/entities/tv_show_entity.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/entities/tv_show_result_entity.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/repositories/i_tv_show_repository.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/usecases/get_tv_shows_usecase.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockTVShowRepository extends Mock implements ITVShowRepository {}

void main() {
  late MockTVShowRepository repository;
  late GetTVShowsUseCase getTVShowsUseCase;

  setUp(() {
    repository = MockTVShowRepository();
    getTVShowsUseCase = GetTVShowsUseCase(repository);
  });

  final tTVShowEntity = TVShowEntity(
    page: 1,
    results: [
      TVShowResultEntity(
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
    ],
    totalPages: 14,
    totalResults: 265,
  );

  const tType = TVShowTypeEnum.onTheAir;

  const tPage = 1;

  test('Should return a TVShowEntity when call repository', () async {
    when(() => repository.getList(type: tType, page: tPage))
        .thenAnswer((_) async => Right(tTVShowEntity));
    final result = await getTVShowsUseCase(type: tType, page: tPage);
    expect(result, Right<Exception, TVShowEntity>(tTVShowEntity));
  });

  test('Should return an exception when call repository', () async {
    when(() => repository.getList(type: tType, page: tPage))
        .thenAnswer((_) async => Left(Exception('Ocorreu algum erro')));
    final result = await getTVShowsUseCase(type: tType, page: tPage);
    expect(result.isLeft(), true);
  });
}
