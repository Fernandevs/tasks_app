import 'package:flutter/material.dart';
import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';

class CustomImagePicker extends StatelessWidget {
  const CustomImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return FDottedLine(
      color: colors.primary,
      strokeWidth: 2.0,
      dottedLength: 10.0,
      space: 5,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        height: 200,
        child: !true
            ? Stack(
                children: [
                  const Positioned.fill(
                    top: 0,
                    left: 0,
                    child: Image(
                      image: AssetImage('assets/images/no_image.jpg'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton.filledTonal(
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                ],
              )
            : Center(
                child: IconButton(
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)
                    ),
                    minimumSize: const Size(
                      double.infinity,
                      double.infinity,
                    ),
                  ),
                  icon: const Icon(Icons.add, size: 100),
                  onPressed: () {},
                ),
              ),
      ),
    );
  }
}
