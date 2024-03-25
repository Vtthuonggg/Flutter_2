import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Theme.dart';
import "ThemeNotifier.dart";
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class Refresh extends StatefulWidget {
  const Refresh({Key? key});

  @override
  State<Refresh> createState() => _RefreshState();
}

class _RefreshState extends State<Refresh> {
  @override
  Widget build(BuildContext context) {
    return const ThemeWrapper(child: HomePage());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ThemeWrapper(
      child: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _refreshData() async {}

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Provider.of<ThemeNotifier>(context);

    final List<String> avaterImage = [
      'assets/image9.png',
      'assets/image10.png',
      'assets/image11.png',
      'assets/image12.png',
      'assets/image12.png',
      'assets/image12.png',
      'assets/image12.png',
      'assets/image12.png',
    ];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leadingWidth: width / 2,
            toolbarHeight: height / 13,
            leading: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: Image.asset("assets/logo1.png")),
                  IconButton(
                      onPressed: () {}, icon: Image.asset("assets/logo2.png"))
                ],
              ),
            ),
            actions: [
              Row(children: [
                IconButton(
                    onPressed: () {}, icon: Image.asset("assets/logo3.png")),
                IconButton(
                    onPressed: () {}, icon: Image.asset("assets/logo4.png")),
              ])
            ],
          ),
          body: RefreshIndicator(
            onRefresh: _refreshData,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  snap: true,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.only(bottom: 15, left: 10),
                    child: SizedBox(
                      height: height / 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Search here",
                                  prefixIcon: Image.asset('assets/logo5.png'),
                                  hintStyle: GoogleFonts.hind(),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(14),
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              width: height / 16,
                              height: height / 16,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(color: Colors.grey)),
                              child: IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/logo6.png'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  expandedHeight: 70,
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Row(children: [
                        Container(
                          alignment: Alignment.bottomRight,
                          width: width,
                          height: height / 4,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(156, 156, 185, 221),
                                Color.fromARGB(156, 156, 185, 221),
                                Color.fromARGB(255, 255, 255, 255),
                                Color.fromARGB(255, 255, 255, 255),
                                Color.fromARGB(255, 255, 255, 255),
                              ],
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  width: width / 2,
                                  height: height / 5,
                                  child: Image.asset("assets/50off.png")),
                              Image.asset(
                                'assets/image7.png',
                              ),
                            ],
                          ),
                        ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(156, 156, 185, 221),
                                Color.fromARGB(255, 255, 255, 255),
                                Color.fromARGB(255, 255, 255, 255),
                                Color.fromARGB(255, 255, 255, 255),
                                Color.fromARGB(255, 255, 255, 255),
                              ],
                            ),
                          ),
                          width: width,
                          height: height / 20,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Top Rate Freelances",
                                  style: GoogleFonts.hind(
                                      fontWeight: FontWeight.w600,
                                      fontSize: height / 35),
                                ),
                                Text(
                                  "View All",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: const Color.fromARGB(
                                        255,
                                        21,
                                        72,
                                        131,
                                      ),
                                      fontSize: height / 55),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          width: width,
                          height: height / 5,
                          child: TopFreeLances(
                              avaterImage: avaterImage,
                              width: width,
                              height: height),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(156, 156, 185, 221),
                                Color.fromARGB(255, 255, 255, 255),
                                Color.fromARGB(255, 255, 255, 255),
                                Color.fromARGB(255, 255, 255, 255),
                                Color.fromARGB(255, 255, 255, 255),
                              ],
                            ),
                          ),
                          width: width,
                          height: height / 20,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Top Services",
                                  style: GoogleFonts.hind(
                                      fontWeight: FontWeight.w600,
                                      fontSize: height / 35),
                                ),
                                Text(
                                  "View All",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: const Color.fromARGB(
                                        255,
                                        21,
                                        72,
                                        131,
                                      ),
                                      fontSize: height / 55),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: width * 4.7 / 5,
                        height: height * 4 / 5,
                        child: const AvatarImage2(),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class TopFreeLances extends StatelessWidget {
  const TopFreeLances({
    super.key,
    required this.avaterImage,
    required this.width,
    required this.height,
  });

  final List<String> avaterImage;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: avaterImage.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SizedBox(
            width: width / 5,
            height: height / 5,
            child: Stack(alignment: Alignment.topCenter, children: [
              CircleAvatar(
                radius: height / 22,
                child: ClipOval(
                  child: Image.asset(
                    avaterImage[index],
                  ),
                ),
              ),
              Positioned(
                bottom: height / 22,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Wade Warren",
                        style: TextStyle(fontSize: 13),
                      ),
                      const Text(
                        "Beautician",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Container(
                        width: width / 7,
                        height: height / 30,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(20, 130, 123, 235),
                            borderRadius: BorderRadius.circular(40)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/logo7.png',
                              scale: width / 250,
                            ),
                            const Text(
                              " 4.9",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}

class AvatarImage2 extends StatelessWidget {
  const AvatarImage2({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final List<String> avatarImage2 = [
      'assets/image13-1.png',
      'assets/image13-2.png',
      'assets/image13-3.png',
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: avatarImage2.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: height / 4,
                child: Stack(
                  children: [
                    Positioned(
                        left: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            avatarImage2[index],
                            fit: BoxFit.fill,
                            width: width / 2,
                          ),
                        )),
                    Positioned(
                        top: height / 30,
                        right: 0,
                        child: Container(
                            height: height / 6,
                            width: width * 1.1 / 2,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Align(
                                    alignment: Alignment.topLeft,
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundImage:
                                          AssetImage('assets/image14-1.png'),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Miss Zachary Will",
                                          style: TextStyle(
                                              fontSize: height / 50,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "Beautician",
                                          style: TextStyle(
                                              fontSize: height / 70,
                                              color: const Color.fromARGB(
                                                  255, 130, 123, 235)),
                                        ),
                                        Text(
                                          "Doloribus saepe aut necessit qui non qui.",
                                          style: TextStyle(
                                              fontSize: height / 80,
                                              color: const Color.fromARGB(
                                                  255, 107, 107, 107)),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: width / 7,
                                              height: height / 30,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      20, 130, 123, 235),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    'assets/logo7.png',
                                                    scale: width / 200,
                                                  ),
                                                  Text(
                                                    " 4.9",
                                                    style: TextStyle(
                                                        fontSize: height / 60,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              width: width / 6,
                                              height: height / 30,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 130, 123, 235),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Text(
                                                "Book Now",
                                                style: TextStyle(
                                                    fontSize: height / 70,
                                                    color: Colors.white),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )))
                  ],
                ),
              );
            }),
      ),
    );
  }
}
//mándkjasdaskdakjsdk
//jhbvfcsz