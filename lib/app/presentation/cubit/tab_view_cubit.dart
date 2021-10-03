import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

part 'tab_view_state.dart';

@injectable
class TabViewCubit extends Cubit<TabViewState> {
  TabViewCubit() : super(const TabViewState(0));

  void tabIndexChange(int index) {
    emit(TabViewState(index));
  }
}
