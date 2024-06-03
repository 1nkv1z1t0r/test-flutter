import 'package:flutter/material.dart';
import 'package:test_era_developers/page/detailed_news_page/detailed_news_page.dart';
import 'package:test_era_developers/repositories/news/models/models.dart';

class FeaturedNewsCard extends StatelessWidget {
  const FeaturedNewsCard({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailedNewsPage(
            id: article.id,
          ),
        ),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.30,
        width: MediaQuery.of(context).size.width - 40,
        margin: const EdgeInsets.only(left: 20, right: 20),
        padding: const EdgeInsets.all(20),
        alignment: Alignment.bottomLeft,
        decoration: ShapeDecoration(
          image: DecorationImage(
              image: NetworkImage(
                article.imageUrl,
              ),
              fit: BoxFit.fill,
              colorFilter:
                  const ColorFilter.mode(Color(0xB3000000), BlendMode.darken)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          article.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
