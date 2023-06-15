import 'package:endeavor/endeavor_screen/endeavor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubEndeavorsEditor extends StatelessWidget {
  const SubEndeavorsEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EndeavorScreenBloc, EndeavorScreenState>(
      buildWhen: ((previous, current) =>
          previous.subEndeavors != current.subEndeavors),
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Sub-Endeavors"),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(state.subEndeavors[index].id!),
                  child: ListTile(
                    title: Text(state.subEndeavors[index].title!),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return EndeavorScreen(
                              endeavor: state.subEndeavors[index],
                            );
                          },
                        ),
                      );
                    },
                  ),
                  onDismissed: (direction) {
                    context.read<EndeavorScreenBloc>().add(
                          DeleteEndeavorRequested(
                            state.subEndeavors[index],
                          ),
                        );
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1,
                );
              },
              itemCount: state.subEndeavors.length,
            ),
            TextButton(
                onPressed: () => context
                    .read<EndeavorScreenBloc>()
                    .add(const CreateEndeavorRequested()),
                child: const Text("Add Sub-Endeavor")),
          ],
        );
      },
    );
  }
}
