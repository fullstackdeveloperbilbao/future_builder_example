import 'package:future_builder_example/enums/galaxy-type.dart';
import 'package:future_builder_example/models/galaxy-settings-dropdown.dart';

final List<GalaxySettingsDropDown> galaxySettingsDropdownList = [
  GalaxySettingsDropDown(type: GalaxyType.people, text: 'people'),
  GalaxySettingsDropDown(type: GalaxyType.planets, text: 'planets'),
  GalaxySettingsDropDown(type: GalaxyType.starships, text: 'starships'),
];
