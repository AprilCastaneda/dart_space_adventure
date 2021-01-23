import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dart_space_adventure/dart_space_adventure.dart';

var systemName;
var planetData;

Future<void> main(List<String> arguments) async {
  await serializeJsonData(arguments[0]);
  SpaceAdventure(
          planetarySystem:
              PlanetarySystem(name: systemName, planets: mockPlanets()))
      .start();
}

Future<void> serializeJsonData(String jsonPath) async {
  planetData = jsonDecode(await File(jsonPath).readAsString());
  systemName = planetData['name'];
}

List<Planet> mockPlanets() {
  final planets = planetData['planets'];
  var planetList = <Planet>[];
  planets.forEach((e) {
    planetList.add(Planet(name: e['name'], description: e['description']));
  });
  return planetList;
}
