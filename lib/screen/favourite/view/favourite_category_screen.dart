import 'package:flutter/material.dart';

class FavouriteCategoryScreen extends StatefulWidget {
  const FavouriteCategoryScreen({super.key});

  @override
  State<FavouriteCategoryScreen> createState() => _FavouriteCategoryScreenState();
}

class _FavouriteCategoryScreenState extends State<FavouriteCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FavoriteCategory"),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xffff5339),
                        Color(0xffff126e),
                      ],
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    ],
                  ),
                )
              ],
            ),
          );
        },),
    );
  }
}
