import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hangman_app/const/const.dart';
import 'package:hangman_app/game/figure_widget.dart';
import 'package:hangman_app/game/hidden_letter.dart';

class Science extends StatefulWidget {
  const Science({Key? key}) : super(key: key);

  @override
  State<Science> createState() => _ScienceState();
}

class _ScienceState extends State<Science> {
  var characters = "abcdefghijklmnopqrstuvwxyz".toUpperCase();
  var wordData = [
    {
      "word": "Biology",
      "hint": "The study of living organisms and their interactions"
    },
    {"word": "Chemistry", "hint": "The science of matter and its properties"},
    {
      "word": "Physics",
      "hint":
          "The study of energy, motion, and the fundamental forces of the universe"
    },
    {
      "word": "Astronomy",
      "hint": "The study of celestial objects and the universe"
    },
    {
      "word": "Geology",
      "hint": "The science of the Earth's structure and processes"
    },
    {
      "word": "ChemicalReaction",
      "hint": "The process of atoms and molecules rearranging"
    },
    {"word": "Genetics", "hint": "The study of heredity and DNA"},
    {
      "word": "Element",
      "hint": "A substance composed of a single type of atom"
    },
    {"word": "Evolution", "hint": "The process of biological change over time"},
    {"word": "PeriodicTable", "hint": "A chart of chemical elements"},
    {"word": "Cell", "hint": "The basic unit of life"},
    {"word": "Botany", "hint": "The study of plants"},
    {"word": "Zoology", "hint": "The study of animals"},
    {
      "word": "Microbiology",
      "hint": "The study of microorganisms like bacteria and viruses"
    },
    {"word": "Chemical Bond", "hint": "The force that holds atoms together"},
    {"word": "Fossil", "hint": "The preserved remains of ancient organisms"},
    {
      "word": "NewtonsLaws",
      "hint": "Three fundamental laws of motion by Sir Isaac Newton"
    },
    {
      "word": "Theories",
      "hint": "Scientific explanations supported by evidence"
    },
    {
      "word": "Einstein",
      "hint": "Albert Einstein, known for the theory of relativity"
    },
    {"word": "DNA", "hint": "Genetic material found in all living organisms"},
    {"word": "RNA", "hint": "Plays a crucial role in protein synthesis"},
    {
      "word": "ChemicalEquation",
      "hint": "A symbolic representation of a chemical reaction"
    },
    {"word": "Energy", "hint": "The capacity to do work"},
    {
      "word": "Solarsystem",
      "hint": "Our sun and the celestial objects that orbit it"
    },
    {"word": "Hypothesis", "hint": "A testable prediction or explanation"},
    {
      "word": "PeriodicTable",
      "hint": "Arrangement of elements by atomic number"
    },
    {
      "word": "Genome",
      "hint": "The complete set of an organism's genetic material"
    },
    {
      "word": "ChemicalElement",
      "hint": "A substance that cannot be broken down"
    },
    {
      "word": "Ecosystem",
      "hint": "A community of living organisms and their environment"
    },
    {
      "word": "Ecology",
      "hint":
          "The study of the relationships between organisms and their environment"
    },
    {"word": "Atom", "hint": "The basic unit of matter"},
    {
      "word": "Conservation",
      "hint": "Preservation and protection of natural resources"
    },
    {"word": "Botany", "hint": "The scientific study of plants"},
    {
      "word": "Zoology",
      "hint": "The scientific study of animals and their behavior"
    },
    {
      "word": "Geology",
      "hint":
          "The science that deals with the Earth's structure and composition"
    },
    {
      "word": "ClimateChange",
      "hint":
          "Long-term alteration of Earth's temperature and typical weather patterns"
    },
    {
      "word": "Invention",
      "hint":
          "A new device, method, or process developed through study and experimentation"
    },
    {
      "word": "Astronomy",
      "hint": "The scientific study of celestial objects and the universe"
    },
    {
      "word": "NuclearPhysics",
      "hint": "The study of atomic nuclei and their interactions"
    },
    {
      "word": "Genetics",
      "hint":
          "The branch of biology that studies heredity and variation in organisms"
    },
    {
      "word": "Einstein",
      "hint": "Albert Einstein, known for his theory of relativity and E=mc²"
    },
    {
      "word": "Galaxy",
      "hint":
          "A vast system of stars, gas, dust, and dark matter held together by gravity"
    },
    {"word": "Molecule", "hint": "A group of atoms bonded together"},
    {
      "word": "Newton",
      "hint":
          "Sir Isaac Newton, known for his laws of motion and universal gravitation"
    },
    {
      "word": "Chemistry",
      "hint": "The study of matter and the changes it undergoes"
    },
    {
      "word": "Biology",
      "hint": "The scientific study of life and living organisms"
    },
    {
      "word": "Ecology",
      "hint":
          "The study of the relationships between living organisms and their environment"
    },
    {
      "word": "Botany",
      "hint": "The scientific study of plants and their growth"
    },
    {
      "word": "Zoology",
      "hint": "The scientific study of animals, their behavior, and physiology"
    },
    {
      "word": "Genetics",
      "hint": "The study of genes and heredity in living organisms"
    },
    {
      "word": "Microbiology",
      "hint": "The study of microorganisms like bacteria, viruses, and fungi"
    },
    {
      "word": "ChemicalReaction",
      "hint": "The process in which substances change into different substances"
    },
    {
      "word": "Electromagnetism",
      "hint":
          "The branch of physics that deals with the interaction between electricity and magnetism"
    },
    {
      "word": "SolarSystem",
      "hint":
          "The collection of celestial objects, including the sun and planets, that orbit the sun"
    },
    {
      "word": "Geology",
      "hint": "The study of the Earth's structure, composition, and processes"
    },
    {
      "word": "PlateTectonics",
      "hint":
          "The theory that explains the movement of Earth's lithospheric plates"
    },
    {
      "word": "Gravity",
      "hint": "The force that attracts two objects with mass toward each other"
    },
    {
      "word": "Thermodynamics",
      "hint": "The branch of physics that deals with heat, work, and energy"
    },
    {
      "word": "QuantumMechanics",
      "hint":
          "The branch of physics that describes the behavior of matter and energy on the smallest scales"
    },
    {
      "word": "ChemicalElement",
      "hint":
          "A substance that cannot be broken down into simpler substances by chemical reactions"
    },
    {
      "word": "NaturalSelection",
      "hint":
          "The process by which species evolve through differential survival and reproduction"
    },
    {
      "word": "Ecosystem",
      "hint":
          "A biological community of interacting organisms and their physical environment"
    },
    {
      "word": "Biotechnology",
      "hint":
          "The use of living organisms or biological systems for technological advancements"
    },
    {
      "word": "Genome",
      "hint": "The complete set of an organism's genetic material"
    },
    {
      "word": "NuclearFusion",
      "hint": "The process by which the sun and stars generate energy"
    },
    {
      "word": "Relativity",
      "hint":
          "Albert Einstein's theory describing gravity and the behavior of objects"
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
