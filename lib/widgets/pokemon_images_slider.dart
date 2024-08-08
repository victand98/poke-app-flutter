import 'dart:io';

import 'package:flutter/material.dart';
import 'package:poke_app/utils/utils.dart';

class PokemonImagesSlider extends StatelessWidget {
  final List<String> imagesPath;

  const PokemonImagesSlider({super.key, required this.imagesPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      height: 250.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: imagesPath.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FutureBuilder<File>(
                future: FileSystemUtils.loadImageFromStorage(imagesPath[index]),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Image.asset(
                      'assets/img/loading.gif',
                      height: 250.0,
                      width: MediaQuery.of(context).size.width - 40.0,
                      fit: BoxFit.cover,
                    );
                  } else if (snapshot.hasError) {
                    return Image.asset(
                      'assets/img/default.jpeg',
                      height: 250.0,
                      width: MediaQuery.of(context).size.width - 40.0,
                      fit: BoxFit.cover,
                    );
                  } else if (snapshot.hasData && snapshot.data != null) {
                    return FadeInImage(
                      image: FileImage(snapshot.data!),
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/img/default.jpeg',
                          height: 250.0,
                          width: MediaQuery.of(context).size.width - 40.0,
                          fit: BoxFit.cover,
                        );
                      },
                      placeholder: const AssetImage("assets/img/loading.gif"),
                      height: 250.0,
                      width: MediaQuery.of(context).size.width - 40.0,
                      fit: BoxFit.cover,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
