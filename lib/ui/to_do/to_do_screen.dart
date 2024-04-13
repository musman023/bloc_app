import 'package:bloc_app/bloc/to_do/to_do_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ToDo Using Bloc",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 24,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          if (state.todosList.isEmpty) {
            return const Center(
              child: Text(
                "ToDo List is Empty!",
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
            );
          } else {
            return ListView.builder(
                itemCount: state.todosList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.todosList[index]),
                    trailing: IconButton(
                        onPressed: () {
                          context.read<ToDoBloc>().add(
                              RemoveToDoEvent(task: state.todosList[index]));
                        },
                        icon: const Icon(Icons.delete)),
                  );
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 5; i++) {
            context.read<ToDoBloc>().add(AddToEvent(task: 'Task: $i'));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
