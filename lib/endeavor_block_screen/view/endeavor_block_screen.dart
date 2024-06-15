import 'package:data_models/data_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/endeavor_block_screen_bloc.dart';
import './endeavor_block_screen_view.dart';

class EndeavorBlockScreen extends StatelessWidget {
  factory EndeavorBlockScreen.create() {
    return const EndeavorBlockScreen._(
      endeavorBlock: null,
    );
  }

  factory EndeavorBlockScreen.edit(String endeavorBlockId) {
    return EndeavorBlockScreen._(
      // TODO: get real endeavor block here
      endeavorBlock: EndeavorBlock(
          id: "abc",
          event: Event.generic(const Duration(hours: 1)),
          endeavorReference: const EndeavorReference(title: 'fake', id: 1)),
    );
  }

  const EndeavorBlockScreen._({this.endeavorBlock});

  final EndeavorBlock? endeavorBlock;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => endeavorBlock == null
          ? EndeavorBlockScreenBloc.create()
          : EndeavorBlockScreenBloc.edit(endeavorBlock!),
      child: const EndeavorBlockScreenView(),
    );
  }
}
