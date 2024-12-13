import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Validation Example',
      theme: ThemeData(
        primaryColor: Colors.deepPurple, // لون الثيم الأساسي
        scaffoldBackgroundColor: Colors.grey[100], // لون خلفية الصفحة
      ),
      home: ValidationPage(),
    );
  }
}

class ValidationPage extends StatefulWidget {
  @override
  _ValidationPageState createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController ahmed_usernameController = TextEditingController();
  final TextEditingController ahmed_passwordController = TextEditingController();
  final TextEditingController ahmed_emailController = TextEditingController();

  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      // إذا كانت المدخلات صحيحة
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('كل المدخلات صحيحة!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('صفحة التحقق'),
        backgroundColor: Colors.deepPurple, // لون شريط العنوان
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // زوايا مدورة أكبر
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min, // يجعل البطاقة تأخذ أقل مساحة ممكنة
                  children: <Widget>[
                    TextFormField(
                      controller: ahmed_usernameController,
                      decoration: InputDecoration(
                        labelText: 'اسم المستخدم',
                        labelStyle: TextStyle(color: Colors.deepPurple), // لون النص
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال اسم المستخدم';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: ahmed_passwordController,
                      decoration: InputDecoration(
                        labelText: 'كلمة المرور',
                        labelStyle: TextStyle(color: Colors.deepPurple), // لون النص
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                      ),
                      obscureText: true, // إخفاء النص عند الإدخال
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال كلمة المرور';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: ahmed_emailController,
                      decoration: InputDecoration(
                        labelText: 'البريد الإلكتروني',
                        labelStyle: TextStyle(color: Colors.deepPurple), // لون النص
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال البريد الإلكتروني';
                        }
                        // تحقق بسيط من صحة البريد الإلكتروني
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'يرجى إدخال بريد إلكتروني صحيح';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: _validateInputs,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple, // لون زر التحقق
                          borderRadius: BorderRadius.circular(10), // زوايا مدورة
                          boxShadow: [
                            BoxShadow(
                              color: Colors.deepPurple.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // تأثير الظل
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'تحقق من المدخلات',
                            style: TextStyle(
                              color: Colors.white, // لون النص
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}