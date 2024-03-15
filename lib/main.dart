import 'package:flutter/material.dart';

import 'backbone/dependency_injection.dart' as di;
import 'presentation/navigation/app_router.dart';

void main() {
  di.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Chat bot',
      routerConfig: _appRouter.config(),
    );
  }
}
