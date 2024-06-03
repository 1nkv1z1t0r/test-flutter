import 'package:flutter/material.dart';
import 'package:test_era_developers/page/news_page/news_page.dart';

void main() {
  runApp(const ForestVPNTestApp());
}

class ForestVPNTestApp extends StatelessWidget {
  const ForestVPNTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ForestVPN test',
      home: NewsPage(),
    );
  }
}
