import 'package:workflowz/domain/data/models/SelfInfo.dart';
import 'package:workflowz/logic/profile/bloc/profile_bloc.dart';
import 'package:workflowz/logic/profile/bloc/profile_event.dart';

class ProfileActions {
  ///
  void update({required ProfileBloc bloc, required SelfInfo selfInfo}) {
    bloc.add(ProfileUpdated(selfInfo));
  }
}
