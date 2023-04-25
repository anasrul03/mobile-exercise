import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleWeather extends StatefulWidget {
  const SimpleWeather({super.key});

  @override
  State<SimpleWeather> createState() => _SimpleWeatherState();
}

class _SimpleWeatherState extends State<SimpleWeather> {
  final TextEditingController _inputController = TextEditingController();
  final WeatherCubit _weatherCubit = WeatherCubit();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // _inputController = TextEditingController();
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Weather App"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                      controller: _inputController,
                      // obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Input Location"),
                      )),
                ),
                IconButton(
                    onPressed: () {
                      _weatherCubit.randomPick(_inputController.text);
                      BlocProvider.of<WeatherCubit>(context)
                          .fetchWeather(_inputController.text);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("${_inputController.text} here"),
                        backgroundColor: Colors.purple,
                      ));
                    },
                    icon: Icon(Icons.search)),
              ],
            ),
            SizedBox(height: 20),
            BlocBuilder<WeatherCubit, String>(
              bloc: _weatherCubit,
              builder: (BuildContext context, String weather) {
                return Text('The ${_inputController.text} is $weather');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherCubit extends Cubit<String> {
  WeatherCubit() : super("no update yet");
  final _random = new Random();
  final List<String> randomWeather = [
    'sunny',
    'cloudy',
    'rainy',
    'stormy',
    'snowy',
    'foggy'
  ];

  void fetchWeather(String location) {}

  void randomPick(String location) {
    if (location.isEmpty) {
      emit("insert location you idiot");
    } else {
      emit(randomWeather[_random.nextInt(randomWeather.length)]);
    }
  }
}

abstract class WeatherState {}

class WeatherStateInitial extends WeatherState {}

class WeatherStateLoading extends WeatherState {}

class WeatherStateLoaded extends WeatherState {
  WeatherStateLoaded(this.state, this.temp);
  final String state;
  final int temp;
}
