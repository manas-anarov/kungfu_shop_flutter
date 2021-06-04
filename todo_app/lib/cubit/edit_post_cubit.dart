import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/cubit/posts_cubit.dart';
import 'package:todo_app/data/models/post.dart';
// import 'package:todo_app/cubit/todos_cubit.dart';
// import 'package:todo_app/data/models/todo.dart';
import 'package:todo_app/data/repository.dart';

part 'edit_post_state.dart';

class EditPostCubit extends Cubit<EditPostState> {
  final Repository repository;
  final PostsCubit todosCubit;

  EditPostCubit({this.repository, this.todosCubit}) : super(EditPostInitial());

  void deleteTodo(Post todo) {
    repository.deletePost(todo.id).then((isDeleted) {
      if (isDeleted) {
        todosCubit.deletePost(todo);
        emit(PostEdited());
      }
    });
  }

  void updateTodo(Post todo, String message) {
    print(message);
    if (message.isEmpty) {
      emit(EditPostError(error: "Message is empty"));
      return;
    }

    repository.updatePost(message, todo.id).then((isEdited) {
      if (isEdited) {
        todo.body = message;
        todosCubit.updateTodoList();
        emit(PostEdited());
      }
    });
  }
}
