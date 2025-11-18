import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SimpleForm(),
    );
  }
}

class SimpleForm extends StatefulWidget {
  @override
  State<SimpleForm> createState() => _SimpleFormState();
}

class _SimpleFormState extends State<SimpleForm> {
  final TextEditingController campo1 = TextEditingController();
  final TextEditingController campo2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FLUTTER_APP',
          style: TextStyle(color: Colors.lime),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 221, 221, 221),

      body: SingleChildScrollView(   // ✅ Para evitar overflow
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // ✅ Imagen original
            Center(
              child: Image.network(
                "https://94fa3c88.delivery.rocketcdn.me/es/files/2022/07/imagen_linux.png",
                height: 150,
              ),
            ),

            const SizedBox(height: 20),

            // ✅ Campo 1
            TextField(
              controller: campo1,
              decoration: const InputDecoration(
                labelText: "Campo 1",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            // ✅ Campo 2
            TextField(
              controller: campo2,
              decoration: const InputDecoration(
                labelText: "Campo 2",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // ✅ Botón
            ElevatedButton(
              onPressed: () {
                print("Campo 1: ${campo1.text}");
                print("Campo 2: ${campo2.text}");

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Datos enviados")),
                );
              },
              child: const Text("Enviar"),
            ),
          ],
        ),
      ),
    );
  }
}
