import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dart_space_adventure/dart_space_adventure.dart';

// const systemName = 'Solar System';
// const planetData = {
//   'Mercury': 'A very hot planet, closest to the sun',
//   'Venus': 'It\'s very cloudy here!',
//   'Earth': 'There is something very familiar about this planet',
//   'Mars': 'Known as the red planet',
//   'Jupiter': 'A gas giant, with a noticeable red spot.',
//   'Saturn': 'This planet has beautiful rings aroudn it.',
//   'Uranus': 'Strangely, this planet rotates aroudn on its side.',
//   'Neptune': 'A very cold planet, furthest from the sun',
//   'Pluto': 'I don\'t care what they say - it\'s a planet.'
// };
var systemName;
var jsonData;
var planetData;

Future<void> main(List<String> arguments) async {
  await serializeJsonData(arguments[0]);
  // Get json file
  // var jsonPath = arguments[0];

  // // Parse json file
  // var jsonData;
  // jsonData = await File(jsonPath).readAsString();

  // print('Name: ${jsonData['name']}');

  SpaceAdventure(
          planetarySystem:
              PlanetarySystem(name: systemName, planets: mockPlanets()))
      .start();
}

List<Planet> mockPlanets() {
  return planetData.entries.planets[0]
      .map((e) => Planet(name: e.name, description: e.description))
      .toList();
}

Future<void> serializeJsonData(String jsonPath) async {
  planetData = jsonDecode(await File(jsonPath).readAsString());
  systemName = planetData['name'];
}

// Serialize json file
// Future<<Map<String, dynamic>> serializeJson(String jsonPath) async {
//   String jsonString;
//   try {
//     jsonString = await File(jsonPath).readAsString();
//   } catch (e) {
//     jsonString = await File("../" + jsonPath).readAsString();
//   }
//   return json.decode(jsonString);
// }
// Future<String> getJson(String jsonPath) async {
//   return await File(jsonPath).readAsString();
// }

// Future<Map<String, dynamic>> serializeJson(String jsonPath) async {
//   return await jsonDecode(await getJson(jsonPath));
// }
