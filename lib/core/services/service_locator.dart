import 'package:dio/dio.dart';
import '../../presentation/home/cubit/character_cubit.dart';
import '../api/api_consumer.dart';
import '../api/dio_consumer.dart';
import '../../presentation/home/data/repository/characters_repository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setup() {
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton(() => CharactersRepository());
  sl.registerLazySingleton(() => CharactersCubit(sl()));
}
