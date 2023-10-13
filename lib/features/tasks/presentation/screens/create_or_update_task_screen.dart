import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tasks_app/features/shared/presentation/widgets/custom_image_picker.dart';
import 'package:tasks_app/features/shared/presentation/widgets/custom_text_form_field.dart';
import 'package:tasks_app/features/tasks/domain/entities/task.dart';
import 'package:tasks_app/features/tasks/infrastructure/helpers/date_format.dart';
import 'package:tasks_app/features/tasks/presentation/providers/local_storage_provider.dart';
import 'package:tasks_app/features/tasks/presentation/providers/task_color_provider.dart';

class CreateOrUpdateTaskScreen extends ConsumerWidget {
  static const String name = 'create-or-update-task-screen';

  final int id;

  const CreateOrUpdateTaskScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final title = id == 0 ? 'Crear tarea' : 'Actualizar tarea';
    final getTaskById = ref.watch(localStorageRepositoryProvider).getTask(id);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: FutureBuilder(
          future: getTaskById,
          builder: (context, snapshot) {
            print('Future');
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                width: double.infinity,
                height: size.height - kToolbarHeight,
                child: const Center(child: CircularProgressIndicator()),
              );
            }

            final task = snapshot.data;

            return _TaskForm(task);
          },
        ),
      ),
    );
  }
}

class _TaskForm extends ConsumerWidget {
  final Task? task;

  const _TaskForm(this.task);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final color = ref.watch(taskColorProvider(context));

    return Form(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 8, 32, 16),
        child: SizedBox(
          height: size.height - kToolbarHeight - 72,
          child: Column(
            children: <Widget>[
              const CustomImagePicker(),
              const SizedBox(height: 16),
              CustomTextFormField(
                initialValue: task?.title,
                label: 'Título',
                hint: 'Título',
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                initialValue: task?.description,
                label: 'Descripción',
                hint: 'Descripción',
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                initialValue: dateFormat(DateTime.now()),
                readOnly: true,
                prefixIcon: const Icon(Icons.calendar_month_outlined),
              ),
              const SizedBox(height: 16),
              Row(
                children: <Widget>[
                  const Icon(Icons.color_lens_outlined),
                  const SizedBox(width: 8),
                  const Text('Color'),
                  const SizedBox(width: 8),
                  FilledButton.tonal(
                    style: FilledButton.styleFrom(
                      backgroundColor: color,
                    ),
                    onPressed: () {},
                    child: null,
                  )
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Guardar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
