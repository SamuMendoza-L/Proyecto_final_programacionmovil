import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const Color fondo = Color(0xFF0D1322);
  static const Color tarjeta = Color(0xFF1A1F2F);
  static const Color tarjetaOscura = Color(0xFF24293A);
  static const Color secundario = Color(0xFFC0C6DD);
  static const Color verde = Color(0xFFB2F722);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondo,
      appBar: AppBar(
        backgroundColor: fondo,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: secundario),
        ),
        title: const Text(
          'Mi perfil',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(28, 12, 28, 32),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: tarjeta,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 92,
                      height: 92,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: tarjetaOscura,
                        shape: BoxShape.circle,
                        border: Border.all(color: verde, width: 3),
                      ),
                      child: const Text(
                        'AC',
                        style: TextStyle(
                          color: verde,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Alexandra Chen',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'alexandra.chen@flowcash.io',
                      style: TextStyle(color: secundario, fontSize: 15),
                    ),
                    const SizedBox(height: 18),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: tarjetaOscura,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Text(
                        'Miembro FlowCash',
                        style: TextStyle(
                          color: verde,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              _tarjetaOpcion(
                icono: Icons.person_outline,
                titulo: 'Cuenta',
                descripcion: 'Información personal y cuenta vinculada',
              ),
              const SizedBox(height: 14),
              _tarjetaOpcion(
                icono: Icons.shield_outlined,
                titulo: 'Seguridad',
                descripcion: 'Contraseña y privacidad de tu cuenta',
              ),
              const SizedBox(height: 14),
              _tarjetaOpcion(
                icono: Icons.tune,
                titulo: 'Preferencias',
                descripcion: 'Notificaciones y configuración de la app',
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A242C),
                    foregroundColor: const Color(0xFFFFB4AB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout),
                      SizedBox(width: 10),
                      Text(
                        'Cerrar sesión',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tarjetaOpcion({
    required IconData icono,
    required String titulo,
    required String descripcion,
  }) {
    return Card(
      color: tarjeta,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: tarjetaOscura,
                shape: BoxShape.circle,
              ),
              child: Icon(icono, color: verde),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    descripcion,
                    style: const TextStyle(color: secundario, fontSize: 13),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: secundario),
          ],
        ),
      ),
    );
  }
}
