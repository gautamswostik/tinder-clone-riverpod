import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rivpod/screens/likes/widget/card_provider.dart';
import 'package:rivpod/model/user.dart';

class TinderCard extends ConsumerStatefulWidget {
  const TinderCard({
    Key? key,
    required this.user,
    required this.isFront,
  }) : super(key: key);
  final User user;
  final bool isFront;
  @override
  _TinderCardState createState() => _TinderCardState();
}

class _TinderCardState extends ConsumerState<TinderCard> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      ref.read(cardProvider).setScreenSize(size);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: widget.isFront ? buildFrontCard() : buildNormalCard(),
    );
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
              child: Stack(children: [
                buildCard(),
                buildStamps(),
              ]),
            ),
          );
        });
      },
    );
  }

  Widget buildNormalCard() {
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
      ),
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
                const Padding(
                  padding: EdgeInsets.only(bottom: 90),
                ),
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

  Widget buildStamps() {
    final statusProvider = ref.watch(cardProvider).getStatus();
    final opacity = ref.watch(cardProvider).getStatusOpacity();

    switch (statusProvider) {
      case CardStatus.like:
        final child = buildStamp(
          angle: -0.5,
          color: Colors.green,
          text: 'Like'.toUpperCase(),
          opacity: opacity,
        );
        return Positioned(
          top: 64,
          left: 50,
          child: child,
        );

      case CardStatus.dislike:
        final child = buildStamp(
          angle: 0.5,
          color: Colors.red,
          text: 'nope'.toUpperCase(),
          opacity: opacity,
        );
        return Positioned(
          top: 64,
          right: 50,
          child: child,
        );
      case CardStatus.superlike:
        final child = Center(
          child: buildStamp(
            color: Colors.blue,
            text: 'super\nlike'.toUpperCase(),
            opacity: opacity,
          ),
        );
        return Positioned(
          bottom: 128,
          right: 0,
          left: 0,
          child: child,
        );
      default:
        return Container();
    }
  }

  Widget buildStamp({
    double angle = 0,
    required Color color,
    required String text,
    required double opacity,
  }) {
    return Opacity(
      opacity: opacity,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color, width: 4),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
