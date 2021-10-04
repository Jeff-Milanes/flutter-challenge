import 'package:coding_challenge/app/presentation/bloc/app_bloc.dart';
import 'package:coding_challenge/app/presentation/pages/tab_view_page.dart';
import 'package:coding_challenge/features/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [TabViewPage.page()];
    case AppStatus.unauthenticated:
    default:
      return [LoginPage.page()];
  }
}
