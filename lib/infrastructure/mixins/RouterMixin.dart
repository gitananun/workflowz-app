import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/session/bloc/session_cubit.dart';

mixin RouterMixin {
  Route<dynamic> onGenerateRoute(BuildContext context, RouteSettings settings);

  Route<dynamic> returnScreen(BuildContext context, Widget screen, String route) {
    final SessionCubit sessionCubit = context.read<SessionCubit>();

    return MaterialPageRoute<dynamic>(
      builder: (_) {
        switch (sessionCubit.state.runtimeType) {
          case InitialSession:
            return BlocProvider.value(value: sessionCubit, child: screen);
          case UnauthenticatedSession:
            return BlocProvider.value(value: sessionCubit, child: screen);
          case AuthenticatedSession:
            return BlocProvider.value(value: sessionCubit, child: screen);
          default:
            return BlocProvider.value(value: sessionCubit, child: screen);
        }
      },
    );
  }
}
