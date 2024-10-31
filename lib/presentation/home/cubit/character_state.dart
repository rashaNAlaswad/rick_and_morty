part of 'character_cubit.dart';

@immutable
sealed class CharactersState {}

final class CharacterInitial extends CharactersState {}

final class CharacterLoading extends CharactersState {}

class CharacterPaginationLoading extends CharactersState {
  final List<Character> characters;
  CharacterPaginationLoading(this.characters);
}

final class CharacterFailure extends CharactersState {
  final String message;
  CharacterFailure(this.message);
}
