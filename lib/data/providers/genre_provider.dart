import 'package:global_configuration/global_configuration.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moviewebsite/data/models/genre.dart';
import 'package:moviewebsite/data/providers/api_repository_provider.dart';

final genreProvider = FutureProvider<GenreResponse>(
  (ref) => ref.read(apiRepositoryProvider).getGenres(
        GlobalConfiguration().getValue('apiKey'),
      ),
);
