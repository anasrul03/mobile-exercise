import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  // final CounterCubit _cubit = CounterCubit();
  void _incrementCounter() {
    // _cubit.increment();
    final CounterCubit counterCubit = BlocProvider.of<CounterCubit>(context);
    counterCubit.increment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CachedNetworkImage(
              imageUrl:
                  "https://media.tenor.com/9yRPtiavay4AAAAM/pepe-4chan.gif"),
          BlocListener<CounterCubit, int>(
            listenWhen: (int prevState, int newState) {
              return newState % 5 == 0;
            },
            listener: (BuildContext context, state) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$state is 5"),
                backgroundColor: Colors.purple,
              ));
            },
            child: BlocBuilder<CounterCubit, int>(
                bloc: BlocProvider.of<CounterCubit>(context),
                //build when with previous state and new state.
                buildWhen: (preState, newState) {
                  //return odd number the state is only updated after the odd number
                  return newState % 2 != 0;
                },
                builder: (BuildContext context, int counter) {
                  return Text(
                    "Counter $counter",
                    style: const TextStyle(fontSize: 30),
                  );
                }),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    //to pass the value you just put EMIT for this state management
    emit(state + 1);
  }
}
