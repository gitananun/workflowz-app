import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:workflowz/domain/data/models/Address.dart';
import 'package:workflowz/domain/data/models/User.dart';
import 'package:workflowz/logic/auth/api_user_repository.dart';
import 'package:workflowz/logic/profile/api_profile_repository.dart';
import 'package:workflowz/logic/profile/bloc/profile_event.dart';
import 'package:workflowz/logic/profile/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final User profile;
  final ApiUserRepository userRepo;
  final FlutterSecureStorage storage;
  final ApiProfileRepository profileRepo;

  ProfileBloc({
    required this.storage,
    required this.profile,
    required this.userRepo,
    required this.profileRepo,
  }) : super(InitialProfile(profile));

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    /// Profile Updated
    if (event is ProfileUpdated) {
      yield ProfileInProgress();

      try {
        final String? _token = await storage.read(key: 'token');

        final Address address = await profileRepo.update(_token!, event.selfInfo);
        final User user = await userRepo.self(_token);

        yield UpdatedProfile(address, user);
      } catch (e) {
        yield FailedProfile(e);
      }
    }
  }
}
