import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './endeavor_block_screen_view.dart';
import '../bloc/create/create_endeavor_block_screen_bloc.dart';
import '../bloc/edit/edit_endeavor_block_screen_bloc.dart';

class EndeavorBlockScreen extends StatelessWidget {
  const EndeavorBlockScreen({this.endeavorBlock, super.key});

  final EndeavorBlock? endeavorBlock;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => endeavorBlock == null
          ? CreateEndeavorBlockScreenBloc()
          : EditEndeavorBlockScreenBloc(
              endeavorBlock: endeavorBlock!,
              dataRepository: context.read<DataRepository>(),
            ),
      child: const EndeavorBlockScreenView(),
    );
  }
}
