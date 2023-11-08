import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hangman_app/const/const.dart';
import 'package:hangman_app/game/figure_widget.dart';
import 'package:hangman_app/game/hidden_letter.dart';

class Literature extends StatefulWidget {
  const Literature({Key? key}) : super(key: key);

  @override
  State<Literature> createState() => _LiteratureState();
}

class _LiteratureState extends State<Literature> {
  var characters = "abcdefghijklmnopqrstuvwxyz".toUpperCase();
  var wordData = [
    {"word": "Mythology", "hint": "Traditional stories of gods and heroes"},
    {"word": "Fiction", "hint": "Imaginative and invented narrative"},
    {"word": "Nonfiction", "hint": "True and factual writing"},
    {"word": "Symbol", "hint": "Object representing something else"},
    {"word": "Epic", "hint": "Long narrative poem about heroic deeds"},
    {"word": "Haiku", "hint": "Japanese poem with 3 lines and 17 syllables"},
    {
      "word": "Character Development",
      "hint": "Change in character traits over a story"
    },
    {
      "word": "Literary Device",
      "hint": "Technique used by writers to create effects"
    },
    {"word": "Diction", "hint": "Author's choice of words in writing"},
    {
      "word": "Foreshadowing",
      "hint": "Hint of what will happen later in a story"
    },
    {"word": "ToKillaMockingbird", "hint": "Harper Lee's classic novel"},
    {"word": "PrideandPrejudice", "hint": "Jane Austen's famous work"},
    {"word": "1984", "hint": "George Orwell's dystopian novel"},
    {"word": "TheGreatGatsby", "hint": "F. Scott Fitzgerald's masterpiece"},
    {"word": "Rabindranath", "hint": "Nobel laureate known for 'Gitanjali'"},
    {
      "word": "AmitavGhosh",
      "hint": "Author of 'The Glass Palace' and 'Sea of Poppies'"
    },
    {
      "word": "ArundhatiRoy",
      "hint": "Won the Booker Prize for 'The God of Small Things'"
    },
    {
      "word": "KamalaDas",
      "hint": "Famous for her poetry and autobiography 'My Story'"
    },
    {
      "word": "SalmanRushdie",
      "hint": "Author of 'Midnight's Children' and 'The Satanic Verses'"
    },
    {
      "word": "DurjoyDatta",
      "hint": "Popular contemporary Indian author of romantic fiction"
    },
    {
      "word": "AnitaDesai",
      "hint":
          "Known for novels like 'The Village by the Sea' and 'Clear Light of Day'"
    },
    {
      "word": "ArunShourie",
      "hint": "Author of 'The World of Fatwas' and 'Eminent Historians'"
    },
    {
      "word": "VikramChandra",
      "hint": "Wrote 'Red Earth and Pouring Rain' and 'Sacred Games'"
    },
    {
      "word": "SudhaMurthy",
      "hint":
          "Famous for her philanthropic work and books like 'Wise and Otherwise'"
    },
    {
      "word": "DevduttPattanaik",
      "hint": "Author of books on Indian mythology and folklore"
    },
    {
      "word": "JhumpaLahiri",
      "hint": "Pulitzer Prize-winning author of 'Interpreter of Maladies'"
    },
    {
      "word": "Shashitharoor",
      "hint": "Author of 'The Great Indian Novel' and 'Inglorious Empire'"
    },
    {
      "word": "AnujaChauhan",
      "hint":
          "Known for contemporary Indian rom-com novels like 'The Zoya Factor'"
    },
    {
      "word": "ManjuKapur",
      "hint": "Author of 'Difficult Daughters' and 'The Immigrant'"
    },
    {
      "word": "DilipKumar",
      "hint": "Famous actor's autobiography 'The Substance and the Shadow'"
    },
    {
      "word": "AnandNeelakantan",
      "hint": "Known for retelling Indian mythology from different perspectives"
    },
    {
      "word": "SavitriPhule",
      "hint": "Famous Indian social reformer and author of 'Slavery'"
    },
    {
      "word": "VikramSeth",
      "hint": "Wrote 'A Suitable Boy' and 'The Golden Gate'"
    },
    {
      "word": "ChitraBanerjee Divakaruni",
      "hint": "Known for 'The Palace of Illusions'"
    },
    {
      "word": "RuskinBond",
      "hint": "Famous for his books on the Himalayas and childhood memories"
    },
    {
      "word": "RkLaxman",
      "hint": "Cartoonist and author of 'The Common Man and the Uncommon World'"
    },
    {
      "word": "TwinkleKhanna",
      "hint": "Author of humorous books like 'Mrs Funnybones'"
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
