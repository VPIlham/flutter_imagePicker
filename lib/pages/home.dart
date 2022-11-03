import 'package:flutter/material.dart';
import 'package:flutter_file/pages/multiple_img.dart';
import 'package:flutter_file/pages/pick_img.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter File'),
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const PickImagePage()));
                  },
                  child: const Text('Pick Image'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const MultipleImagePage()));
                  },
                  child: const Text('Pick Multiple Image'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Pick File'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Pick Multiple File'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
