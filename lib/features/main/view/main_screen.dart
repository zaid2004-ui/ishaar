import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishaar/core/utils/widgets/custom_appbar.dart';
import 'package:ishaar/features/main/view/widget/drawer.dart';
import 'package:ishaar/features/main/view/widget/main_bottm_navbar.dart';
import 'package:ishaar/features/main/view_model/cubit.dart';
import 'package:ishaar/features/main/view_model/state.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitMain(),
      child: Scaffold(
        appBar: CustomAppBar(title: Text('Home')),
        drawer: DreaweWidget(),
        body: BlocBuilder<CubitMain, MainState>(
          builder: (context, state) {
            final cubit = context.read<CubitMain>();
            return cubit.page[cubit.navBarIndex];
          },
        ),

        bottomNavigationBar: MainBottomNavBar(),
      ),
    );
  }
}
