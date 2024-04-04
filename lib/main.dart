import 'package:flutter/material.dart';
import 'package:future_builder_example/providers/galaxy-api-service.dart';
import 'package:future_builder_example/providers/galaxy-provider.dart';
import 'package:future_builder_example/widgets/galaxy-list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GalaxyProvider()),
        Provider(create: (context) => GalaxyApiService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GalaxyListPage(title: 'Galaxy'),
    );
  }
}
