import 'package:equatable/equatable.dart';
import 'package:flutter_miarmapp/models/new_post_response.dart';

abstract class NewPostState extends Equatable {
  const NewPostState();

  @override
  List<Object> get props => [];
}

class NewPostInitialState extends NewPostState {}

class NewPostLoadingState extends NewPostState {}

class NewPostSuccessState extends NewPostState {
  final NewPostResponse newPostResponse;

  const NewPostSuccessState(this.newPostResponse);

  @override
  List<Object> get props => [newPostResponse];
}

class NewPostErrorState extends NewPostState {
  final String message;

  const NewPostErrorState(this.message);

  @override
  List<Object> get props => [message];
}