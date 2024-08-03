import 'package:flutter/material.dart';
import 'package:endeavor/endeavors_screen/endeavors_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'endeavors_screen_view.dart';

class EndeavorsScreen extends StatelessWidget {
  const EndeavorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EndeavorsScreenBloc(),
      child: const EndeavorsScreenView(),
    );
  }
}
