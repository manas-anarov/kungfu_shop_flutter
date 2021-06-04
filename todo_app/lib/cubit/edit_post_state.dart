part of 'edit_post_cubit.dart';

@immutable
abstract class EditPostState {}

class EditPostInitial extends EditPostState {}

class EditPostError extends EditPostState {
  final String error;

  EditPostError({this.error});
}

class PostEdited extends EditPostState {}
