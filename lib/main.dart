import 'package:flutter/material.dart';
import 'package:poke_app/providers/providers.dart';
import 'package:poke_app/views/views.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PokemonProvider(), lazy: true),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poke App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/splashScreen',
      routes: {
        '/splashScreen': (context) => const SplashScreen(),
        '/homeScreen': (context) => const HomeScreen(),
        '/detailsScreen': (context) => const DetailsScreen(),
      },
    );
  }
}
