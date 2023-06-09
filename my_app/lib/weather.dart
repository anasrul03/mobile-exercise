import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final TextEditingController _inputController = TextEditingController();
  // final CubitforWeather _cubitForWeather = CubitforWeather();
  String userInput = "cyberjaya";
  @override
  void initState() {
    super.initState();

    final CubitforWeather _cubit = BlocProvider.of<CubitforWeather>(context);

    _cubit._getCurrentWeatherData(userInput);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: BlocBuilder<CubitforWeather, WeatherState>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(BlocProvider.of<CubitforWeather>(context)
                    ._backgroundImageUrl),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                            setState(() {
                              userInput = _inputController.text;
                              BlocProvider.of<CubitforWeather>(context)
                                  ._getCurrentWeatherData(userInput);
                            });
                          },
                          icon: Icon(Icons.search)),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Text(
                    BlocProvider.of<CubitforWeather>(context)._location,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    BlocProvider.of<CubitforWeather>(context)._weatherCondition,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '${BlocProvider.of<CubitforWeather>(context)._temperature}° C',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // ElevatedButton(
                  //   onPressed: BlocProvider.of<CubitforWeather>(context)
                  //       ._toggleTemperatureUnit,
                  //   child: const Text('Toggle Temperature Unit'),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CubitforWeather extends Cubit<WeatherState> {
  CubitforWeather()
      : super(WeatherState(
            weatherCondition: "",
            temperature: "",
            location: "",
            backgroundImageUrl: ""));

  String _weatherCondition = '';
  String _temperature = '';
  String _location = '';
  String _backgroundImageUrl = '';
  String _temperatureUnit = 'Celsius';
  bool _isLoading = true;

  void _getCurrentWeatherData(city) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=4956a761e1d3771274c17c9f76ca8f78'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final weather = data['weather'][0];
      final main = data['main'];
      final temp = main['temp'];
      final tempInCelsius = temp - 273.15;

      _weatherCondition = weather['main'].toString();
      _temperature = tempInCelsius.toStringAsFixed(0).toString();
      _location = data['name'].toString();
      _backgroundImageUrl =
          _getBackgroundImageUrl(_weatherCondition).toString();
      // _isLoading = false;

      emit(WeatherState(
          weatherCondition: _weatherCondition,
          temperature: _temperature,
          location: _location,
          backgroundImageUrl: _backgroundImageUrl));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  String _getBackgroundImageUrl(String weatherCondition) {
    switch (weatherCondition) {
      case 'Clear':
        return 'https://images.pexels.com/photos/998660/pexels-photo-998660.jpeg';
      case 'Clouds':
        return 'https://images.pexels.com/photos/2114014/pexels-photo-2114014.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';
      case 'Rain':
      case 'Drizzle':
        return 'https://images.pexels.com/photos/7002973/pexels-photo-7002973.jpeg';
      case 'Thunderstorm':
        return 'https://images.pexels.com/photos/680940/pexels-photo-680940.jpeg';
      case 'Snow':
        return 'https://images.pexels.com/photos/624015/pexels-photo-624015.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';
      case 'Mist':
      case 'Smoke':
      case 'Haze':
      case 'Dust':
      case 'Fog':
        return 'https://images.pexels.com/photos/1743392/pexels-photo-1743392.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';
      default:
        return 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGJhY2tncm91bmR8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80';
    }
  }

  // void _toggleTemperatureUnit() {
  //   if (_temperatureUnit == 'Celsius') {
  //     _temperatureUnit = 'Fahrenheit';
  //     _temperature =
  //         (((double.parse(_temperature) * 9 / 5) + 32).toStringAsFixed(0));
  //   } else {
  //     _temperatureUnit = 'Celsius';
  //     _temperature =
  //         (((double.parse(_temperature) - 32) * 5 / 9).toStringAsFixed(0));
  //   }
  // }
}

class WeatherState {
  String weatherCondition = '';
  String temperature = '';
  String location = '';
  String backgroundImageUrl = '';

  WeatherState(
      {required this.weatherCondition,
      required this.temperature,
      required this.location,
      required this.backgroundImageUrl});
}
