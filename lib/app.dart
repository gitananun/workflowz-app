import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:workflowz/logic/theme/bloc/theme_bloc.dart';
import 'package:workflowz/presentation/theme/dark_theme.dart';
import 'package:workflowz/presentation/theme/light_theme.dart';

import 'app/routes/app_router.dart';
import 'constants/enums.dart';
import 'infrastructure/Mixins/DeviceScreenMixin.dart';
import 'infrastructure/actions/auth_actions.dart';
import 'logic/auth/api_auth_repository.dart';
import 'logic/auth/api_user_repository.dart';
import 'logic/session/bloc/session_cubit.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late DeviceScreenSize _deviceScreenSize;
  final AppRouter _appRouter = AppRouter();
  final AuthActions _authActions = AuthActions();

  @override
  void initState() {
    super.initState();
    _deviceScreenSize = DeviceScreenSize.Medium;
  }

  void _tryAutoLogin(BuildContext context) {
    _authActions.attemptAutoLogin(context.read<SessionCubit>(), context.read<ApiUserRepository>());
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => ApiAuthRepository()),
        RepositoryProvider(create: (_) => ApiUserRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SessionCubit()),
          BlocProvider(create: (context) => ThemeBloc(storage: FlutterSecureStorage())),
        ],
        child: BlocBuilder<SessionCubit, SessionState>(
          builder: (context, state) {
            if (state is InitialSession) _tryAutoLogin(context);
            return BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                context.read<ThemeBloc>().add(ThemeLoadStarted());

                return MaterialApp(
                  title: 'Workflowz',
                  themeMode: state.themeMode,
                  theme: LightTheme().getTheme(_deviceScreenSize).copyWith(brightness: Brightness.light),
                  darkTheme: DarkTheme().getTheme(_deviceScreenSize).copyWith(brightness: Brightness.dark),
                  onGenerateRoute: (settings) => _appRouter.onGenerateRoute(context, settings),
                  builder: (context, widget) {
                    WidgetsBinding.instance!.addPostFrameCallback(
                      (_) => _deviceScreenSize = DeviceScreenMixin.getDeviceScreenSize(context),
                    );

                    return widget!;
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
