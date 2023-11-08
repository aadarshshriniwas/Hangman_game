import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hangman_app/const/const.dart';
import 'package:hangman_app/game/figure_widget.dart';
import 'package:hangman_app/game/hidden_letter.dart';

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  var characters = "abcdefghijklmnopqrstuvwxyz".toUpperCase();
  var wordData = [
    {"word": "Bollywood", "hint": "Hindi-language film industry in India"},
    {"word": "Hollywood", "hint": "Famous film industry in the United States"},
    {"word": "Bollywood", "hint": "Hindi-language film industry in India"},
    {"word": "Hollywood", "hint": "Famous film industry in the United States"},
    {"word": "Lagaan", "hint": "Aamir Khan-starrer, nominated for an Oscar"},
    {
      "word": "TheDarkKnight",
      "hint": "Sequel to 'Batman Begins' with Heath Ledger's Joker"
    },
    {
      "word": "DDLJ",
      "hint": "Iconic Hindi movie 'Dilwale Dulhania Le Jayenge'"
    },
    {"word": "TheGodfather", "hint": "Classic mafia film with Marlon Brando"},
    {"word": "Sholay", "hint": "Legendary Hindi film featuring Gabbar Singh"},
    {"word": "Forrest Gump", "hint": "Tom Hanks in a heartwarming tale"},
    {"word": "Gangs of Wasseypur", "hint": "Anurag Kashyap's crime epic"},
    {
      "word": "Inception",
      "hint": "Mindbending sci-fi thriller by Christopher Nolan"
    },
    {"word": "Baahubali", "hint": "Indian epic fantasy film series"},
    {"word": "Avengers", "hint": "Marvel superhero team-up movies"},
    {"word": "KabirSingh", "hint": "Bollywood drama starring Shahid Kapoor"},
    {"word": "StarWars", "hint": "Epic space opera franchise"},
    {"word": "DilChahtaHai", "hint": "Coming-of-age Hindi film"},
    {"word": "JurassicPark", "hint": "Dinosaur adventure by Steven Spielberg"},
    {
      "word": "ZindagiNaMilegiDobara",
      "hint": "Bollywood film about friendship and adventure"
    },
    {
      "word": "Titanic",
      "hint": "Romantic drama with Leonardo DiCaprio and Kate Winslet"
    },
    {"word": "KuchKuchHotaHai", "hint": "Popular Hindi film by Karan Johar"},
    {"word": "TheMatrix", "hint": "Sci-fi action with Keanu Reeves as Neo"},
    {"word": "Baazigar", "hint": "Bollywood thriller starring Shah Rukh Khan"},
    {"word": "Interstellar", "hint": "Space exploration by Christopher Nolan"},
    {"word": "Dabangg", "hint": "Salman Khan in a cop action film"},
    {"word": "PulpFiction", "hint": "Quentin Tarantino's cult classic"},
    {"word": "ChennaiExpress", "hint": "Bollywood comedy with Shah Rukh Khan"},
    {
      "word": "TheShawshankRedemption",
      "hint": "Prison drama based on Stephen King's novella"
    },
    {"word": "KabhiKhushiKabhieGham", "hint": "Family drama and Bollywood hit"},
    {"word": "TheAvengers", "hint": "Marvel's superhero ensemble"},
    {
      "word": "ThePursuitofHappyness",
      "hint": "Inspirational drama with Will Smith"
    },
    {"word": "RangDeBasanti", "hint": "Indian film about youth activism"},
    {"word": "BlackPanther", "hint": "Marvel's African superhero"},
    {"word": "Andhadhun", "hint": "Sriram Raghavan's thriller"},
    {"word": "Baahubali", "hint": "Indian epic fantasy film series"},
    {"word": "BreakingBad", "hint": "Critically acclaimed American TV series"},
    {"word": "GameofThrones", "hint": "Epic fantasy TV series based on novels"},
    {"word": "SacredGames", "hint": "Indian crime thriller web series"},
    {"word": "StrangerThings", "hint": "Sci-fi horror series on Netflix"},
    {"word": "Mirzapur", "hint": "Action-packed web series in India"},
    {"word": "Friends", "hint": "Beloved American sitcom"},
    {"word": "MoneyHeist", "hint": "Spanish heist crime drama on Netflix"},
    {"word": "TheCrown", "hint": "Historical drama about the British monarchy"},
    {"word": "BigBangTheory", "hint": "Popular sitcom about physicists"},
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
