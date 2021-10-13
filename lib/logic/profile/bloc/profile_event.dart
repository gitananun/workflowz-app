import 'package:workflowz/domain/data/models/SelfInfo.dart';

class ProfileEvent {}

class ProfileUpdated extends ProfileEvent {
  final SelfInfo selfInfo;
  ProfileUpdated(this.selfInfo);
}
