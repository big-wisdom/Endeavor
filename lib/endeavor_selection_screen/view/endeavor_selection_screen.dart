import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'endeavor_selection_screen_view.dart';
import '../cubit/endeavor_selection_screen_cubit.dart';

class EndeavorSelectionScreen extends StatelessWidget {
  const EndeavorSelectionScreen({
    this.endeavorTreeOfLife,
    required this.endeavorInput,
    required this.onChanged,
    super.key,
  });

  final List<Endeavor>? endeavorTreeOfLife;
  final EndeavorPickerRowInput endeavorInput;
  final void Function(Endeavor) onChanged;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EndeavorSelectionScreenCubit(
        dataRepository: context.read<DataRepository>(),
        endeavorTreeOfLife: endeavorTreeOfLife,
        endeavorInput: endeavorInput,
        onChanged: onChanged,
      ),
      child: const EndeavorSelectionScreenView(),
    );
  }
}
