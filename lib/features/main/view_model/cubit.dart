import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishaar/features/main/view_model/state.dart';

class CubitMain extends Cubit<MainState> {
  CubitMain() : super(MainInitState());

  int navBarIndex = 0;

  int countCart = 0;
  List<Widget> page = [
    Center(child: Text('zaid')),
    Center(child: Text('mohmmad')),
  ];

  void changeNavBarIndex({required int index}) {
    navBarIndex = index;
    emit(MainChangeNavBarIndexState());
  }
}
