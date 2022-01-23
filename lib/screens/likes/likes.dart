import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rivpod/application/auth/auth_controller.dart';
import 'package:rivpod/screens/likes/widget/card_provider.dart';
import 'package:rivpod/screens/likes/widget/tindercard.dart';
import 'package:rivpod/utils/user_list.dart';

class LikesScreen extends StatefulWidget {
  const LikesScreen({Key? key}) : super(key: key);

  @override
  State<LikesScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LikesScreen> {
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
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Consumer(builder: (context, ref, child) {
              final authentication = ref.read(authController.notifier);
              return InkWell(
                onTap: () {
                  authentication.signOut();
                },
                child: ClipOval(
                  child: Image.network(
                    'https://wallpapershome.com/images/wallpapers/model-2160x3840-girl-brunette-4k-19523.jpg',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
            padding: const EdgeInsets.all(6),
            child: Stack(
              children: [
                buidCards(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: buidButtons(),
                ),
              ],
            )),
      ),
    );
  }

  Widget buidCards() {
    return Consumer(builder: (context, ref, child) {
      ref.read(cardProvider).setUsers(user);
      final userdata = ref.watch(cardProvider).users;
      return userdata.isEmpty
          ? Center(
              child: ElevatedButton(
              child: const Text('Restart'),
              onPressed: () {
                ref.read(cardProvider).setUsers(user);
                ref.watch(cardProvider).resetUsers();
              },
            ))
          : Stack(
              children: userdata
                  .map((e) => TinderCard(
                        user: e,
                        isFront: user.last == e,
                      ))
                  .toList(),
            );
    });
  }

  // Widget buidLogo() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     mainAxisSize: MainAxisSize.min,
  //     children: const [
  //       Icon(
  //         Icons.local_fire_department_rounded,
  //         color: Colors.white,
  //         size: 36,
  //       ),
  //       SizedBox(width: 4),
  //       Text(
  //         'Tinder',
  //         style: TextStyle(
  //           fontSize: 36,
  //           fontWeight: FontWeight.bold,
  //           color: Colors.white,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget buidButtons() {
    return Consumer(builder: (context, ref, child) {
      final status = ref.watch(cardProvider);
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              status.dislike();
            },
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
            onPressed: () {
              status.superlike();
            },
            style: ElevatedButton.styleFrom(
              elevation: 8,
              primary: Colors.white,
              shape: const CircleBorder(),
              minimumSize: const Size.square(80),
            ),
            child: const Icon(
              Icons.star,
              color: Colors.blue,
              size: 40,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              status.like();
            },
            style: ElevatedButton.styleFrom(
              elevation: 8,
              primary: Colors.white,
              shape: const CircleBorder(),
              minimumSize: const Size.square(80),
            ),
            child: const Icon(
              Icons.favorite,
              color: Colors.green,
              size: 40,
            ),
          ),
        ],
      );
    });
  }
}
