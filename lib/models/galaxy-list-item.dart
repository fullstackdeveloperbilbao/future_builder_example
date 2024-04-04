class GalaxyListItem {
  final String name;

  GalaxyListItem({required this.name});

  factory GalaxyListItem.fromJson(Map<String, dynamic> json) {
    return GalaxyListItem(
      name: json['name'],
    );
  }
}
