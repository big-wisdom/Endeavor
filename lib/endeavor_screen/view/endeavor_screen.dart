import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:endeavor/endeavor_screen/endeavor_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EndeavorScreen extends StatelessWidget {
  const EndeavorScreen({required this.endeavor, super.key});
  final Endeavor endeavor;

  static Page<void> page(Endeavor endeavor) => MaterialPage<void>(
        child: EndeavorScreen(
          endeavor: endeavor,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EndeavorScreenBloc(
        dataRepository: context.read<DataRepository>(),
        endeavor: endeavor,
      ),
      child: const CreateOrEditEndeavorScreenView(),
    );
  }
}
