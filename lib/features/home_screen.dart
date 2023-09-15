

import 'package:flutter/material.dart';
import 'package:get_it_test_lern/core/controller/character_controller.dart';
import 'package:get_it_test_lern/core/model/character_model.dart';

import 'package:get_it_test_lern/locator.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key, });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    List<CharacterModel> characters = [];
    int currentIndex = 0;
    CharacterModel? characterModel;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: FutureBuilder<List<CharacterModel>>(
                future: getIt.get<ChracterController>().getNextCharacter(),
                builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                            return Center(child: Text("Error: ${snapshot.error}"));
                        }

                        characters = snapshot.data!;
                        if (characters.isNotEmpty) {
                            characterModel = characters[currentIndex];
                        }
                        // Render your widget using the current characterModel
                        return Center(child: Image.network(characterModel?.imageUrl ?? "No character available"));
                    } else {
                        return const Center(child: CircularProgressIndicator());  // Show a loading spinner while waiting
                    }
                },
            ),
            floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.skip_next),
                onPressed: () {
                    if (characters.isNotEmpty && currentIndex < characters.length - 1) {
                        setState(() {
                            currentIndex++;
                            characterModel = characters[currentIndex];
                        });
                    }
                },
            ),
        );
    }
}