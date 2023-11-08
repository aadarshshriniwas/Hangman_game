import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hangman_app/const/const.dart';
import 'package:hangman_app/game/figure_widget.dart';
import 'package:hangman_app/game/hidden_letter.dart';

class Sports extends StatefulWidget {
  const Sports({Key? key}) : super(key: key);

  @override
  State<Sports> createState() => _SportsState();
}

class _SportsState extends State<Sports> {
  var characters = "abcdefghijklmnopqrstuvwxyz".toUpperCase();
  var wordData = [
    {
      "word": "Soccer",
      "hint": "The world's most popular sport played with a round ball"
    },
    {
      "word": "Basketball",
      "hint": "A fast-paced game played with a ball and a hoop"
    },
    {"word": "Tennis", "hint": "A racquet sport played on a rectangular court"},
    {
      "word": "Cricket",
      "hint": "A bat-and-ball game popular in many countries"
    },
    {"word": "Baseball", "hint": "An American bat-and-ball sport"},
    {"word": "Golf", "hint": "A precision club-and-ball sport"},
    {
      "word": "Swimming",
      "hint": "Moving through water using one's arms and legs"
    },
    {
      "word": "Athletics",
      "hint": "Track and field sports like running and jumping"
    },
    {"word": "Rugby", "hint": "A rough contact sport with an oval ball"},
    {"word": "Boxing", "hint": "A combat sport involving punching and defense"},
    {"word": "Hockey", "hint": "A team sport played on ice or grass"},
    {"word": "Cycling", "hint": "Riding bicycles in competitive races"},
    {"word": "Wrestling", "hint": "Physical combat between two opponents"},
    {"word": "MartialArts", "hint": "Various combat practices and disciplines"},
    {"word": "Badminton", "hint": "A racquet sport played indoors"},
    {"word": "Volleyball", "hint": "A team sport with a net and ball"},
    {
      "word": "TableTennis",
      "hint": "A fast-paced indoor sport also known as ping pong"
    },
    {
      "word": "Gymnastics",
      "hint":
          "Athletic performances involving strength, flexibility, and balance"
    },
    {"word": "Archery", "hint": "Using a bow to shoot arrows at a target"},
    {"word": "Skiing", "hint": "Moving over snow on skis"},
    {"word": "IceSkating", "hint": "Gliding on ice with special shoes"},
    {"word": "Rowing", "hint": "Moving a boat with oars"},
    {"word": "Sailing", "hint": "Traveling on water using sails"},
    {"word": "Surfing", "hint": "Riding ocean waves on a surfboard"},
    {
      "word": "Snowboarding",
      "hint": "Sliding down snow-covered slopes on a board"
    },
    {
      "word": "FigureSkating",
      "hint": "Graceful ice skating with spins and jumps"
    },
    {"word": "Judo", "hint": "A Japanese martial art and Olympic sport"},
    {"word": "Weightlifting", "hint": "Competitive lifting of heavy weights"},
    {"word": "Karate", "hint": "A martial art that originated in Okinawa"},
    {
      "word": "Taekwondo",
      "hint": "A Korean martial art known for high, fast kicks"
    },
    {"word": "Polo", "hint": "A team sport played on horseback"},
    {
      "word": "SachinTendulkar",
      "hint": "One of the greatest cricketers in the history of the sport"
    },
    {
      "word": "ViratKohli",
      "hint": "Current captain of the Indian cricket team"
    },
    {
      "word": "Dhoni",
      "hint":
          "Former captain of the Indian cricket team and a legendary wicketkeeper-batsman"
    },
    {
      "word": "PVSindhu",
      "hint": "Indian badminton player and Olympic silver medalist"
    },
    {
      "word": "LeanderPaes",
      "hint": "Indian tennis player and Olympic medalist"
    },
    {"word": "MaryKom", "hint": "Indian boxer and Olympic bronze medalist"},
    {
      "word": "AbhinavBindra",
      "hint": "Indian shooter and Olympic gold medalist"
    },
    {
      "word": "SainaNehwal",
      "hint": "Indian badminton player and Olympic bronze medalist"
    },
    {
      "word": "DipaKarmakar",
      "hint": "Indian gymnast known for her Produnova vault"
    },
    {
      "word": "NeerajChopra",
      "hint": "Indian javelin thrower and Olympic gold medalist"
    },
    {"word": "SushilKumar", "hint": "Indian wrestler and Olympic medalist"},
    {"word": "MCMary Kom", "hint": "Indian boxer and Olympic medalist"},
    {"word": "ViswanathanAnand", "hint": "Indian chess grandmaster"},
    {
      "word": "MilkhaSingh",
      "hint": "Indian sprinter known as the 'Flying Sikh'"
    },
    {
      "word": "SakshiMalik",
      "hint": "Indian wrestler and Olympic bronze medalist"
    },
    {
      "word": "DhanrajPillay",
      "hint": "Indian field hockey player and former captain"
    },
    {
      "word": "SardarSingh",
      "hint": "Indian field hockey player and former captain"
    },
    {"word": "HimaDas", "hint": "Indian sprinter known as the 'Dhing Express'"},
    {"word": "AnjuBobbyGeorge", "hint": "Indian long jump athlete"},
    {
      "word": "BhaichungBhutia",
      "hint": "Former Indian football captain and striker"
    },
    {
      "word": "PTUsha",
      "hint": "Indian track and field athlete known as the 'Payyoli Express'"
    },
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
