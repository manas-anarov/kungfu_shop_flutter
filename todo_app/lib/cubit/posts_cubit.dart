import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/data/models/post.dart';
import 'package:todo_app/data/repository.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final Repository repository;

  PostsCubit({this.repository}) : super(PostsInitial());

  void fetchPosts() {
    Timer(Duration(seconds: 3), () {
      repository.fetchPosts().then((todos) {
        // print("ssss");
        // print(todos.toString());
        emit(PostsLoaded(todos: todos));
      });
    });
  }

  void changeCompletionPost(Post todo) {
    repository.changeCompletionPost(false, todo.id).then((isChanged) {
      if (isChanged) {
        // todo.isCompleted = !todo.isCompleted;
        updateTodoList();
      }
    });
  }

  void updateTodoList() {
    final currentState = state;
    if (currentState is PostsLoaded)
      emit(PostsLoaded(todos: currentState.todos));
  }

  addPost(Post todo) {
    final currentState = state;
    if (currentState is PostsLoaded) {
      final todoList = currentState.todos;
      todoList.add(todo);
      emit(PostsLoaded(todos: todoList));
    }
  }

  // void deleteTodo(Post todo) {
  //   final currentState = state;
  //   if (currentState is PostsLoaded) {
  //     final todoList =
  //         currentState.todos.where((element) => element.id != todo.id).toList();
  //     emit(PostsLoaded(todos: todoList));
  //   }
  // }

  void deletePost(Post todo) {
    final currentState = state;
    if (currentState is PostsLoaded) {
      final todoList =
          currentState.todos.where((element) => element.id != todo.id).toList();
      emit(PostsLoaded(todos: todoList));
    }
  }
}
