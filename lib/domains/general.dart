import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hangman_app/const/const.dart';
import 'package:hangman_app/game/figure_widget.dart';
import 'package:hangman_app/game/hidden_letter.dart';

class General extends StatefulWidget {
  const General({Key? key}) : super(key: key);

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  var characters = "abcdefghijklmnopqrstuvwxyz".toUpperCase();
  var wordData = [
    {"word": "AbrahamLincoln", "hint": "16th President of the United States"},
    {
      "word": "India",
      "hint": "A South Asian country known for its diverse culture"
    },
    {
      "word": "California",
      "hint": "A U.S. state on the West Coast with a diverse landscape"
    },
    {
      "word": "Democracy",
      "hint":
          "A system of government where citizens have a say in decision-making"
    },
    {"word": "Brazil", "hint": "The largest country in South America"},
    {
      "word": "Gandhi",
      "hint": "A prominent Indian leader in the Indian independence movement"
    },
    {"word": "Russia", "hint": "The largest country in the world by land area"},
    {
      "word": "NewYork",
      "hint":
          "A state in the northeastern United States known for its vibrant city"
    },
    {
      "word": "Parliament",
      "hint": "The supreme legislative body in some countries"
    },
    {"word": "China", "hint": "The most populous country in the world"},
    {"word": "Texas", "hint": "A large state in the southern United States"},
    {
      "word": "Constitution",
      "hint": "A set of fundamental principles or established precedents"
    },
    {
      "word": "France",
      "hint": "A European country known for its art, culture, and cuisine"
    },
    {
      "word": "Election",
      "hint":
          "A process where people choose their representatives in government"
    },
    {
      "word": "UnitedKingdom",
      "hint": "A country in Europe comprising four nations"
    },
    {"word": "Mexico", "hint": "A North American country with a rich history"},
    {
      "word": "Economy",
      "hint": "The wealth and resources of a region or country"
    },
    {
      "word": "Germany",
      "hint": "A European country known for its engineering and innovation"
    },
    {
      "word": "President",
      "hint": "The head of state or the highest office in some countries"
    },
    {
      "word": "Canada",
      "hint": "A North American country known for its natural beauty"
    },
    {
      "word": "Governor",
      "hint": "The leader of a state or territory in some countries"
    },
    {
      "word": "Australia",
      "hint": "A country known for its unique wildlife and landscapes"
    },
    {
      "word": "PrimeMinister",
      "hint": "The head of government in some countries"
    },
    {
      "word": "Japan",
      "hint": "An East Asian country with a rich cultural heritage"
    },
    {"word": "Legislation", "hint": "The process of making or enacting laws"},
    {
      "word": "SouthAfrica",
      "hint": "A country with diverse landscapes and cultures in Africa"
    },
    {
      "word": "Ambassador",
      "hint": "A diplomatic representative of one country to another"
    },
    {
      "word": "Geopolitics",
      "hint": "The study of the influence of geography on political events"
    },
    {"word": "Antarctica", "hint": "The southernmost continent on Earth"},
    {
      "word": "Revolution",
      "hint": "A fundamental and sudden change in government or society"
    },
    {
      "word": "Himalayas",
      "hint": "A mountain range in Asia, home to Mount Everest"
    },
    {
      "word": "Demography",
      "hint": "The statistical study of human populations"
    },
    {
      "word": "Nigeria",
      "hint": "A West African country with a diverse culture"
    },
    {
      "word": "Monarchy",
      "hint":
          "A form of government with a hereditary ruler, such as a king or queen"
    },
    {
      "word": "Veto",
      "hint": "The power of a president or leader to reject a proposed law"
    },
    {
      "word": "Diplomacy",
      "hint":
          "Negotiations and relations between countries to achieve diplomatic goals"
    },

    // Countries and Capitals
    {
      "word": "Spain",
      "hint": "A European country known for its rich history and culture"
    },
    {"word": "Madrid", "hint": "The capital city of Spain"},
    {
      "word": "Egypt",
      "hint": "A country in North Africa with a famous ancient history"
    },
    {"word": "Cairo", "hint": "The capital city of Egypt"},
    {
      "word": "Argentina",
      "hint": "A South American country known for tango and soccer"
    },
    {"word": "Buenos Aires", "hint": "The capital city of Argentina"},

    // State Names
    {
      "word": "Florida",
      "hint": "A southeastern U.S. state with a tropical climate"
    },
    {
      "word": "Alaska",
      "hint": "The northernmost U.S. state known for its wilderness"
    },
    {
      "word": "Karnataka",
      "hint": "A state in southern India known for its IT industry"
    },
    {"word": "Bodhgaya", "hint": "A city where Buddha got enlightment"},
    {
      "word": "Bihar",
      "hint":
          "A state famous for its rich culture and knowledge from past times"
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
