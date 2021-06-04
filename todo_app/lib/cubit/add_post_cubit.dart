import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/cubit/posts_cubit.dart';
import 'package:todo_app/data/repository.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  final Repository repository;
  final PostsCubit postsCubit;

  AddPostCubit({this.repository, this.postsCubit}) : super(AddPostInitial());

  void addPost(String message) {
    if (message.isEmpty) {
      emit(AddPostError(error: "todo message is empty"));
      return;
    }

    emit(AddingPost());
    Timer(Duration(seconds: 2), () {
      repository.addPost(message).then((todo) {
        if (todo != null) {
          postsCubit.addPost(todo);
          emit(PostAdded());
        }
      });
    });
  }
}
