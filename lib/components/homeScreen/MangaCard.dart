import 'package:flutter/material.dart';
import 'package:readu/constants/constants.dart';
import 'package:readu/screens/DetailScreen.dart';

class MangaCard extends StatelessWidget {
  final String mangaImg, mangaTitle, mangaUrlList;

  const MangaCard({super.key, required this.mangaImg, required this.mangaTitle, required this.mangaUrlList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 130,
      child: GestureDetector(
        onTap: () {
          print(mangaUrlList);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                mangaImg: mangaImg,
                mangaLink: mangaUrlList,
                mangaTitle: mangaTitle,
              ),
            ),
          );
        },
        child: Column(
          children: [
            Expanded(
              flex: 75,
              child: Container(
                child: Image.network(
                  mangaImg,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 25,
              child: Container(
                alignment: Alignment.centerLeft,
                color: Constants.darkgray,
                child: Text(
                  mangaTitle,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
