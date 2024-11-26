import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://txhqptoaifracowakbuh.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR4aHFwdG9haWZyYWNvd2FrYnVoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI2MjcwMjQsImV4cCI6MjA0ODIwMzAyNH0.QZ_WYiyRnHpRvJ9RpQOXWG543hARNL6eNcuRmnKB8xo',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
