import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repository/characters_repository.dart';

import '../data/models/character.dart';

part 'character_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this.charactersRepository) : super(CharacterInitial()) {
    scrollController.addListener(_onScroll);
  }

  final CharactersRepository charactersRepository;
  final ScrollController scrollController = ScrollController();

  int _currentPage = 1;
  bool _isLastPage = false;
  bool _isFetching = false;
  final List<Character> _allCharacters = [];

  getAllCharacters({bool isPagination = false}) async {
    if (_isLastPage) return;
    emit(isPagination
        ? CharacterPaginationLoading(_allCharacters)
        : CharacterLoading());

    final response =
        await charactersRepository.getAllCharacters(page: _currentPage);

    response.fold(
      (l) => emit(CharacterFailure(l)),
      (r) {
        if (r.isEmpty) {
          _isLastPage = true;
        } else {
          _currentPage++;
          _allCharacters.addAll(r);
          emit(CharacterPaginationLoading(_allCharacters));
        }
      },
    );
  }

  void _onScroll() {
    if (!_isFetching &&
        scrollController.position.pixels >=
            scrollController.position.maxScrollExtent) {
      _isFetching = true;
      getAllCharacters(isPagination: true).then((_) => _isFetching = false);
    }
  }

  @override
  Future<void> close() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    return super.close();
  }
}
