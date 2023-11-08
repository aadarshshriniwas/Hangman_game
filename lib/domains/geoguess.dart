import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hangman_app/const/const.dart';
import 'package:hangman_app/game/figure_widget.dart';
import 'package:hangman_app/game/hidden_letter.dart';

class Geoguess extends StatefulWidget {
  const Geoguess({Key? key}) : super(key: key);

  @override
  State<Geoguess> createState() => _GeoguessState();
}

class _GeoguessState extends State<Geoguess> {
  var characters = "abcdefghijklmnopqrstuvwxyz".toUpperCase();
  var wordData = [
    {"word": "Mountain", "hint": "Tall landform with steep sides"},
    {"word": "River", "hint": "Natural water flow towards an ocean or lake"},
    {"word": "Desert", "hint": "Arid region with little rainfall"},
    {"word": "Forest", "hint": "Large area covered with trees"},
    {"word": "Island", "hint": "Land surrounded by water on all sides"},
    {"word": "Peninsula", "hint": "Landmass with water on three sides"},
    {"word": "Canyon", "hint": "Deep and narrow valley with steep sides"},
    {"word": "Glacier", "hint": "Slow-moving mass of ice"},
    {
      "word": "Volcano",
      "hint": "Mountain that erupts hot lava, ash, and gases"
    },
    {"word": "Oasis", "hint": "Fertile area in a desert with water"},
    {"word": "Tundra", "hint": "Cold and treeless biome"},
    {"word": "Archipelago", "hint": "Group of islands"},
    {"word": "Rainforest", "hint": "Lush forest with high rainfall"},
    {"word": "Savanna", "hint": "Grassy plain with few trees"},
    {"word": "India", "hint": "South Asian country known for its rich culture"},
    {
      "word": "UnitedStates",
      "hint": "North American country with diverse landscapes"
    },
    {
      "word": "France",
      "hint": "European country famous for its cuisine and art"
    },
    {
      "word": "Japan",
      "hint": "Asian country known for its technological innovations"
    },
    {
      "word": "Brazil",
      "hint": "South American country with the Amazon Rainforest"
    },
    {
      "word": "Australia",
      "hint": "Country with unique wildlife and the Outback"
    },
    {
      "word": "Egypt",
      "hint": "North African country with ancient history and pyramids"
    },
    {
      "word": "Russia",
      "hint": "Largest country in the world spanning two continents"
    },
    {"word": "China", "hint": "Asian country with a rich history and culture"},
    {
      "word": "Italy",
      "hint": "European country famous for its art and cuisine"
    },
    {"word": "Spain", "hint": "European country known for its vibrant culture"},
    {
      "word": "Canada",
      "hint": "North American country with stunning natural landscapes"
    },
    {
      "word": "Greece",
      "hint": "European country with a rich history in philosophy"
    },
    {
      "word": "Mexico",
      "hint": "North American country known for its cuisine and festivals"
    },
    {
      "word": "Thailand",
      "hint": "Southeast Asian country with beautiful beaches"
    },
    {
      "word": "SouthAfrica",
      "hint": "African country with diverse wildlife and landscapes"
    },
    {"word": "UnitedKingdom", "hint": "European country with a rich history"},
    {
      "word": "NewZealand",
      "hint": "Country with stunning landscapes and Maori culture"
    },
    {
      "word": "Argentina",
      "hint": "South American country known for tango and steaks"
    },
    {
      "word": "Switzerland",
      "hint": "European country with the Alps and chocolate"
    },
    {"word": "IndiaGate", "hint": "War memorial in New Delhi, India"},
    {"word": "EiffelTower", "hint": "Iconic tower in Paris, France"},
    {"word": "TajMahal", "hint": "Iconic mausoleum in Agra, India"},
    {"word": "Pyramids", "hint": "Ancient Egyptian monuments"},
    {"word": "GrandCanyon", "hint": "Iconic canyon in the United States"},
    {"word": "Santorini", "hint": "Greek island known for its stunning views"},
    {"word": "Petra", "hint": "Ancient city in Jordan"},
    {"word": "Mumbai", "hint": "Financial capital of India"},
    {"word": "NewYork", "hint": "Major city in the United States"},
    {"word": "Venice", "hint": "Italian city known for its canals"},
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
