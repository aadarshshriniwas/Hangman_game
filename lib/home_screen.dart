import 'package:flutter/material.dart';
import 'package:hangman_app/domains/general.dart';
import 'package:hangman_app/domains/geoguess.dart';
import 'package:hangman_app/domains/literature.dart';
import 'package:hangman_app/domains/movies.dart';
import 'package:hangman_app/domains/mythology.dart';
import 'package:hangman_app/domains/science.dart';
import 'package:hangman_app/domains/space.dart';
import 'package:hangman_app/domains/sports.dart';
import 'package:hangman_app/game_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Hangman: The Game"),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        // Replace 'YourOtherPage()' with the actual widget for your other page.
                        return Sports();
                      },
                    ));
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/sports.jpg'),
                          fit: BoxFit
                              .cover, // You can adjust the fit based on your requirements
                        ),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Sports",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        // Replace 'YourOtherPage()' with the actual widget for your other page.
                        return Space();
                      },
                    ));
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/space.jpg'),
                          fit: BoxFit
                              .cover, // You can adjust the fit based on your requirements
                        ),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Space",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        // Replace 'YourOtherPage()' with the actual widget for your other page.
                        return Science();
                      },
                    ));
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/science.jpg'),
                          fit: BoxFit
                              .cover, // You can adjust the fit based on your requirements
                        ),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Science",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        // Replace 'YourOtherPage()' with the actual widget for your other page.
                        return Movies();
                      },
                    ));
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/mov.jpg'),
                          fit: BoxFit
                              .cover, // You can adjust the fit based on your requirements
                        ),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Movies",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        // Replace 'YourOtherPage()' with the actual widget for your other page.
                        return Geoguess();
                      },
                    ));
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/geo.jpg'),
                          fit: BoxFit
                              .cover, // You can adjust the fit based on your requirements
                        ),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Geoguess",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        // Replace 'YourOtherPage()' with the actual widget for your other page.
                        return Literature();
                      },
                    ));
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/lit.jpg'),
                          fit: BoxFit
                              .cover, // You can adjust the fit based on your requirements
                        ),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Literature",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        // Replace 'YourOtherPage()' with the actual widget for your other page.
                        return Myth();
                      },
                    ));
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/myth.jpg'),
                          fit: BoxFit
                              .cover, // You can adjust the fit based on your requirements
                        ),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Mythology",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        // Replace 'YourOtherPage()' with the actual widget for your other page.
                        return General();
                      },
                    ));
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/gk.jpg'),
                          fit: BoxFit
                              .cover, // You can adjust the fit based on your requirements
                        ),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "General",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text("Made with ❤️ by Aadarsh"),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
