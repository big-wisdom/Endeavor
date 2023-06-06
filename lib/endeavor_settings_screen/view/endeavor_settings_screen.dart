import 'package:flutter/widgets.dart';
import 'package:endeavor/endeavor_settings_screen/endeavor_settings_screen.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EndeavorSettingsScreen extends StatelessWidget {
  const EndeavorSettingsScreen(this.endeavor, {super.key});

  final Endeavor endeavor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EndeavorSettingsScreenBloc(
        dataRepository: context.read<DataRepository>(),
        endeavor: endeavor,
      ),
      child: const EndeavorSettingsScreenView(),
    );
  }
}
