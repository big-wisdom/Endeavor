import 'package:endeavor/endeavors_screen/endeavors_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:endeavor/edit_endeavor_screen/edit_endeavor_screen.dart';

class EndeavorsScreenView extends StatelessWidget {
  const EndeavorsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final endeavorsScreenBloc = context.read<EndeavorsScreenBloc>();
    return BlocBuilder<EndeavorsScreenBloc, EndeavorsScreenState>(
      builder: (context, state) {
        return ListView.separated(
          itemCount: endeavorsScreenBloc.state.primaryEndeavors.length,
          itemBuilder: (context, index) {
            Endeavor endeavor =
                endeavorsScreenBloc.state.primaryEndeavors[index];

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
          },
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 1,
            );
          },
        );
      },
    );
  }
}
