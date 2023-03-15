part of 'quran_cubit.dart';

abstract class QuranState extends Equatable {
  const QuranState();

  @override
  List<Object> get props => [];
}

class QuranInitial extends QuranState {}

class QuranLoading extends QuranState {}

class QuranLoaded extends QuranState {
  final List<Reciter> reciters;

  QuranLoaded({required this.reciters});
  @override
  List<Object> get props => [reciters];
}

class QuranError extends QuranState {
  final Failure failure;

  QuranError({required this.failure});
  @override
  List<Object> get props => [failure];
}
