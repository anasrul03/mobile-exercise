// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/Component/buttonNav.dart';
import 'package:my_app/Component/toMarkPage.dart';
import 'package:my_app/Students/student1.dart';
import 'package:my_app/Students/student2.dart';
import 'package:my_app/Students/student3.dart';
import 'package:my_app/Students/studentMarks.dart';
import 'package:my_app/counterApp.dart';
import 'package:my_app/exerciseUI.dart';
import 'package:my_app/home.dart';
import 'package:my_app/simpleWeather.dart';
import 'package:my_app/squareColor.dart';
import 'package:my_app/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),

      // initialRoute: '/',
      routes: {
        '/home': (context) => const Home(),
        '/exercise': (context) => const Exercise(),
        '/agatha': (context) => const Student1(name: 'Agatha Christie'),
        '/albert': (context) => const Student2(name: 'Albert Einstein'),
        '/wanda': (context) => const Student3(name: 'Wanda Maximoff'),
        '/marks': (context) => const Marks(),
        '/weather': (context) => BlocProvider(
              create: (context) => CubitforWeather(),
              child: WeatherPage(),
            ), //API
        '/state': (context) => const Square(), //State Management
        //if you wanna use BlocProvider just wrap the route not inside the page
        '/counter': (context) => BlocProvider<CounterCubit>(
              create: (context) => CounterCubit(),
              child: CounterApp(),
            ),
        '/simpleWeather': (context) => BlocProvider<WeatherCubit>(
              create: (context) => WeatherCubit(),
              child: SimpleWeather(),
            ),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  State<MyHomePage> createState() => _MyHomePageState();
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

class _MyHomePageState extends State<MyHomePage> {
  String _title = 'Good Morning Sir';
  Icon _setIcon = Icon(Icons.nightlife);
  bool _isNight = false;
  String sunUrl =
      'https://i0.wp.com/goodmorning-images.org/wp-content/uploads/2023/03/new-good-morning-gif-funny.gif?ssl=1';
  String nightUrl =
      'https://media1.giphy.com/media/QBvEu0ZMXPHgK3HxLO/giphy.gif?cid=6c09b952y6sdrca23j229xprxxmha13rye7hh1q2ur5370vm&rid=giphy.gif&ct=s';

  TextStyle styleGreen = TextStyle(fontSize: 20, color: Colors.green);
  TextStyle styleAmber = TextStyle(fontSize: 20, color: Colors.amber);
  TextStyle styleTitle = TextStyle(
    fontSize: 50,
    color: Colors.blue,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isNight! ? Colors.white : Colors.blueGrey[900],
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(_isNight! ? "Good Night" : "Good Morning"),
        backgroundColor: _isNight! ? Colors.amber : Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _isNight = !_isNight;
            });
          },
          backgroundColor: _isNight! ? Colors.amber : Colors.blue,
          child: Icon(_isNight! ? Icons.sunny : Icons.dark_mode)),
      // bottomNavigationBar: BottomNavigationBar(items: ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              CachedNetworkImage(
                  height: 200,
                  width: 200,
                  imageUrl: _isNight ? sunUrl : nightUrl,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error)),
              SizedBox(
                height: 20,
              ),
              NaviButton(
                title: 'to Exercise Page',
                routeTo: "/exercise",
              ),
              NaviButton(
                title: 'to Student App',
                routeTo: '/home',
              ),
              NaviButton(
                title: 'to Weather App',
                routeTo: '/weather',
              ),
              NaviButton(
                title: 'to Square App',
                routeTo: '/state',
              ),
              NaviButton(
                title: 'to Counter App',
                routeTo: '/counter',
              ),
              NaviButton(
                title: 'to Simple Weather App',
                routeTo: '/simpleWeather',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
