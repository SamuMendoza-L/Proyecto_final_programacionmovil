import 'package:flutter/material.dart';

import 'Debt_details.dart';

class ListDebtsScreen extends StatelessWidget {
  const ListDebtsScreen({super.key});

  final List<Map<String, String>> deudas = const [
    {'titulo': 'Viaje diciembre', 'monto': '250000', 'fecha': '31 Oct'},
    {'titulo': 'Internet', 'monto': '70000', 'fecha': '15 Oct'},
    {'titulo': 'Gimnasio', 'monto': '90000', 'fecha': '20 Oct'},
  ];

  static const Color fondo = Color(0xFF0D1322);
  static const Color tarjeta = Color(0xFF1A1F2F);
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
          'FlowCash',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: Text(
              'F.',
              style: TextStyle(
                color: verde,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(28, 12, 28, 28),
        itemCount: deudas.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              children: [
                const Row(
                  children: [
                    Text(
                      'Mis deudas',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Text(
                      'Total pendiente: ',
                      style: TextStyle(color: secundario, fontSize: 16),
                    ),
                    Text(
                      '\$410,000',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 26),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    color: tarjeta,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: secundario),
                      SizedBox(width: 12),
                      Text(
                        'Buscar deudas...',
                        style: TextStyle(
                          color: Color(0xFF8B94AA),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Row(
                  children: [
                    Icon(Icons.circle, color: verde, size: 11),
                    SizedBox(width: 10),
                    Text(
                      'Compromisos activos',
                      style: TextStyle(color: secundario, fontSize: 16),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      '3 deudas',
                      style: TextStyle(color: secundario, fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            );
          }

          final deuda = deudas[index - 1];

          return Card(
            color: tarjeta,
            margin: const EdgeInsets.only(bottom: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(20),
              leading: Container(
                width: 52,
                height: 52,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color(0xFF24293A),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  index == 1
                      ? Icons.flight_takeoff
                      : index == 2
                      ? Icons.wifi
                      : Icons.fitness_center,
                  color: verde,
                ),
              ),
              title: Text(
                deuda['titulo']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 9),
                child: Text(
                  'Pendiente: \$${deuda['monto']}\nFecha límite: ${deuda['fecha']}',
                  style: const TextStyle(
                    color: secundario,
                    fontSize: 15,
                    height: 1.55,
                  ),
                ),
              ),
              trailing: const Icon(
                Icons.chevron_right,
                color: secundario,
                size: 30,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalleDeudaScreen(
                      titulo: deuda['titulo']!,
                      monto: deuda['monto']!,
                      fecha: deuda['fecha']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
