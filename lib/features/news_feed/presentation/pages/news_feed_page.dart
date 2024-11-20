import 'package:coding_challenge/core/injection/injection.dart';
import 'package:coding_challenge/features/news_feed/presentation/cubit/news_cubit.dart';
import 'package:coding_challenge/features/news_feed/presentation/pages/news_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsFeedPage extends StatelessWidget {
  const NewsFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsCubit>(
      create: (_) => locator<NewsCubit>(),
      child: const NewsFeed(),
    );
  }
}

class NewsFeed extends StatefulWidget {
  const NewsFeed({super.key});

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    context.read<NewsCubit>().getNews();
    super.initState();
  }

  void _onRefresh() async {
    context.read<NewsCubit>().getNews();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Feed'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              if (state.status == NewsStatus.success) {
                return SmartRefresher(
                  enablePullDown: true,
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  child: ListView.separated(
                    itemCount: state.news?.length ?? 0,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(height: 5),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: SizedBox(
                          height: 100,
                          width: 100,
                          child: state.news![index].urlToImage != null
                              ? Image.network(
                                  state.news![index].urlToImage!,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(Icons.no_photography),
                        ),
                        title: Text(state.news![index].title ?? ''),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewsDetailsPage(
                                      model: state.news![index],
                                    )),
                          );
                        },
                      );
                    },
                  ),
                );
              }
              if (state.status == NewsStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }
              return const Center(
                child: Text('No record(s) found.'),
              );
            },
          ),
        ),
      ),
    );
  }
}
