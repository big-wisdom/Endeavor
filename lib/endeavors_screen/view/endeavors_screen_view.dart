import 'package:endeavor/endeavors_screen/endeavors_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:endeavor/edit_endeavor_screen/edit_endeavor_screen.dart';

class EndeavorsScreenView extends StatelessWidget {
  const EndeavorsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final endeavorsScreenBloc = context.read<EndeavorsScreenBloc>();
    return BlocBuilder<EndeavorsScreenBloc, EndeavorsScreenState>(
      buildWhen: (previous, current) =>
          previous.primaryEndeavors != current.primaryEndeavors,
      builder: (context, state) {
        return ReorderableListView(
          onReorder: (oldIndex, newIndex) =>
              endeavorsScreenBloc.add(ReorderEndeavors(oldIndex, newIndex)),
          children: endeavorsScreenBloc.state.primaryEndeavors.map((endeavor) {
            return Dismissible(
              key: Key(endeavor.id),
              onDismissed: (direction) {
                // delete the endeavor
                endeavorsScreenBloc.add(DeleteEndeavor(endeavor));
              },
              child: ListTile(
                title: Text(endeavor.title),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        // could I just pass the document snapshot here and let this stream handle updates?
                        // as opposed to getting a stream from the id in the endeavorView widget
                        return EditEndeavorScreen.fromEndeavor(
                          endeavor: endeavor,
                        );
                      },
                    ),
                  );
                },
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
