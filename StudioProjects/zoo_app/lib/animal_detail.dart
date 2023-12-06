import 'package:flutter/material.dart';
import 'animal.dart';
import 'package:audioplayers/audioplayers.dart';

class AnimalDetail extends StatefulWidget {
  final Animal animal;

  const AnimalDetail({
    Key? key,
    required this.animal
  }) : super(key: key);

  @override
  State<AnimalDetail> createState() {
    return _AnimalDetailState();
  }
}

class _AnimalDetailState extends State<AnimalDetail> {
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  void playSound() async {
    await audioPlayer.play(widget.animal.soundUrl);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.animal.label),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(widget.animal.imageUrl, height: 200),
            SizedBox(height: 16),
            Text(widget.animal.description),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: playSound,
              child: Text('Воспроизвести звук'),
            ),
          ],
        ),
      ),
    );
  }
}