import 'package:flutter/material.dart';

import 'Dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController correoController = TextEditingController(
    text: 'alexandra.chen@flowcash.io',
  );
  final TextEditingController contrasenaController = TextEditingController(
    text: 'SecureKeyPass2025',
  );
  bool ocultarContrasena = true;

  @override
  void dispose() {
    correoController.dispose();
    contrasenaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const fondo = Color(0xFF0D1322);
    const tarjeta = Color(0xFF1A1F2F);
    const campo = Color(0xFF161B2B);
    const textoSecundario = Color(0xFFC0C6DD);
    const verde = Color(0xFFB2F722);

    return Scaffold(
      backgroundColor: fondo,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: tarjeta,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color(0xFF24293A),
                            shape: BoxShape.circle,
                          ),
                          child: const Text(
                            'F.',
                            style: TextStyle(
                              color: verde,
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'FlowCash',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Controla tus ingresos diarios.',
                          style: TextStyle(
                            color: textoSecundario,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 36),
                        const Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Row(
                            children: [
                              Text(
                                'Correo electrónico',
                                style: TextStyle(
                                  color: textoSecundario,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 64,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: campo,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.mail_outline,
                                color: textoSecundario,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: TextField(
                                  controller: correoController,
                                  keyboardType: TextInputType.emailAddress,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              const Text(
                                'Contraseña',
                                style: TextStyle(
                                  color: textoSecundario,
                                  fontSize: 16,
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  '¿Olvidaste tu contraseña?',
                                  style: TextStyle(
                                    color: verde,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 64,
                          padding: const EdgeInsets.only(left: 16),
                          decoration: BoxDecoration(
                            color: campo,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.lock_outline,
                                color: textoSecundario,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: TextField(
                                  controller: contrasenaController,
                                  obscureText: ocultarContrasena,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    ocultarContrasena = !ocultarContrasena;
                                  });
                                },
                                icon: Icon(
                                  ocultarContrasena
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: textoSecundario,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        SizedBox(
                          width: double.infinity,
                          height: 58,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DashboardScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: verde,
                              foregroundColor: fondo,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: const Text(
                              'Iniciar sesión',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 1,
                                color: const Color(0xFF33394A),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'ACCESO BIOMÉTRICO',
                                style: TextStyle(
                                  color: textoSecundario,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: const Color(0xFF33394A),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          width: 58,
                          height: 58,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color(0xFF24293A),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.fingerprint,
                            color: verde,
                            size: 30,
                          ),
                        ),
                        const SizedBox(height: 28),
                        const Text(
                          '¿No tienes una cuenta?  Crea una cuenta',
                          style: TextStyle(
                            color: textoSecundario,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shield_outlined, color: Color(0xFF8B94AA)),
                    SizedBox(width: 8),
                    Text(
                      'Cifrado bancario de 256 bits',
                      style: TextStyle(
                        color: Color(0xFF8B94AA),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
