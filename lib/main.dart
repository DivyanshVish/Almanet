import 'package:almanet/Crm/crm_web_page.dart';
import 'package:almanet/responsive/provider/crm_provider.dart';
import 'package:almanet/screens/home.dart';
import 'package:almanet/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CRMProvider>(
          create: (context) => CRMProvider(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Almanet',
        theme: CustomTheme.customTheme,
        home: const Home(),
      ),
    );
  }
}
