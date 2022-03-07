import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_miarmapp/bloc/new_post_bloc/new_post_event.dart';
import 'package:flutter_miarmapp/bloc/new_post_bloc/new_post_state.dart';
import 'package:flutter_miarmapp/repository/post_repository/post_repository.dart';

class NewPostBloc extends Bloc<NewPostEvent, NewPostState> {
  final PostRepository postRepository;

  NewPostBloc(this.postRepository) : super(NewPostInitialState()) {
    on<DoNewPostEvent>(_doNewPostEvent);
  }

  void _doNewPostEvent(DoNewPostEvent event, Emitter<NewPostState> emit) async {
    try {
      final newPostResponse = await postRepository.newPost(event.newPostDto, event.imagePath);
      emit(NewPostSuccessState(newPostResponse));
      return;
    } on Exception catch (e) {
      emit(NewPostErrorState(e.toString()));
    }
  }
}