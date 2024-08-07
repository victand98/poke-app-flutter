import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:poke_app/models/models.dart';
import 'package:poke_app/utils/utils.dart';
import 'package:poke_app/widgets/widgets.dart';

class PokemonHeader extends StatelessWidget {
  final Pokemon pokemon;
  final List<String> captures;

  const PokemonHeader({
    super.key,
    required this.pokemon,
    required this.captures,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Stack(
        children: [
          Center(
            child: captures.isEmpty
                ? Image(
                    image: NetworkImage(pokemon.sprites.frontDefault),
                    fit: BoxFit.fill,
                    height: 160,
                    width: 180,
                  )
                : PokemonImagesSlider(imagesPath: captures),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.camera_alt_rounded),
              color: Colors.white,
              iconSize: 50,
              onPressed: () async {
                bool isCameraPermissionGranted =
                    await checkAndAskCameraPermission();
                if (!isCameraPermissionGranted) return;

                final picker = ImagePicker();
                final XFile? pickedFile = await picker.pickImage(
                  source: ImageSource.camera,
                );
                if (pickedFile == null) return;

                Directory capturesDirectory =
                    await FileSystemUtils.createLocalDirectory(
                        'pokemon_${pokemon.id}');

                String fileName = basename(pickedFile.path);

                String destinationFile = '${capturesDirectory.path}$fileName';

                File sourceFile = File(pickedFile.path);
                File destination = File(destinationFile);

                await destination.writeAsBytes(await sourceFile.readAsBytes());
              },
            ),
          )
        ],
      ),
    );
  }
}
