import 'package:bloc_e_commerce/features/home/bloc/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Home UI
/**
 * Should listen to the states emitted by bloc and also accept events done/passed by the user
 *
 * So must me wrapped by bloc consumer
 */

class _HomePageState extends State<HomePage> {
  final HomeBloc homebloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homebloc,
      // listenWhen: (previous,current){},
      // buildWhen: (previous,current){},
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Align(
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                Icon(
                  Icons.menu,
                  size: 35,
                ),
                Text("Kathmandu"),
                Icon(Icons.account_circle)
              ]),
            ),
          ),
          body: Container(
              color: Colors.purple,
              child: Center(
                  child: Text(
                "This is the home page",
                style: TextStyle(fontSize: 30),
              ))),
        );
      },
    );
  }
}
