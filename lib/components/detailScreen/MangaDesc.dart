import 'package:flutter/material.dart';
import 'package:readu/constants/constants.dart';

class MangaDesc extends StatefulWidget {
  final String mangaDesc, mangaGenres;

  const MangaDesc({super.key, required this.mangaDesc, required this.mangaGenres});

  @override
  _MangaDescState createState() => _MangaDescState();
}

class _MangaDescState extends State<MangaDesc> {
  bool readMore = false;

  void toggleRead() {
    setState(() {
      readMore = !readMore;
    });
  }

  Widget overMultiLine() {
    return (widget.mangaDesc.trim()).split(" ").length > 30
        ? GestureDetector(
            onTap: toggleRead,
            child: Text(
              readMore ? "Read less" : "Read more",
              style: const TextStyle(
                color: Constants.lightblue,
                fontSize: 14,
              ),
            ),
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Description",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const Divider(),
            Text(
              widget.mangaDesc.substring(13).trim(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
              maxLines: readMore ? 100 : 3,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
            ),
            overMultiLine(),
            const Divider(),
            const Text(
              "Genres",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const Divider(),
            Text(
              widget.mangaGenres,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
