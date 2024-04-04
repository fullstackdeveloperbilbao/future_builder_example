import 'package:flutter/material.dart';
import 'package:future_builder_example/enums/galaxy-type.dart';

class GalaxyProvider with ChangeNotifier {
  GalaxyType _type = GalaxyType.people;

  GalaxyType get type => _type;

  set type(GalaxyType galaxyType) {
    _type = galaxyType;
    notifyListeners();
  }
}
