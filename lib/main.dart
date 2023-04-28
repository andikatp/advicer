import 'package:advice/presentation/core/services/theme_service.dart';
import 'package:advice/presentation/screens/advice/advice_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeService(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, themeService, child) => MaterialApp(
        theme: ThemeData(
            useMaterial3: true,
            brightness:
                themeService.isDarkModeOn ? Brightness.dark : Brightness.light),
        home: const AdviceScreenWrapperProvider(),
      ),
    );
  }
}
