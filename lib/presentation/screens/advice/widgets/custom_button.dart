import 'package:advice/presentation/screens/advice/cubit/advice_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return RawMaterialButton(
      onPressed: () =>
          BlocProvider.of<AdviceCubit>(context).advicerRequestEvent(),
      fillColor: theme.colorScheme.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(15),
      child: Text('Get Advice', style: theme.textTheme.headlineSmall),
    );
  }
}
