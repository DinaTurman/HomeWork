import 'package:flutter/material.dart';
import 'animal.dart';
import 'animal_detail.dart';

void main() {
  runApp(const Zoo());
}

class Zoo extends StatelessWidget {
  const Zoo({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(primarySwatch: Colors.lightGreen);

    return MaterialApp(
      title: 'Zoo',
      theme: theme,
      home: const MyHomePage(title: 'Zoo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
          child: ListView.builder(
            itemCount: Animal.animals.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, 
                      MaterialPageRoute(
                          builder: (context) => AnimalDetail(animal: Animal.animals[index]),
                      ),
                  );
                },
                child: (buildAnimalCard(Animal.animals[index])),
              );
            },
        ),
      ),
    );
  }
  Widget buildAnimalCard(Animal animal) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Image(
              image: AssetImage(animal.imageUrl),
              fit: BoxFit.cover,
              height: 400,
              width: 400,
          ),
          const SizedBox(
          height: 14.0,
          ),
          Text(animal.label),
        ],
      ),
    ),
    );
  }
}