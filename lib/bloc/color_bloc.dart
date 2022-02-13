import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorState(colorValue: Colors.blueAccent)) {
    on<ChangeColorEvent>((event, emit) {
      if (state.colorValue == Colors.blueAccent) {
        emit(ColorState(colorValue: Colors.greenAccent));
      } else {
        emit(ColorState(colorValue: Colors.blueAccent));
      }
    });
  }
}
