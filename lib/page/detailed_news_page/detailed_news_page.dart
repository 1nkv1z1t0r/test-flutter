import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_era_developers/page/detailed_news_page/bloc/detailed_news_page_bloc.dart';
import 'package:test_era_developers/repositories/news/repository.dart';

class DetailedNewsPage extends StatelessWidget {
  const DetailedNewsPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => DetailedNewsPageBloc(
              dataRepository: MockNewsRepository(),
              id: id,
            ),
        child: DetailedNewsView(
          id: id,
        ));
  }
}

class DetailedNewsView extends StatefulWidget {
  const DetailedNewsView({super.key, required this.id});

  final String id;

  @override
  State<DetailedNewsView> createState() => _DetailedNewsView(id: id);
}

class _DetailedNewsView extends State<DetailedNewsView> {
  _DetailedNewsView({required this.id});

  final String id;

  @override
  void initState() {
    super.initState();

    final bloc = context.read<DetailedNewsPageBloc>();
    bloc.add(ArticlesLoadingStarted(id: id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailedNewsPageBloc, DetailedNewsPageState>(
        builder: (context, state) {
          if (state.articles != null) {
            return Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.bottomLeft,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage(state.articles!.imageUrl),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    state.articles!.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    width: 372,
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      state.articles!.description!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 0.32,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
