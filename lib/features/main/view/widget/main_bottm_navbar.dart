import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishaar/features/main/view_model/cubit.dart';
import 'package:ishaar/features/main/view_model/state.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitMain, MainState>(
      builder: (BuildContext context, state) {
        final cubit = context.read<CubitMain>();
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              height: 1,
              thickness: 0.4,
              color: Theme.of(context).colorScheme.onSurface,
            ),

            NavigationBar(
              selectedIndex: cubit.navBarIndex,
              onDestinationSelected: (index) {
                cubit.changeNavBarIndex(index: index);
              },
              indicatorShape: CircleBorder(),
              destinations: [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'Home',
                ),

                NavigationDestination(
                  icon: Icon(Icons.favorite_border),
                  selectedIcon: Icon(Icons.favorite),
                  label: 'Favorite',
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
