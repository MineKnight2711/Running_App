enum MapDirection {
  north,
  east,
  south,
  west,
}

extension MapDirectionExtension on MapDirection {
  double get numericValue {
    switch (this) {
      case MapDirection.north:
        return 0;
      case MapDirection.south:
        return 180;
      case MapDirection.west:
        return 270;
      case MapDirection.east:
        return 90;
      default:
        return 0;
    }
  }

  MapDirection get next {
    List<MapDirection> values = MapDirection.values;
    int currentIndex = values.indexOf(this);
    int nextIndex = (currentIndex + 1) % values.length;
    return values[nextIndex];
  }
}
