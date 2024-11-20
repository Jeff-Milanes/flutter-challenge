import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:coding_challenge/core/extensions/cubit_extension.dart';

part 'tab_view_state.dart';

@injectable
class TabViewCubit extends Cubit<TabViewState> {
  TabViewCubit() : super(const TabViewState(0));

  void tabIndexChange(int index) {
    safeEmit(TabViewState(index));
  }
}
