import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../tv_shows/data/datasources/i_tv_show_datasource.dart';
import '../../tv_shows/data/datasources/tv_show_datasource.dart';
import '../../tv_shows/data/repositories/tv_show_repository.dart';
import '../../tv_shows/domain/repositories/i_tv_show_repository.dart';
import '../../tv_shows/domain/usecases/get_tv_show_details_usecase.dart';
import '../../tv_shows/domain/usecases/get_tv_shows_usecase.dart';
import '../../tv_shows/presentation/bloc/details/tv_show_details_bloc.dart';
import '../../tv_shows/presentation/bloc/list/tv_show_bloc.dart';

class Injector {
  static void initialize() {
    final GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<ITVShowDatasource>(() => TVShowDatasource(
          CustomDio([
            CommonInterceptor(HiveCacheService()),
          ]),
        ));

    getIt.registerLazySingleton<ITVShowRepository>(
      () => TVShowRepository(getIt()),
    );

    getIt.registerLazySingleton<GetTVShowsUseCase>(
      () => GetTVShowsUseCase(getIt()),
    );

    getIt.registerLazySingleton<GetTVShowDetailsUseCase>(
      () => GetTVShowDetailsUseCase(getIt()),
    );

    getIt.registerFactory(() => TVShowBloc(getIt()));

    getIt.registerFactory(() => TVShowDetailsBloc(getIt()));
  }
}
