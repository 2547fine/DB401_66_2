import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  final String id;

  const Game({required this.id, key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
