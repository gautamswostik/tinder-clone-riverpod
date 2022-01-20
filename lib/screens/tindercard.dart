import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rivpod/infrastructure/card_provider.dart';
import 'package:rivpod/model/user.dart';

class TinderCard extends ConsumerStatefulWidget {
  const TinderCard({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;
  @override
  _TinderCardState createState() => _TinderCardState();
}

class _TinderCardState extends ConsumerState<TinderCard> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPersistentFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      ref.read(cardProvider).setScreenSize(size);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildFrontCard();
  }

  Widget buildFrontCard() {
    return Consumer(
      builder: (context, ref, child) {
        final cardProviderState = ref.watch(cardProvider);
        final position = cardProviderState.position;
        final millisecond = cardProviderState.isDragging ? 0 : 300;

        return LayoutBuilder(builder: (context, constraints) {
          final center = constraints.smallest.center(Offset.zero);
          final angle = cardProviderState.angle * pi / 180;
          final rotatedMatrix = Matrix4.identity()
            ..translate(center.dx, center.dy)
            ..rotateZ(angle)
            ..translate(-center.dx, -center.dy);
          return GestureDetector(
            onPanStart: (details) {
              cardProviderState.startPosition(details);
            },
            onPanUpdate: (details) {
              cardProviderState.updatePosition(details);
            },
            onPanEnd: (details) {
              cardProviderState.endPosition();
            },
            child: AnimatedContainer(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: millisecond),
              transform: rotatedMatrix..translate(position.dx, position.dy),
              child: buildCard(),
            ),
          );
        });
      },
    );
  }

  Widget buildCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.user.urlImage),
            fit: BoxFit.cover,
            // alignment: const Alignment(-0.3, 0),
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.7, 1],
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Spacer(),
                buildName(),
                buildStatus(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildName() {
    return Row(
      children: [
        Text(
          widget.user.name,
          style: const TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          '${widget.user.age}',
          style: const TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildStatus() {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        const Text(
          'Recently Active',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
