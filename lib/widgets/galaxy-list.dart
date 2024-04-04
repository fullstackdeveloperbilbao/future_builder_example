import 'package:flutter/material.dart';
import 'package:future_builder_example/enums/galaxy-type.dart';
import 'package:future_builder_example/providers/galaxy-provider.dart';
import 'package:future_builder_example/widgets/galaxy-item.dart';
import 'package:future_builder_example/widgets/galaxy-settings.dart';
import 'package:provider/provider.dart';

class GalaxyListPage extends StatefulWidget {
  const GalaxyListPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<GalaxyListPage> createState() => _GalaxyListPageState();
}

class _GalaxyListPageState extends State<GalaxyListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const GalaxySettings()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Selector<GalaxyProvider, GalaxyType>(
          selector: (_, model) => model.type,
          builder: (_, galaxyType, __) {
            return ListView.builder(
              itemCount: 9,
              itemBuilder: (context, index) {
                return ListTile(
                  title: GalaxyItem(
                    id: index + 1,
                    type: galaxyType,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
