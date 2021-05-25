import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moviewebsite/data/models/genre.dart';
import 'package:moviewebsite/data/models/movie.dart';
import 'package:moviewebsite/data/providers/genre_provider.dart';
import 'package:moviewebsite/utils/get_random_color.dart';

class GenreList extends HookWidget {
  const GenreList({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    final genre = useProvider(genreProvider);

    return genre.when(
      data: (genres) {
        final movieGenres = getMovieGenres(movie.genreIds!, genres.genres);
        return Wrap(children: getChips(movieGenres));
      },
      loading: () => SizedBox(),
      error: (error, stackTrace) => SizedBox(),
    );
  }

  List<Genre> getMovieGenres(List<int> genreIds, List<Genre> genres) {
    return genreIds
        .map(
          (id) => genres.firstWhere(
            (genre) => genre.id == id,
          ),
        )
        .toList();
  }

  List<Widget> getChips(List<Genre> movieGenres) {
    // generates genres along with release date as chips
    var chips = <Widget>[];
    chips = movieGenres
        .map(
          (e) => Padding(
            padding: const EdgeInsets.all(5.0),
            child: Chip(
              backgroundColor: getRandomColor(),
              label: Text(e.name),
            ),
          ),
        )
        .toList();
    chips.add(Padding(
      padding: EdgeInsets.all(5),
      child: Chip(
        label: Text(movie.releaseDate!.year.toString()),
        backgroundColor: getRandomColor(),
      ),
    ));
    return chips;
  }
}
