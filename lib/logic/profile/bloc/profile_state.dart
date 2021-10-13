import 'package:workflowz/domain/data/models/Address.dart';
import 'package:workflowz/domain/data/models/User.dart';

abstract class ProfileState {
  final User? profile;
  const ProfileState({this.profile});
}

class InitialProfile extends ProfileState {
  InitialProfile(User profile) : super(profile: profile);
}

class ProfileInProgress extends ProfileState {}

class UpdatedProfile extends ProfileState {
  final User user;
  final Address address;
  UpdatedProfile(this.address, this.user);
}

class FailedProfile extends ProfileState {
  final dynamic e;
  FailedProfile(this.e);
}
