import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moviewebsite/data/repository/api_repository.dart';

final apiRepositoryProvider = Provider((ref) => APIRepository(Dio()));
