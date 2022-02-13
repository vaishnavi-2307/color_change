import 'package:color_change/bloc/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorBloc(),
      child: const MaterialApp(
        home: FirstScreen(),
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FirstScreen"),
      ),
      body: Column(
        children: [
          BlocBuilder<ColorBloc, ColorState>(builder: (context, state) {
            return Container(
              width: 300,
              height: 300,
              color: state.colorValue,
            );
          }),
          const Text("This button will change the change the backgound color"),
          ElevatedButton(onPressed:(){
             BlocProvider.of<ColorBloc>(context).add(ChangeColorEvent());
          }, child: const Text("Change backgound color")),
        ],
      ),
    );
  }
}
