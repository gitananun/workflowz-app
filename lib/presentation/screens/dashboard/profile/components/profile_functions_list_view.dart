import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:workflowz/presentation/widgets/list_view/custom_list_view_separator.dart';

import 'profile_functions_item_row.dart';

class ProfileFunctionsListView extends StatelessWidget {
  const ProfileFunctionsListView({
    Key? key,
    required this.onSignOut,
    required this.onPersonalInfo,
    required this.onChangePassword,
  }) : super(key: key);
  final GestureTapCallback onSignOut;
  final GestureTapCallback onPersonalInfo;
  final GestureTapCallback onChangePassword;

  void _onTap(String action) {
    HapticFeedback.mediumImpact();
    switch (action) {
      case 'info':
        onPersonalInfo();
        break;
      case 'changePassword':
        onChangePassword();
        break;
      case 'about':
        print('about');
        break;
      case 'signOut':
        onSignOut();
        break;
      default:
    }
  }

  final _listFunctions = const [
    {'icon': FontAwesomeIcons.userEdit, 'label': 'Personal Information', 'action': 'info'},
    {'icon': FontAwesomeIcons.cog, 'label': 'Change Password', 'action': 'changePassword'},
    {'icon': FontAwesomeIcons.infoCircle, 'label': 'About this App', 'action': 'about'},
    {'icon': FontAwesomeIcons.signOutAlt, 'label': 'Sign Out', 'action': 'signOut'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: _listFunctions.length,
      separatorBuilder: (_, __) => CustomListViewSeparator(),
      itemBuilder: (BuildContext context, int i) => InkWell(
        onTap: () => _onTap(_listFunctions[i]['action'].toString()),
        child: ProfileFunctionsItemRow(
          icon: _listFunctions[i]['icon'] as IconData,
          label: _listFunctions[i]['label'].toString(),
        ),
      ),
    );
  }
}
