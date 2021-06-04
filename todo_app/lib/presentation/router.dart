import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:todo_app/bloc/auth_bloc/auth_event.dart';
import 'package:todo_app/bloc/product_bloc/product_bloc.dart';
import 'package:todo_app/bloc/products/detail/product_detail_bloc.dart';

import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/cubit/add_post_cubit.dart';

import 'package:todo_app/data/network_service.dart';
import 'package:todo_app/data/product_api_provider.dart';
import 'package:todo_app/data/product_repository.dart';
import 'package:todo_app/data/repository.dart';
import 'package:todo_app/data/user_repository.dart';
import 'package:todo_app/presentation/screens/add_post_screen.dart';
import 'package:todo_app/cubit/edit_post_cubit.dart';
import 'package:todo_app/data/models/post.dart';
import 'package:todo_app/presentation/screens/edit_post_screen.dart';
import 'package:todo_app/presentation/screens/posts_screen.dart';
import 'package:todo_app/cubit/posts_cubit.dart';
import 'package:todo_app/login.dart';
import 'package:todo_app/presentation/screens/products/product_detail_screen.dart';
import 'package:todo_app/presentation/screens/products_screen.dart';
import 'package:todo_app/register.dart';

class AppRouter {
  Repository repository;
  ProductsRepository productsRepository;

  PostsCubit postsCubit;
  final userRepository = UserRepository();
  AppRouter() {
    repository = Repository(networkService: NetworkService());
    productsRepository =
        ProductsRepository(pruductsProvider: ProductProvider());
    postsCubit = PostsCubit(repository: repository);
  }

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case "/":
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (BuildContext context) => AddPostCubit(
      //         repository: repository,
      //         postsCubit: postsCubit,
      //       ),
      //       child: AddPostScreen(),
      //     ),
      //   );

// case EDIT_TODO_ROUTE:
//         final todo = settings.arguments as Post;
//         return MaterialPageRoute(
//           builder: (_) => BlocProvider(
//             create: (BuildContext context) => EditPostCubit(
//               repository: repository,
//               todosCubit: postsCubit,
//             ),
//             child: EditPostScreen(
//               todo: todo,
//             ),
//           ),
//         );

      case LOGIN_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<AuthenticationBloc>(
                  create: (BuildContext context) =>
                      AuthenticationBloc(userRepository: userRepository)
                        ..add(AppStarted()),
                  child: MyApp(userRepository: userRepository),
                ));

      case REGISTER_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<AuthenticationBloc>(
                  create: (BuildContext context) =>
                      AuthenticationBloc(userRepository: userRepository)
                        ..add(AppStarted()),
                  child: RegisterApp(userRepository: userRepository),
                ));

      // BlocProvider<AuthenticationBloc>(
      // create: (context) {
      //   return AuthenticationBloc(userRepository: userRepository)
      //     ..add(AppStarted());
      // },
      // child: MyApp(userRepository: userRepository),

      // case "/":
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       // value: postsCubit,
      //       child: MyApp(userRepository: userRepository),
      //     ),
      //   );

      // return MaterialPageRoute(
      //   builder: (_) => BlocProvider(
      //     create: (BuildContext context) => EditPostCubit(
      //       repository: repository,
      //       todosCubit: postsCubit,
      //     ),
      //     child: EditPostScreen(
      //       todo: todo,
      //     ),
      //   ),
      // );

      // return MaterialPageRoute(
      //     builder: (_) => MyApp(userRepository: userRepository));
      // case "/":
      //   return MaterialPageRoute(builder: (_) => ProductsPage());

      // case "/":
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider.value(
      //       value: postsCubit,
      //       child: PostsScreen(),
      //     ),
      //   );

      // case "/":
      //   return MaterialPageRoute(builder: (_) => ProductsDetailPage());

      // case "/":
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider<ProductBloc>(
      //       create: (BuildContext context) => ProductBloc(
      //         productsRepository,
      //       ),
      //       child: ProductsPage(),
      //     ),
      //   );

      // case "/":
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider<ProductDetailBloc>(
      //       create: (BuildContext context) => ProductDetailBloc(
      //         productsRepository,
      //       ),
      //       child: ProductsNewPage(),
      //     ),
      //   );

      case DETAIL_PRODUCT_ROUTE:
        final product_slug = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => ProductDetailBloc(
              productsRepository,
              product_slug,
            ),
            child: ProductsNewPage(),
          ),
        );

      case "/":
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ProductBloc>(
            create: (BuildContext context) => ProductBloc(productsRepository),
            child: ProductsPage(),
          ),
        );

      // return BlocProvider<ProductDetailBloc>(
      // create: (context) => ProductDetailBloc(productsRepository, 'nike'),

      // case "/":
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider.value(
      //       value: todosCubit,
      //       child: TodosScreen(),
      //     ),
      //   );

      // case EDIT_TODO_ROUTE:
      //   final todo = settings.arguments as Post;
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (BuildContext context) => EditPostCubit(
      //         repository: repository,
      //         todosCubit: postsCubit,
      //       ),
      //       child: EditPostScreen(
      //         todo: todo,
      //       ),
      //     ),
      //   );

      // case EDIT_TODO_ROUTE:
      //   final todo = settings.arguments as Todo;
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (BuildContext context) => EditTodoCubit(
      //         repository: repository,
      //         todosCubit: todosCubit,
      //       ),
      //       child: EditTodoScreen(
      //         todo: todo,
      //       ),
      //     ),
      //   );

      // case ADD_TODO_ROUTE:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (BuildContext context) => AddTodoCubit(
      //         repository: repository,
      //         todosCubit: todosCubit,
      //       ),
      //       child: AddTodoScreen(),
      //     ),
      //   );

      case ADD_TODO_ROUTE:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => AddPostCubit(
              repository: repository,
              postsCubit: postsCubit,
            ),
            child: AddPostScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
