import 'package:flutter/material.dart';
import 'package:readu/screens/HomeScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomeScreen(),
      // home: DetailScreen(
      //   mangaImg: "https://avt.mkklcdnv6.com/2/q/20-1583501094.jpg",
      //   mangaTitle: "I'm The Great Immortal",
      //   mangaLink: "https://m.manganelo.com/manga-gc121022",
      // ),
    );
  }
}
