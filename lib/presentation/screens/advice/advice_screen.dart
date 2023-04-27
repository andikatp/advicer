import 'package:advice/presentation/core/services/theme_service.dart';
import 'package:advice/presentation/screens/advice/cubit/advice_cubit.dart';
import 'package:advice/presentation/screens/advice/widgets/custom_advicer.dart';
import 'package:advice/presentation/screens/advice/widgets/custom_button.dart';
import 'package:advice/presentation/screens/advice/widgets/custom_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdviceScreenWrapperProvider extends StatelessWidget {
  const AdviceScreenWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdviceCubit(),
      child: const AdviceScreen(),
    );
  }
}

class AdviceScreen extends StatelessWidget {
  const AdviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advicer'),
        centerTitle: true,
        actions: [
          Switch(
              value: context.watch<ThemeService>().isDarkModeOn,
              onChanged: (value) => context.read<ThemeService>().changeTheme())
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: BlocBuilder<AdviceCubit, AdviceState>(
            builder: (context, state) {
              if (state is AdviceInitial) {
                return const CustomAdvicer(
                    advice: 'Advice is waiting for you!');
              }
              if (state is AdviceLoadingState) {
                return const CircularProgressIndicator();
              }
              if (state is AdviceLoadedState) {
                return CustomAdvicer(advice: state.advice);
              }
              if (state is AdviceErrorState) {
                return CustomError(errorMessage: state.errorMessage);
              }
              return const SizedBox();
            },
          ),
        ),
      ),
      floatingActionButton: const Padding(
        padding: EdgeInsets.only(bottom: 40),
        child: CustomButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
