import 'package:flutter/material.dart';

void main() {
  runApp(const LecturasRoldan());
}

class LecturasRoldan extends StatelessWidget {
  const LecturasRoldan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const EscribirScreen(),
    );
  }
}

class BadgeWidget extends StatelessWidget {
  final String text;
  const BadgeWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 10, color: Colors.white70),
      ),
    );
  }
}

class OptionRowWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconColor;
  final Color textColor;
  final bool hasNew;

  const OptionRowWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.iconColor,
    required this.textColor,
    this.hasNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(width: 15),
          Text(
            title,
            style: TextStyle(
                color: textColor, fontSize: 16, fontWeight: FontWeight.w400),
          ),
          if (hasNew) ...[
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(4)),
              child: const Text('NUEVO',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 9,
                      fontWeight: FontWeight.bold)),
            ),
          ],
          const Spacer(),
        ],
      ),
    );
  }
}

class EscribirScreen extends StatelessWidget {
  const EscribirScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // --------------------------------------------------------
    // CAMBIA ESTOS LINKS POR LOS QUE TÚ QUIERAS DE LA WEB
    // --------------------------------------------------------
    const String urlPerfil = 'https://raw.githubusercontent.com/RoldanOrtega/Imagenes-Act9/refs/heads/main/SISI.JPG';
    const String urlPortadaHistoria = 'https://raw.githubusercontent.com/RoldanOrtega/Imagenes-Act9/refs/heads/main/l.JPG';
    // --------------------------------------------------------

    const Color rosaClaro = Color.fromARGB(255, 255, 182, 193);
    const Color azulClaro = Color(0xFF80D8FF);
    const Color azulOscuro = Color(0xFF0D47A1);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Escribir',
          style: TextStyle(
            color: azulOscuro,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          const Center(
            child: Text(
              '@Spaderz',
              style: TextStyle(color: azulClaro, fontWeight: FontWeight.w500),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(urlPerfil), // Imagen de Perfil
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white24),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    urlPortadaHistoria, // Imagen de la Historia (Diferente)
                    width: 70,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Seguir escribiendo',
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      const SizedBox(height: 5),
                      const Text(
                        'La Daga sin Nombre',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          BadgeWidget(text: '3 parte publicada'),
                          SizedBox(width: 8),
                          BadgeWidget(text: '0 borradores'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          OptionRowWidget(
              icon: Icons.menu_book,
              title: 'Editar otra historia',
              iconColor: rosaClaro,
              textColor: azulClaro),
          const Divider(color: Colors.white, thickness: 0.5), // Línea Blanca
          OptionRowWidget(
              icon: Icons.add_box_outlined,
              title: 'Crear una historia nueva',
              iconColor: rosaClaro,
              textColor: azulClaro),
          const Divider(color: Colors.white, thickness: 0.5),
          OptionRowWidget(
              icon: Icons.dashboard_customize_outlined,
              title: 'Series',
              iconColor: rosaClaro,
              textColor: azulClaro,
              hasNew: true),
          const Divider(color: Colors.white, thickness: 0.5),
          OptionRowWidget(
              icon: Icons.import_contacts,
              title: 'Recursos útiles para escritores',
              iconColor: rosaClaro,
              textColor: azulClaro),
          const Divider(color: Colors.white, thickness: 0.5),
          OptionRowWidget(
              icon: Icons.stars_outlined,
              title: 'Programas en Lectores Roldan',
              iconColor: rosaClaro,
              textColor: azulClaro),
          const Divider(color: Colors.white, thickness: 0.5),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: rosaClaro,
        unselectedItemColor: Colors.grey,
        currentIndex: 3,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.edit_note, size: 30), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: ''),
        ],
      ),
    );
  }
}
