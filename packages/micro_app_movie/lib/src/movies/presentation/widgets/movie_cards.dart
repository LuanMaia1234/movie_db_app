import 'package:flutter/material.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';
import '../../../core/routes/movie_routes.dart';
import '../bloc/movie_bloc.dart';
import '../bloc/movie_event.dart';
import '../bloc/movie_state.dart';

class MovieCards extends StatefulWidget {
  const MovieCards({Key? key}) : super(key: key);

  @override
  State<MovieCards> createState() => _MovieCardsState();
}

class _MovieCardsState extends State<MovieCards>
    with AutomaticKeepAliveClientMixin {
  late MovieBloc _bloc;

  EdgeInsets get _padding => const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
      );

  @override
  void initState() {
    super.initState();
    _bloc = GetIt.I<MovieBloc>()..add(const GetNowPlayingEvent());
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<MovieBloc, MovieState>(
      bloc: _bloc,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (state is MovieLoading) ...[
              Padding(
                padding: _padding,
                child: const DSShimmer(
                  height: 20,
                  width: 80,
                ),
              ),
              const DSPosterListShimmer(),
            ] else if (state is MovieSuccess) ...[
              Padding(
                padding: _padding,
                child: const Text(
                  'Em Cartaz',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DSPosterCardList(
                posterCards: List.generate(
                  state.movies.length,
                  (index) {
                    final movie = state.movies[index];
                    return DSPosterCard(
                      path: APIInfo.requestPosterImage(
                        movie.posterPath,
                      ),
                      onTap: () {
                        navigatorKey.currentState!.pushNamed(
                          MovieRoutes.details,
                          arguments: movie.id,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
