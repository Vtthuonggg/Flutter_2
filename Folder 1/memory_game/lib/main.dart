import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Memory Game', home: MemoryGame());
  }
}

class MemoryGame extends StatefulWidget {
  const MemoryGame({super.key});

  @override
  State<MemoryGame> createState() => _MemoryGameState();
}

class _MemoryGameState extends State<MemoryGame> {
  final List<String> items = [
    "🍎",
    "🍌",
    "🥭",
    "🍉",
    "🍇",
    "🍓",
    "🍒",
    "🍍",
  ];
  List<String> shuffledIteam = [];
  List<int> selectedIteamIndex = [];
  List<bool> iteamVisibility = [];
  bool isProcessing = false;
  int move = 0;

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    setState(() {
      shuffledIteam = List.from(items)..addAll(items);
      shuffledIteam.shuffle();
      iteamVisibility = List.filled(shuffledIteam.length, false);
      selectedIteamIndex = [];
      move = 0;
    });
  }

  void onItemClicked(int index) {
    if (!isProcessing && iteamVisibility[index]) {
      setState(() {
        if (selectedIteamIndex.length < 2) {
          selectedIteamIndex.add(index);
        }
        if (selectedIteamIndex.length == 2) {
          isProcessing = true;
          Timer(Duration(milliseconds: 700), () {
            handleSelectedItems();
            isProcessing = false;
          });
        }
      });
    }
  }

  void handleSelectedItems() {
    if (shuffledIteam[selectedIteamIndex[0]] !=
        shuffledIteam[selectedIteamIndex[1]]) {
      setState(() {
        iteamVisibility[selectedIteamIndex[0]] = true;
        iteamVisibility[selectedIteamIndex[1]] = true;
        selectedIteamIndex.clear();
      });
    } else {
      setState(() {
        iteamVisibility[selectedIteamIndex[0]] = false;
        iteamVisibility[selectedIteamIndex[1]] = false;
        selectedIteamIndex.clear();
      });
    }
    incrementMoves();
  }

  void incrementMoves() {
    setState(() {
      move++;
      if (iteamVisibility.every((isVisible) => !isVisible)) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Congratulations!"),
                content: Text("You won in $move moves!"),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        startGame();
                      },
                      child: Text('Play Again'))
                ],
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Memory Game"),
      ),
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: shuffledIteam.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                onItemClicked(index);
              },
              child: Container(
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: iteamVisibility[index]
                        ? Colors.lightBlue
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    iteamVisibility[index] ? shuffledIteam[index] : ' ',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
