import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:workflowz/logic/auth/api_user_repository.dart';
import 'package:workflowz/logic/profile/api_profile_repository.dart';
import 'package:workflowz/logic/profile/bloc/profile_bloc.dart';
import 'package:workflowz/logic/report/api_report_repository.dart';
import '../../../logic/order/api_order_repository.dart';
import '../../../logic/order/bloc/order_bloc.dart';
import '../../../logic/orders/bloc/orders_cubit.dart';
import '../../../logic/session/bloc/session_cubit.dart';

import '../../Common/dashboardNavbarScreens.dart';
import '../../screens/shared/main_scaffold.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  final _storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SessionCubit, SessionState>(
      listenWhen: (_, state) => state is UnauthenticatedSession,
      listener: (_, __) => Navigator.pushReplacementNamed(context, '/'),
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => ApiOrderRepository()),
          RepositoryProvider(create: (context) => ApiReportRepository()),
          RepositoryProvider(create: (context) => ApiProfileRepository()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => OrderBloc(
                storage: _storage,
                orderRepo: context.read<ApiOrderRepository>(),
                reportRepo: context.read<ApiReportRepository>(),
              ),
            ),
            BlocProvider(
              create: (context) => ProfileBloc(
                storage: _storage,
                userRepo: context.read<ApiUserRepository>(),
                profileRepo: context.read<ApiProfileRepository>(),
                profile: (context.read<SessionCubit>().state as AuthenticatedSession).user,
              ),
            ),
            BlocProvider(create: (context) => OrdersCubit())
          ],
          child: MainScaffold(
            currentIndex: _currentIndex,
            onTap: (int v) => setState(() => _currentIndex = v),
            body: BlocBuilder<SessionCubit, SessionState>(
              buildWhen: (_, state) => state is AuthenticatedSession,
              builder: (context, state) => dashboardNavbarScreens[_currentIndex],
            ),
          ),
        ),
      ),
    );
  }
}
