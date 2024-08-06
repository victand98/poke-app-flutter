import 'package:flutter/material.dart';

class PokemonProvider extends ChangeNotifier {
  PokemonProvider() {
    getInitialData();
  }

  void getInitialData() async {
    // Fetch data from API
    notifyListeners();
  }
}
