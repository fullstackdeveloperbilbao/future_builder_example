import 'package:flutter/material.dart';
import 'package:future_builder_example/enums/galaxy-type.dart';
import 'package:future_builder_example/models/galaxy-list-item.dart';
import 'package:future_builder_example/providers/galaxy-api-service.dart';
import 'package:provider/provider.dart';

class GalaxyItem extends StatefulWidget {
  final int id;
  final GalaxyType type;

  const GalaxyItem({
    super.key,
    required this.id,
    required this.type,
  });

  @override
  State<GalaxyItem> createState() => _GalaxyItemState();
}

class _GalaxyItemState extends State<GalaxyItem> {
  late Future<GalaxyListItem> item;

  @override
  void initState() {
    item = _fetchItem();
    super.initState();
  }

  @override
  void didUpdateWidget(GalaxyItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.type != widget.type) {
      item = _fetchItem();
    }
  }

  Future<GalaxyListItem> _fetchItem() {
    final galaxyApiServiceInstance =
        Provider.of<GalaxyApiService>(context, listen: false);
    return galaxyApiServiceInstance.fetchGalaxyItem(
        widget.type.name, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: FutureBuilder<GalaxyListItem>(
        future: item,
        builder:
            (BuildContext context, AsyncSnapshot<GalaxyListItem> snapshot) {
          Widget child;
          if (snapshot.hasData) {
            child = Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Result: ${snapshot.data!.name}'),
            );
          } else if (snapshot.hasError) {
            child = Column(
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                ),
              ],
            );
          } else {
            child = const Column(
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Awaiting result...'),
                ),
              ],
            );
          }
          return Center(
            child: child,
          );
        },
      ),
    );
  }
}
