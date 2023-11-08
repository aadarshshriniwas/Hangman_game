import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hangman_app/const/const.dart';
import 'package:hangman_app/game/figure_widget.dart';
import 'package:hangman_app/game/hidden_letter.dart';

class Myth extends StatefulWidget {
  const Myth({Key? key}) : super(key: key);

  @override
  State<Myth> createState() => _MythState();
}

class _MythState extends State<Myth> {
  var characters = "abcdefghijklmnopqrstuvwxyz".toUpperCase();
  var wordData = [
    {
      "word": "Krishna",
      "hint": "Eighth incarnation of Lord Vishnu, known for his flute"
    },
    {
      "word": "Shiva",
      "hint": "The destroyer in the Holy Trinity (Brahma, Vishnu, Shiva)"
    },
    {
      "word": "Ramayana",
      "hint": "Ancient epic narrating Lord Rama's life and adventures"
    },
    {"word": "Ganesha", "hint": "Elephant-headed deity, remover of obstacles"},
    {
      "word": "Mahabharata",
      "hint": "Epic story of the Kurukshetra War and dharma"
    },
    {
      "word": "Hanuman",
      "hint": "Devotee of Lord Rama, known for strength and devotion"
    },
    {"word": "Durga", "hint": "Goddess of power and the divine feminine"},
    {
      "word": "Vishnu",
      "hint": "Preserver in the Holy Trinity, sustainer of the universe"
    },
    {"word": "Lakshmi", "hint": "Goddess of wealth, fortune, and prosperity"},
    {
      "word": "Bhagavad Gita",
      "hint": "Sacred scripture of Lord Krishna's teachings to Arjuna"
    },
    {
      "word": "Brahma",
      "hint": "Creator in the Holy Trinity, the source of the universe"
    },
    {"word": "Saraswati", "hint": "Goddess of knowledge, music, and art"},
    {
      "word": "Krishna",
      "hint": "Eighth incarnation of Lord Vishnu, known for his flute"
    },
    {
      "word": "Shiva",
      "hint": "The destroyer in the Holy Trinity (Brahma, Vishnu, Shiva)"
    },
    {
      "word": "Ramayana",
      "hint": "Ancient epic narrating Lord Rama's life and adventures"
    },
    {"word": "Ganesha", "hint": "Elephant-headed deity, remover of obstacles"},
    {
      "word": "Mahabharata",
      "hint": "Epic story of the Kurukshetra War and dharma"
    },
    {
      "word": "Hanuman",
      "hint": "Devotee of Lord Rama, known for strength and devotion"
    },
    {"word": "Durga", "hint": "Goddess of power and the divine feminine"},
    {
      "word": "Vishnu",
      "hint": "Preserver in the Holy Trinity, sustainer of the universe"
    },
    {"word": "Lakshmi", "hint": "Goddess of wealth, fortune, and prosperity"},
    {
      "word": "Bhagavad Gita",
      "hint": "Sacred scripture of Lord Krishna's teachings to Arjuna"
    },
    {
      "word": "Brahma",
      "hint": "Creator in the Holy Trinity, the source of the universe"
    },
    {"word": "Saraswati", "hint": "Goddess of knowledge, music, and art"},
    {"word": "Kali", "hint": "Goddess of time, destruction, and empowerment"},
    {"word": "Ravana", "hint": "Demon king and antagonist in the Ramayana"},
    {
      "word": "Parvati",
      "hint": "Goddess, wife of Shiva, and mother of Ganesha"
    },
    {"word": "Indra", "hint": "King of the gods, ruler of the heavens"},
    {"word": "Garuda", "hint": "Eagle-like mount of Lord Vishnu"},
    {
      "word": "Krishna",
      "hint": "Eighth incarnation of Lord Vishnu, known for his flute"
    },
    {
      "word": "Shiva",
      "hint": "The destroyer in the Holy Trinity (Brahma, Vishnu, Shiva)"
    },
    {
      "word": "Ramayana",
      "hint": "Ancient epic narrating Lord Rama's life and adventures"
    },
    {"word": "Ganesha", "hint": "Elephant-headed deity, remover of obstacles"},
    {
      "word": "Mahabharata",
      "hint": "Epic story of the Kurukshetra War and dharma"
    },
    {
      "word": "Hanuman",
      "hint": "Devotee of Lord Rama, known for strength and devotion"
    },
    {"word": "Durga", "hint": "Goddess of power and the divine feminine"},
    {
      "word": "Vishnu",
      "hint": "Preserver in the Holy Trinity, sustainer of the universe"
    },
    {"word": "Lakshmi", "hint": "Goddess of wealth, fortune, and prosperity"},
    {
      "word": "Bhagavad Gita",
      "hint": "Sacred scripture of Lord Krishna's teachings to Arjuna"
    },
    {
      "word": "Brahma",
      "hint": "Creator in the Holy Trinity, the source of the universe"
    },
    {"word": "Saraswati", "hint": "Goddess of knowledge, music, and art"},
    {"word": "Kali", "hint": "Goddess of time, destruction, and empowerment"},
    {"word": "Ravana", "hint": "Demon king and antagonist in the Ramayana"},
    {
      "word": "Parvati",
      "hint": "Goddess, wife of Shiva, and mother of Ganesha"
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
