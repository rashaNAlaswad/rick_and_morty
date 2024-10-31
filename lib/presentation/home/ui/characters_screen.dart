import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../cubit/character_cubit.dart';
import '../data/models/character.dart';
import 'widgets/character_item.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rick and Morty'),
        ),
        body: BlocBuilder<CharactersCubit, CharactersState>(
          builder: (context, state) {
            if (state is CharacterFailure) {
              return Center(child: Text(state.message));
            } else if (state is CharacterPaginationLoading) {
              return _buildLoadedCharacterGrid(context, state);
            } else {
              return _buildSkeletonGrid();
            }
          },
        ));
  }

  Widget _buildLoadedCharacterGrid(
    BuildContext context,
    CharactersState state,
  ) {
    final characters = (state as dynamic).characters;

    return GridView.builder(
      controller: context.read<CharactersCubit>().scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount:
          characters.length + (state is CharacterPaginationLoading ? 1 : 0),
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        if (index >= characters.length) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return CharacterItem(
            character: characters[index],
          );
        }
      },
    );
  }

  Widget _buildSkeletonGrid() {
    return Skeletonizer(
      enabled: true,
      containersColor: Colors.grey.shade300,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: _fakeCharacters.length,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (_, index) {
          return CharacterItem(
            character: _fakeCharacters[index],
          );
        },
      ),
    );
  }

  static final List<Character> _fakeCharacters = List.generate(
    8,
    (index) => Character(
      id: index + 1,
      name: 'Character $index',
      image: '',
    ),
  );
}
