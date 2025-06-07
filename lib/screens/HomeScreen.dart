import 'package:flutter/material.dart';
import 'package:readu/components/homeScreen/MangaList.dart';
import 'package:readu/constants/constants.dart';
import 'package:readu/widgets/BotNavItem.dart';

import 'package:web_scraper/web_scraper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedNavIndex = 0;
  bool mangaLoaded = false;
  late List<Map<String, dynamic>> mangaList;
  late List<Map<String, dynamic>> mangaUrlList;

  void navBarTap(int index) {
    setState(() {
      selectedNavIndex = index;
    });
  }

  void fetchManga() async {
    final webscraper = WebScraper(Constants.baseUrl);

    if (await webscraper.loadWebPage('/read')) {
      mangaList = webscraper.getElement(
        'div.container-main-left > div.panel-content-homepage > div > a > img',
        ['src', 'alt'],
      );

      mangaUrlList = webscraper.getElement(
        'div.container-main-left > div.panel-content-homepage > div > a',
        ['href'],
      );

      setState(() {
        mangaLoaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchManga();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Merdga"),
        backgroundColor: Constants.darkgray,
      ),
      body: mangaLoaded
          ? MangaList(
              mangaList: mangaList,
              mangaUrlList: mangaUrlList,
            )
          : const Center(child: CircularProgressIndicator()),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Constants.darkgray,
        selectedItemColor: Constants.lightblue,
        unselectedItemColor: Colors.white,
        currentIndex: selectedNavIndex,
        onTap: navBarTap,
        items: [
          botNavItem(Icons.explore_outlined, "EXPLORE"),
          botNavItem(Icons.favorite, "FAVORITE"),
          botNavItem(Icons.watch_later, "RECENT"),
          botNavItem(Icons.more_horiz, "MORE"),
        ],
      ),
    );
  }
}
