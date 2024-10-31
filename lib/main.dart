import 'package:flutter/material.dart';
import 'app/app.dart';
import 'core/routes/app_router.dart';
import 'core/services/service_locator.dart';

void main() {
  setup();

  runApp(MainApp(
    appRouter: AppRouter(),
  ));
}
