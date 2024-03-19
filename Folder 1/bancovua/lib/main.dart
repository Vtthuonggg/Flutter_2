import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: height / 8,
          backgroundColor: Colors.blue,
          title: const Text(
            "Chess",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(color: Colors.blueGrey),
            child: _chess(width)),
      ),
    );
  }

  Widget _chess(double width) {
    List<Widget> row = [];
    for (int i = 0; i < 8; i++) {
      List<Widget> col = [];
      for (int j = 0; j < 8; j++) {
        Color colors = (i + j) % 2 == 0 ? Colors.white : Colors.black;
        col.add(Container(
          width: (width * 4 / 5) / 8,
          height: (width * 4 / 5) / 8,
          color: colors,
        ));
      }
      row.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: col,
      ));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: row,
    );
  }
}
