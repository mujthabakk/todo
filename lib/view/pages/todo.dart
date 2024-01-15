import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/controller/counterprovaider.dart';

class Todo extends ConsumerWidget {
  Todo({super.key});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(ref.watch(todolist.notifier).state[index]),
                    trailing: CloseButton(
                      onPressed: () {
                        List remo = ref.watch(todolist.notifier).state;
                        remo.removeAt(index);
                        ref.watch(todolist.notifier).state = List.from(remo);
                      },
                    ),
                    leading: IconButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Bottom_sheets(
                              controller: controller,
                              function: () {
                                List newlist =
                                    ref.read(todolist.notifier).state;
                                newlist[index] = (controller.text);
                                ref.read(todolist.notifier).state =
                                    List.from(newlist);

                                controller.clear();
                              },
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.edit),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: ref.watch(todolist).length,
              ),
            ),
            Divider()
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Bottom_sheets(
                    controller: controller,
                    function: () {
                      List newlist = ref.read(todolist.notifier).state;
                      newlist.add(controller.text);
                      ref.read(todolist.notifier).state = List.from(newlist);

                      controller.clear();
                    },
                  );
                },
              );
            },
            child: Text("Add")));
  }
}

class Bottom_sheets extends ConsumerWidget {
  const Bottom_sheets({
    super.key,
    required this.controller,
    // required this.too,
    required this.function,
  });

  final TextEditingController controller;
  // final Textcontrol too;
  final Function() function;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextField(
          controller: controller,
        ),
        ElevatedButton(child: const Text('Add'), onPressed: function),
      ],
    );
  }
}
