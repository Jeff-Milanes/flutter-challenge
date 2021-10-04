import 'package:coding_challenge/app/presentation/cubit/tab_view_cubit.dart';
import 'package:coding_challenge/core/injection/injection.dart';
import 'package:coding_challenge/features/calculator/presentation/pages/calculator_page.dart';
import 'package:coding_challenge/features/location/presentation/pages/location_page.dart';
import 'package:coding_challenge/features/news_feed/presentation/pages/news_feed_page.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:coding_challenge/core/enum/menu.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabViewPage extends StatelessWidget {
  const TabViewPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: TabViewPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TabViewCubit>(
      create: (_) => locator<TabViewCubit>(),
      child: const TabView(),
    );
  }
}

class TabView extends StatelessWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabViewCubit, TabViewState>(
      builder: (context, state) {
        return Scaffold(
          body: _page(state.index),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.index,
            onTap: (value) =>
                context.read<TabViewCubit>().tabIndexChange(value),
            items: [
              ...Menu.values.map(
                (menu) => BottomNavigationBarItem(
                  icon: _icon(menu),
                  label: _label(menu),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  static Widget _icon(Menu menu) {
    switch (menu) {
      case Menu.newsFeed:
        return const Icon(Icons.feed);
      case Menu.calculator:
        return const Icon(Icons.calculate);
      default:
        return const Icon(Icons.map);
    }
  }

  static String _label(Menu menu) {
    return EnumToString.convertToString(menu, camelCase: true);
  }

  static Widget _page(int index) {
    switch (index) {
      case 1:
        return const NewsFeedPage();
      case 2:
        return const CalculatorPage();
      default:
        return const LocationPage();
    }
  }
}
