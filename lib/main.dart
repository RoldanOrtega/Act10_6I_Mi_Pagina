import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Página Personal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1a1a1a),
        title: Text(
          'Mi Página Personal',
          style: GoogleFonts.oswald(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Sobre mí',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Contacto',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFf0f0f0),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildSectionTitle('Sobre mí'),
            _buildContentCard(
              'Soy una persona a la que le gusta mucho pasar el tiempo con la gente que mas quiero, no soy mucho de salir a fiestas y prefiero pasar una tarde jugando videojuegos o viendo una pelicula. Me gusta mucho el silencio y la tranquilidad.',
            ),
            _buildSectionTitle('Mis pasatiempos'),
            _buildContentCard(
              'Como lo dije anteriormente me gusta mucho jugar videojuegos en mis tiempos libres, mi videojuego favorito es la saga de God Of War.',
            ),
            _buildSectionTitle('Mis gustos musicales'),
            _buildContentCard(
              'No tengo un genero de musica en especifico, escucho la musica dependiendo de mi estado de animo, si estoy feliz escucho musica alegre y si estoy triste escucho musica triste.',
            ),
            _buildSectionTitle('Mi comida favorita'),
            _buildContentCard(
              'Mi comida favorita son las enchiladas verdes, me gusta mucho el picante y el queso.',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF1a1a1a),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.facebook, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: GoogleFonts.oswald(
          textStyle: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
      ),
    );
  }

  Widget _buildContentCard(String content) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          content,
          style: const TextStyle(
            fontSize: 16,
            height: 1.5,
            color: Color(0xFF555555),
          ),
        ),
      ),
    );
  }
}
