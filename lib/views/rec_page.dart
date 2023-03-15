import 'package:flutter/material.dart';

import '../models/quran.dart';

class ReciterDetailsPage extends StatelessWidget {
  final Reciter reciter;

  const ReciterDetailsPage({Key? key, required this.reciter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(reciter.name),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: reciter.moshaf.length,
          itemBuilder: (context, index) {
            final surah = reciter.moshaf;

            return Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(surah[index].name),
                        subtitle: Text(surah[index].surahTotal.toString()),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
