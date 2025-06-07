import 'package:flutter/material.dart';
import 'package:readu/constants/constants.dart';

import 'MangaCard.dart';

class MangaList extends StatelessWidget {
  final List<Map<String, dynamic>> mangaList;
  final List<Map<String, dynamic>> mangaUrlList;

  const MangaList({super.key, required this.mangaList, required this.mangaUrlList});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height,
      width: double.infinity,
      color: Constants.balck,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Wrap(
          runSpacing: 10,
          spacing: 5,
          children: [
            Container(
              width: double.infinity,
              height: 30,
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                "${mangaList.length} mangas",
                style: const TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                ),
              ),
            ),
            for (int i = 0; i < mangaList.length; i++)
              MangaCard(
                mangaImg: mangaList[i]['attributes']['src'],
                mangaTitle: mangaList[i]['attributes']['alt'],
                mangaUrlList: mangaUrlList[i]['attributes']['href'],
              ),
          ],
        ),
      ),
    );
  }
}
