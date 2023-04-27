import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  final String errorMessage;
  const CustomError({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          color: theme.colorScheme.error,
          size: 50,
        ),
        const SizedBox(height: 15),
        Text(
          errorMessage,
          style: theme.textTheme.headlineSmall,
        )
      ],
    );
  }
}
