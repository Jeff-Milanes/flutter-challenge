import 'package:flutter/material.dart';

class TabViewPage extends StatelessWidget {
  const TabViewPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: TabViewPage());

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home Page'),
    );
  }
}
