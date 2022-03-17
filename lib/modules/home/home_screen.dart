import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World !'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            clipBehavior: Clip.antiAlias,
            width: 200,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                const Image(
                  image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg'),
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Colors.black.withOpacity(0.6),
                  child: const Text(
                    'Flower',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
