import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;
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
  final String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  late String word = "";
  late String hint = ""; // Provide a default value to prevent late initialization error
  List<String> selectedChar = [];
  int tries = 0;
  bool _isLoading = true;
  Future<void> loadNewWord() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http
          .get(Uri.parse('http://localhost:3000/get_word/science'))
          .timeout(Duration(seconds: 10));
      if (response.statusCode == 200) {
        final wordData = jsonDecode(response.body);
        final newWord = wordData["word"].toUpperCase();
        print('Fetched word: $newWord'); // Print the fetched word
        setState(() {
          word = newWord;
          hint = wordData["hint"] ?? ""; // Handle the case where hint is null
          selectedChar.clear();
          tries = 0;
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load word');
      }
    } catch (e) {
      // If there is an error, handle it appropriately
      setState(() {
        _isLoading = false;
      });
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to load word. Please try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                loadNewWord(); // Retry loading the word
              },
              child: Text('Retry'),
            ),
          ],
        ),
      );
      print(e);
    }
  }


  void checkWinCondition() {
    if (selectedChar.toSet().containsAll(word.split('').toSet())) {
      // User has successfully guessed the whole word
      loadNewWord();
    } else if (tries >= 7) {
      // User has reached the maximum number of tries
      loadNewWord();
    }
  }

  @override
  void initState() {
    super.initState();
    loadNewWord();
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
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
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
                  onPressed: loadNewWord,
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
                        if (!word.split("").contains(e.toUpperCase())) {
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