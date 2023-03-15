import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restapicourse/cubit/quran_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API'),
      ),
      body: BlocBuilder<QuranCubit, QuranState>(
        builder: (context, state) {
          if (state is QuranLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is QuranLoaded) {
            return ListView.builder(
              itemCount: state.reciters.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.reciters[index].name),
                  subtitle: Text(state.reciters[index].moshaf.toString()),
                );
              },
            );
          } else if (state is QuranError) {
            return Center(
              child: Text(state.failure.message),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}