import 'package:custom_textfield_with_countrycode/custom_textfield_with_countrycode.dart';
import 'package:example/utilities/validators.dart';
import 'package:flutter/material.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom TextField Demo',
      theme: AppTheme.lightTheme,
      home: const SamplePage(),
    );
  }
}

class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Modern Text Fields'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Samples',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              CustomTextFieldWithCountryCode(
                validator: Validators.mobilenumberValidator,
                keyboardType: TextInputType.number,
                countrycode: true,
                controller: _numberController,
                labelText: 'Phone Number',
                hintText: 'Enter your phone number',
                onChanged: (String value) {
                  print('Number: $value');
                },
              ),
              CustomTextFieldWithCountryCode(
                controller: _emailController,
                validator: Validators.emailValidator,
                keyboardType: TextInputType.emailAddress,
                labelText: 'Email Address',
                hintText: 'Enter your email address',
                onChanged: (String value) {
                  print('Email: $value');
                },
              ),
              CustomTextFieldWithCountryCode(
                validator: Validators.passwordValidator,
                keyboardType: TextInputType.visiblePassword,
                controller: _passwordController,
                hintText: 'Enter your password',
                labelText: 'Password',
                isPassword: true,
                passwordIconColor: Theme.of(context).colorScheme.primary,
                onChanged: (String value) {
                  print('Password: $value');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
