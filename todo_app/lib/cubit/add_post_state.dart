part of 'add_post_cubit.dart';

@immutable
abstract class AddPostState {}

class AddPostInitial extends AddPostState {}

class AddPostError extends AddPostState {
  final String error;

  AddPostError({this.error});
}

class AddingPost extends AddPostState {}

class PostAdded extends AddPostState {}
