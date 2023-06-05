import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:endeavor/create_or_edit_endeavor_screen/create_or_edit_endeavor_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateOrEditEndeavorScreen extends StatelessWidget {
  const CreateOrEditEndeavorScreen({required this.endeavor, super.key});
  final Endeavor endeavor;

  static Page<void> page(Endeavor endeavor) => MaterialPage<void>(
        child: CreateOrEditEndeavorScreen(
          endeavor: endeavor,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateOrEditEndeavorScreenBloc(
        dataRepository: context.read<DataRepository>(),
        endeavor: endeavor,
      ),
      child: const CreateOrEditEndeavorScreenView(),
    );
  }
}
