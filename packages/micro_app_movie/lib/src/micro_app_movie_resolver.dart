import 'dart:ui';

import 'package:micro_core/micro_core.dart';

import 'core/injector/injector.dart';
import 'core/routes/movie_routes.dart';

import 'movies/presentation/screens/movie_details_screen.dart';

class MicroAppMovieResolver implements MicroApp {
  @override
  String get microAppName => 'micro_app_movie';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        MovieRoutes.details: (_, args) => MovieDetailsScreen(movieId: args as int),
      };

  @override
  VoidCallback get injection => Injector.initialize;
}
