import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_miarmapp/bloc/me_bloc/me_event.dart';
import 'package:flutter_miarmapp/bloc/me_bloc/me_state.dart';
import 'package:flutter_miarmapp/repository/me_repository/me_repository.dart';

class MeBloc extends Bloc<MeEvent, MeState> {
  final MeRepository meRepository;

  MeBloc(this.meRepository) : super(MeInitial()) {
    on<FetchMeWithType>(_meFetched);
  }

  void _meFetched(FetchMeWithType event, Emitter<MeState> emit) async {
    try {
      final me = await meRepository.fetchMe();
      emit(MeFetched(me));
      return;
    } on Exception catch (e) {
      emit(MeFetchError(e.toString()));
    }
  }
}