import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/routes/names.dart';
import 'package:learning_app/common/values/constant.dart';
import 'package:learning_app/global.dart';
import 'package:learning_app/pages/application/bloc/app_bloc.dart';
import 'package:learning_app/pages/settings/widget/setting_widget.dart';
import 'package:learning_app/pages/settings/bloc/settings_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    context.read<AppBloc>().add(const TriggerAppEvent(0));
    Global.storageService.remove(AppConstant.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return Column(
              children: [settingsButton(context, removeUserData)],
            );
          },
        ),
      ),
    );
  }
}
