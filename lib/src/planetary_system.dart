import 'dart:math';
import 'planet.dart';

class PlanetarySystem {
  final Random _random = Random();
  final String name;
  final List<Planet> planets;
  final height = 1;
  final width = 2;

  PlanetarySystem({this.name = 'Unnamed System', this.planets = const []});

  int get numberOfPlanets => planets.length;
  bool get hasPlanets => planets.isNotEmpty;

  Planet randomPlanet() {
    if (!hasPlanets) return Planet.nullPlanet();
    return planets[_random.nextInt(planets.length)];
  }

  Planet planetWithName(String name) {
    return planets.firstWhere((planet) => planet.name == name,
        orElse: () => Planet.nullPlanet());
  }
}
