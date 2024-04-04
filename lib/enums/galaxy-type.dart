enum GalaxyType {
  people,
  planets,
  starships,
}

GalaxyType parseGalaxyType(String value) {
  return GalaxyType.values.byName(value);
}
