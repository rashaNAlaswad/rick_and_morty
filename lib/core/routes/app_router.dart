import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/details/ui/characters_details_screen.dart';
import '../../presentation/home/cubit/character_cubit.dart';
import '../../presentation/home/data/models/character.dart';
import '../../presentation/home/ui/characters_screen.dart';
import '../services/service_locator.dart';
import 'routes.dart';

class AppRouter {
  Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
        create: (context) => sl<CharactersCubit>()..getAllCharacters(),
            child: const CharactersScreen(),
          ),
        );
      case Routes.details:
        final characher = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => CharacterDetailsScreen(
            character: characher,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Center(
            child: Text('Page not found'),
          ),
        );
    }
  }
}
