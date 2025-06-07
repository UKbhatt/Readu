import 'package:flutter/material.dart';
import 'package:readu/widgets/MangaInfoBtn.dart';
import 'package:readu/widgets/VertDivider.dart';


class MangaInfo extends StatelessWidget {
  final String mangaImg, mangaStatus, mangaAuthor;

  const MangaInfo({super.key, required this.mangaImg, required this.mangaStatus, required this.mangaAuthor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 160,
                    width: 130,
                    child: Image.network(
                      mangaImg,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text("By $mangaAuthor - $mangaStatus",
                      style: const TextStyle(color: Colors.white))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const MangaInfoBtn(
                  icon: Icons.play_arrow_outlined,
                  title: "Read",
                ),
                VertDivider(),
                const MangaInfoBtn(
                  icon: Icons.format_list_bulleted_sharp,
                  title: "Chapters",
                ),
                VertDivider(),
                const MangaInfoBtn(
                  icon: Icons.favorite_border_outlined,
                  title: "Favorite",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
