import 'package:flutter/material.dart';
import 'package:rivpod/screens/tindercard.dart';
import 'package:rivpod/model/user.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final user = User(
    name: 'SunFlower',
    age: 22,
    urlImage:
        'https://images.unsplash.com/photo-1611042553484-d61f84d22784?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8bW9kZWwlMjBnaXJsfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.red.shade200, Colors.black],
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(6),
              child: Column(
                children: [
                  buidLogo(),
                  const SizedBox(height: 16),
                  Expanded(child: TinderCard(user: user)),
                  const SizedBox(height: 16),
                  buidButtons(),
                ],
              ),
            ),
          )),
    );
  }

  Widget buidLogo() {
    return Row(
      children: const [
        Icon(
          Icons.local_fire_department_rounded,
          color: Colors.white,
          size: 36,
        ),
        SizedBox(width: 4),
        Text(
          'Tinder',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget buidButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 8,
            primary: Colors.white,
            shape: const CircleBorder(),
            minimumSize: const Size.square(80),
          ),
          child: const Icon(
            Icons.clear,
            color: Colors.red,
            size: 40,
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 8,
            primary: Colors.white,
            shape: const CircleBorder(),
            minimumSize: const Size.square(80),
          ),
          child: const Icon(
            Icons.star,
            color: Colors.red,
            size: 40,
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 8,
            primary: Colors.white,
            shape: const CircleBorder(),
            minimumSize: const Size.square(80),
          ),
          child: const Icon(
            Icons.favorite,
            color: Colors.red,
            size: 40,
          ),
        ),
      ],
    );
  }
}
