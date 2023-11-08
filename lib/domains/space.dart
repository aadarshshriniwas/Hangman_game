import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hangman_app/const/const.dart';
import 'package:hangman_app/game/figure_widget.dart';
import 'package:hangman_app/game/hidden_letter.dart';

class Space extends StatefulWidget {
  const Space({Key? key}) : super(key: key);

  @override
  State<Space> createState() => _SpaceState();
}

class _SpaceState extends State<Space> {
  var characters = "abcdefghijklmnopqrstuvwxyz".toUpperCase();
  var wordData = [
    {
      "word": "Astronomy",
      "hint": "Study of celestial objects and the universe"
    },
    {"word": "Galaxy", "hint": "Vast system of stars, gas, and dust"},
    {"word": "Asteroid", "hint": "Small rocky object in space"},
    {"word": "Comet", "hint": "Icy celestial object with a tail"},
    {"word": "Meteor", "hint": "Small space rock entering Earth's atmosphere"},
    {"word": "Telescope", "hint": "Instrument for observing distant objects"},
    {"word": "BlackHole", "hint": "Region with strong gravitational pull"},
    {"word": "Constellation", "hint": "Pattern of stars in the sky"},
    {"word": "SpaceShuttle", "hint": "Reusable spacecraft used by NASA"},
    {"word": "Exoplanet", "hint": "Planet outside our solar system"},
    {"word": "Nebula", "hint": "Giant cloud of gas and dust in space"},
    {
      "word": "SpaceStation",
      "hint": "Orbital facility for scientific research"
    },
    {"word": "Astrobiology", "hint": "Study of life in the universe"},
    {"word": "Hubble", "hint": "Space telescope for deep-space observation"},
    {"word": "Spacewalk", "hint": "Astronaut activity outside a spacecraft"},
    {
      "word": "Gravity",
      "hint": "Force that attracts objects toward each other"
    },
    {"word": "Orbit", "hint": "Path of an object around another in space"},
    {
      "word": "Satellite",
      "hint": "Man-made object in orbit for various purposes"
    },
    {"word": "Astronaut", "hint": "Trained space traveler"},
    {"word": "Rocket", "hint": "Vehicle for space travel"},
    {"word": "SolarSystem", "hint": "Sun and its celestial objects"},
    {
      "word": "Extraterrestrial",
      "hint": "Originating or existing outside Earth"
    },
    {
      "word": "Spacecraft",
      "hint": "Manned or unmanned vehicle for space travel"
    },
    {"word": "Alien", "hint": "Being from another planet"},
    {"word": "Interstellar", "hint": "Occurring or situated between stars"},
    {"word": "Lunar", "hint": "Related to the Moon"},
  ];
  final _random = Random();
  late var wordDataIndex;
  List<String> selectedChar = [];
  var tries = 0;
  late String word; // Removed null safety from 'word' variable
  late String hint; // Removed null safety from 'hint' variable
  void loadNewWord() {
    setState(() {
      wordDataIndex = _random.nextInt(wordData.length);
      word = wordData[wordDataIndex]["word"]!.toUpperCase();
      hint = wordData[wordDataIndex]["hint"]!;
      selectedChar.clear();
      tries = 0;
    });
  }

  void checkWinCondition() {
    if (selectedChar.toSet().containsAll(word.split('').toSet())) {
      // User has successfully guessed the whole word
      loadNewWord();
    } else if (tries >= 7) {
      // User has reached 6 tries
      loadNewWord();
    }
  }

  final GlobalKey buttonKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    wordDataIndex = _random.nextInt(wordData.length);
    word = wordData[wordDataIndex]["word"]?.toUpperCase() ?? "";

    hint = wordData[wordDataIndex]["hint"]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Hangman: The Game"),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      figure(GameUI.hang, tries >= 0),
                      figure(GameUI.head, tries >= 1),
                      figure(GameUI.body, tries >= 2),
                      figure(GameUI.leftArm, tries >= 3),
                      figure(GameUI.rightArm, tries >= 4),
                      figure(GameUI.leftleg, tries >= 5),
                      figure(GameUI.rightleg, tries >= 6),
                    ],
                  ),
                ),
                ElevatedButton(
                  key: buttonKey,
                  onPressed:
                      loadNewWord, // Call the function to load a new word
                  child: Text(
                    "New word",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            hint,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: word
                                .split("")
                                .map(
                                  (e) => hiddenLetter(
                                    e,
                                    selectedChar.contains(e.toUpperCase()),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                crossAxisCount: 7,
                children: characters
                    .split("")
                    .map(
                      (e) => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.bgColor,
                        ),
                        onPressed: selectedChar.contains(e.toUpperCase())
                            ? null
                            : () {
                                setState(() {
                                  selectedChar.add(e.toUpperCase());
                                  if (!word
                                      .split("")
                                      .contains(e.toUpperCase())) {
                                    tries++;
                                  }
                                  checkWinCondition();
                                });
                              },
                        child: Text(
                          e,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
