import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:restapicourse/models/failure_model.dart';
import 'package:restapicourse/repository/api_repo.dart';

import '../models/quran.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit({required this.apiRepo}) : super(QuranInitial());
  final ApiRepo apiRepo;

  Future<void> fetchApi() async {
    emit(QuranLoading());
    try {
      final List<Reciter>? reciters = await apiRepo.getReciters();
      emit(QuranLoaded(reciters: reciters ?? []));
    } on Failure catch (e) {
      emit(QuranError(failure: e));
    }
  }
}
