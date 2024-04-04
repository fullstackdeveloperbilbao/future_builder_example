import 'package:flutter/material.dart';
import 'package:future_builder_example/constants/constants.dart';
import 'package:future_builder_example/enums/galaxy-type.dart';
import 'package:future_builder_example/models/galaxy-settings-dropdown.dart';
import 'package:future_builder_example/providers/galaxy-provider.dart';
import 'package:provider/provider.dart';

class GalaxySettings extends StatefulWidget {
  const GalaxySettings({super.key});

  @override
  State<GalaxySettings> createState() => _GalaxySettingsState();
}

class _GalaxySettingsState extends State<GalaxySettings> {
  @override
  Widget build(BuildContext context) {
    final galaxyProviderInstance =
        Provider.of<GalaxyProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Selector<GalaxyProvider, GalaxyType>(
          selector: (_, model) => model.type,
          builder: (_, galaxyType, __) {
            return DropdownButton<String>(
              value: galaxyType.name,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                galaxyProviderInstance.type = parseGalaxyType(value!);
              },
              items: galaxySettingsDropdownList.map<DropdownMenuItem<String>>(
                (GalaxySettingsDropDown value) {
                  return DropdownMenuItem<String>(
                    value: value.type.name,
                    child: Text(value.text),
                  );
                },
              ).toList(),
            );
          },
        ),
      ),
    );
  }
}
