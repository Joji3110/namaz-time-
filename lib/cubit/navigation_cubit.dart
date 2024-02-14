import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NavigationState {
  int selectedIndex;

  NavigationState(this.selectedIndex);
}

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(0));
  void goToBranch(int index, StatefulNavigationShell navigationShell) {
    emit(NavigationState(state.selectedIndex = index));
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }
}
