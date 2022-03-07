import 'package:equatable/equatable.dart';
import 'package:flutter_miarmapp/models/new_post_dto.dart';

abstract class NewPostEvent extends Equatable {
  const NewPostEvent();

  @override
  List<Object> get props => [];
}

class DoNewPostEvent extends NewPostEvent {
  final NewPostDto newPostDto;
  final String imagePath;

  const DoNewPostEvent(this.newPostDto, this.imagePath);
}
