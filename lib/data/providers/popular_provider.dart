import 'package:global_configuration/global_configuration.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moviewebsite/data/providers/api_repository_provider.dart';

final popularProvider = FutureProvider(
  (ref) => ref.read(apiRepositoryProvider).getPopular(
        GlobalConfiguration().getValue('apiKey'),
      ),
);
