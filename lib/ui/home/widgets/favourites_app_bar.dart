import 'package:flutter/material.dart';


class FavouritesAppBar extends StatelessWidget {
  const FavouritesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: AppBar(
        backgroundColor: Colors.transparent,
        title:const Text("Favourites"),
      ),
    );
  }
}