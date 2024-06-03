import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_era_developers/page/news_page/bloc/news_page_bloc.dart';
import 'package:test_era_developers/page/news_page/featured_news_card.dart';
import 'package:test_era_developers/page/news_page/latest_news_card.dart';
import 'package:test_era_developers/repositories/news/repository.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => NewsPageBloc(
              dataRepository: MockNewsRepository(),
            ),
        child: const NewsPageView());
  }
}

class NewsPageView extends StatefulWidget {
  const NewsPageView({super.key});

  @override
  State<NewsPageView> createState() => _NewsPageView();
}

class _NewsPageView extends State<NewsPageView> {
  _NewsPageView();

  @override
  void initState() {
    super.initState();
    final bloc = context.read<NewsPageBloc>();
    bloc.add(LatestArticlesLoadingStarted());
    bloc.add(FeaturedArticlesLoadingStarted());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Notificationsss',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => context.read<NewsPageBloc>().add(MarkAllRead()),
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                child: const Text(
                  'Mark all read',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Featured',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 0.40,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.30,
            child: BlocBuilder<NewsPageBloc, NewsPageState>(
                builder: (context, state) {
              if (state.featuredArticles != null) {
                return PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => FeaturedNewsCard(
                    article: state.featuredArticles![
                        index.abs() % state.featuredArticles!.length],
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Latest news',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 0.40,
              ),
            ),
          ),
          Flexible(
            child: BlocBuilder<NewsPageBloc, NewsPageState>(
                builder: (context, state) {
              if (state.latestArticles != null) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.latestArticles!.length,
                  itemBuilder: (context, index) =>
                      LatestNewsCard(article: state.latestArticles![index]),
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
          ),
        ],
      ),
    );
  }
}
