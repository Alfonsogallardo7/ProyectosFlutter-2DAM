

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_miarmapp/bloc/posts_bloc/posts_event.dart';
import 'package:flutter_miarmapp/bloc/posts_bloc/posts_state.dart';
import 'package:flutter_miarmapp/repository/post_repository/post_repository.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostRepository postsRepository;

  PostsBloc(this.postsRepository) : super(PostsInitial()) {
    on<FetchPostsWithType>(_postsFetched);
  }

  void _postsFetched(FetchPostsWithType event, Emitter<PostsState> emit) async {
    try {
      final posts = await postsRepository.fetchPosts();
      emit(PostsFetched(posts));
      return;
    } on Exception catch (e) {
      emit(PostsFetchError(e.toString()));
    }
  }
}
