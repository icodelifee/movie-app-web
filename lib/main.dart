import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moviewebsite/app.dart';
import 'package:moviewebsite/config/example.config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GlobalConfiguration().loadFromMap(appConfig);
  runApp(ProviderScope(child: App()));
}
