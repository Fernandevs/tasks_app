import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks_app/features/tasks/domain/entities/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey<int>(task.id!),
      direction: DismissDirection.horizontal,
      background: Container(
        color: task.isDone ? Colors.green : Colors.deepPurpleAccent,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                width: 20,
              ),
              Text(!task.isDone ? 'Terminar' : 'Pendiente'),
              const SizedBox(
                width: 20,
              ),
              !task.isDone
                  ? const Icon(Icons.task_alt_outlined, color: Colors.white)
                  : const Icon(Icons.pending_outlined, color: Colors.white),
            ],
          ),
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        child: const Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Text('Eliminar'),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.delete,
                color: Colors.white,
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          final bool? result = await showDialog<bool>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text("¿Está seguro de eliminar ${task.title}?"),
                actions: <Widget>[
                  TextButton(
                    child: const Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.green),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text(
                      "Eliminar",
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () {},
                  ),
                ],
              );
            },
          );
          return result ?? false;
        } else {
          final bool? result = await showDialog<bool>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text(
                  "¿Está seguro de cambiar el estado de ${task.title}?",
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text(
                      "Confirmar",
                      style: TextStyle(color: Colors.green),
                    ),
                    onPressed: () {},
                  ),
                ],
              );
            },
          );
          return result ?? false;
        }
      },
      child: Card(
        elevation: 20,
        child: ListTile(
          trailing: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
          leading: CircleAvatar(
            backgroundColor: Color(task.color),
            child: Text(task.char),
          ),
          title: Text(task.title),
          subtitle: Text(task.description),
          onTap: () {
            context.goNamed('todo_detail', extra: task);
          },
        ),
      ),
    );
  }
}
