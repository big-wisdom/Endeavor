import 'package:data_repository/data_repository.dart';
import 'package:endeavor/edit_endeavor_screen/edit_endeavor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditEndeavorScreen extends StatelessWidget {
  const EditEndeavorScreen.fromEndeavorReference({
    required EndeavorReference this.endeavorReference,
    super.key,
  }) : endeavor = null;

  const EditEndeavorScreen.fromEndeavor({
    required Endeavor this.endeavor,
    super.key,
  }) : endeavorReference = null;

  final EndeavorReference? endeavorReference;
  final Endeavor? endeavor;

  static Page<void> page(EndeavorReference endeavorReference) =>
      MaterialPage<void>(
        child: EditEndeavorScreen.fromEndeavorReference(
          endeavorReference: endeavorReference,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => endeavor == null
          ? EditEndeavorScreenBloc.fromEndeavorReference(
              dataRepository: context.read<DataRepository>(),
              endeavorReference: endeavorReference!,
            )
          : EditEndeavorScreenBloc.fromEndeavor(
              dataRepository: context.read<DataRepository>(),
              endeavor: endeavor!,
            ),
      child: const EditEndeavorScreenView(),
    );
  }
}
