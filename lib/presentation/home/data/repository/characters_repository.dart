import 'package:dartz/dartz.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/services/service_locator.dart';
import '../models/character.dart';

class CharactersRepository {
  Future<Either<String, List<Character>>> getAllCharacters(
      {required int page}) async {
    try {
      final response = await sl<ApiConsumer>()
          .get(EndPoints.characters, queryParameters: {'page': page});

      List<Character> characters = response[ApiKeys.results]
          .map<Character>((character) => Character.fromJson(character))
          .toList();
      return Right(characters);
    } on ServerException catch (e) {
      return Left(e.errModel.error);
    }
  }
}
