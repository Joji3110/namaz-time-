import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:time_namaz/cubit/navigation_cubit.dart';
import 'package:time_namaz/utils/constants/color.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key, required this.navigationShell})
      : super(key: key);
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: navigationShell,
          ),
          bottomNavigationBar: SlidingClippedNavBar(
            backgroundColor: TColors.containerColorBlue,
            selectedIndex: state.selectedIndex,
            onButtonPressed: (index) {
              // Используйте ваш Cubit для отправки события о выборе индекса
              context
                  .read<NavigationCubit>()
                  .goToBranch(index, navigationShell);
            },
            iconSize: 30,
            activeColor: Colors.white,
            inactiveColor: Colors.white,
            barItems: [
              BarItem(
                title: 'Время',
                icon: Icons.home,
              ),
              BarItem(
                title: 'Намаз',
                icon: Icons.book,
              ),
            ],
          ),
        );
      },
    );
  }
}
