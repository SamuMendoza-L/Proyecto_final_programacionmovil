import 'package:flutter/material.dart';

import 'List_debts.dart';
import 'Profile.dart';
import 'Record_expense.dart';
import 'Record_income.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const Color fondo = Color(0xFF0D1322);
  static const Color tarjeta = Color(0xFF1A1F2F);
  static const Color tarjetaOscura = Color(0xFF161B2B);
  static const Color secundario = Color(0xFFC0C6DD);
  static const Color verde = Color(0xFFB2F722);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondo,
      appBar: AppBar(
        backgroundColor: fondo,
        elevation: 0,
        toolbarHeight: 74,
        title: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: verde,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.account_balance_wallet_outlined,
                color: fondo,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'FlowCash',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: secundario),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            icon: Container(
              width: 42,
              height: 42,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color(0xFF24293A),
                shape: BoxShape.circle,
              ),
              child: const Text(
                'F.',
                style: TextStyle(
                  color: verde,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28, 10, 28, 24),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    'Bienvenida de nuevo, Alexandra',
                    style: TextStyle(color: secundario, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              const Row(
                children: [
                  Text(
                    'Resumen financiero',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              _tarjetaDisponible(),
              const SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: _accesoRapido(
                      icono: Icons.north_east,
                      titulo: 'Agregar\ningreso',
                      colorIcono: verde,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RecordIncomeScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _accesoRapido(
                      icono: Icons.south_east,
                      titulo: 'Agregar\ngasto',
                      colorIcono: secundario,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RecordExpenseScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _accesoRapido(
                      icono: Icons.credit_card,
                      titulo: 'Ver\ndeudas',
                      colorIcono: secundario,
                      aviso: '2 pendientes',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ListDebtsScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 34),
              _tituloSeccion('Próximos pagos', 'Marzo 2025'),
              const SizedBox(height: 14),
              _proximoPago(),
              const SizedBox(height: 30),
              _tituloSeccion('Actividad reciente', 'Ver todo'),
              const SizedBox(height: 14),
              _actividadReciente(),
              const SizedBox(height: 30),
              _resumenSemanal(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: tarjeta,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: verde,
        unselectedItemColor: secundario,
        onTap: (indice) {
          if (indice == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RecordIncomeScreen(),
              ),
            );
          }
          if (indice == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ListDebtsScreen()),
            );
          }
          if (indice == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Ingreso',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Deudas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }

  Widget _tarjetaDisponible() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: tarjeta,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Disponible para gastar',
                style: TextStyle(color: secundario, fontSize: 15),
              ),
              const Expanded(child: SizedBox()),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B5B2A),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Text(
                  '↗ +14.8%',
                  style: TextStyle(color: verde, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          const Row(
            children: [
              Text(
                '\$24,850.40',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          Container(height: 1, color: const Color(0xFF33394A)),
          const SizedBox(height: 20),
          const Row(
            children: [
              Icon(Icons.south, color: verde),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Ingresos mensuales\n\$8,420.00',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              Icon(Icons.north, color: secundario),
              SizedBox(width: 10),
              Text(
                'Gastos mensuales\n\$3,150.60',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _accesoRapido({
    required IconData icono,
    required String titulo,
    required Color colorIcono,
    required VoidCallback onPressed,
    String? aviso,
  }) {
    return Card(
      color: tarjeta,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: TextButton(
        onPressed: onPressed,
        child: Container(
          height: 110,
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(height: 12),
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  if (aviso != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFB00020),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        aviso,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                        ),
                      ),
                    ),
                  const SizedBox(width: 6),
                ],
              ),
              Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color(0xFF24293A),
                  shape: BoxShape.circle,
                ),
                child: Icon(icono, color: colorIcono),
              ),
              const SizedBox(height: 8),
              Text(
                titulo,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tituloSeccion(String titulo, String accion) {
    return Row(
      children: [
        Text(
          titulo,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Expanded(child: SizedBox()),
        Text(
          accion,
          style: TextStyle(
            color: accion == 'Ver todo' ? verde : secundario,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _proximoPago() {
    return Card(
      color: tarjeta,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFF24293A),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.cloud_done_outlined, color: Colors.white),
            ),
            const SizedBox(width: 14),
            const Expanded(
              child: Text(
                'Apple Silicon Cloud\nVence mañana · Pago automático',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  height: 1.45,
                ),
              ),
            ),
            const Text(
              '\$129.00\nMensual',
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actividadReciente() {
    return Card(
      color: tarjeta,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            _filaActividad(
              Icons.payments_outlined,
              'Pago de Stripe',
              'Flow Labs LLC · Hoy',
              '+\$4,200.00',
              verde,
            ),
            Container(height: 1, color: const Color(0xFF24293A)),
            _filaActividad(
              Icons.fitness_center,
              'Club Equinox',
              'Salud y bienestar · Ayer',
              '-\$280.00',
              Colors.white,
            ),
            Container(height: 1, color: const Color(0xFF24293A)),
            _filaActividad(
              Icons.local_cafe_outlined,
              'Blue Bottle Coffee',
              'Comidas · Hace 2 días',
              '-\$14.50',
              Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _filaActividad(
    IconData icono,
    String titulo,
    String detalle,
    String monto,
    Color colorMonto,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color(0xFF24293A),
              shape: BoxShape.circle,
            ),
            child: Icon(icono, color: secundario),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              '$titulo\n$detalle',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                height: 1.4,
              ),
            ),
          ),
          Text(
            monto,
            style: TextStyle(
              color: colorMonto,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _resumenSemanal() {
    return Card(
      color: tarjeta,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            const Row(
              children: [
                Expanded(
                  child: Text(
                    'Resumen semanal\nVas bien con tu presupuesto',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.45,
                    ),
                  ),
                ),
                Text(
                  '\$740 / \$1,200',
                  style: TextStyle(color: verde, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Container(
              height: 12,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF33394A),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    width: 220,
                    decoration: BoxDecoration(
                      color: verde,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            const Row(
              children: [
                Expanded(child: _BarraDia('Lun', 30, false)),
                Expanded(child: _BarraDia('Mar', 48, false)),
                Expanded(child: _BarraDia('Mié', 24, false)),
                Expanded(child: _BarraDia('Jue', 62, true)),
                Expanded(child: _BarraDia('Vie', 40, false)),
                Expanded(child: _BarraDia('Sáb', 18, false)),
                Expanded(child: _BarraDia('Dom', 12, false)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BarraDia extends StatelessWidget {
  final String dia;
  final double alto;
  final bool activo;

  const _BarraDia(this.dia, this.alto, this.activo);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 65,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: alto,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: activo
                      ? DashboardScreen.verde
                      : const Color(0xFF24293A),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ],
          ),
        ),
        Text(
          dia,
          style: TextStyle(
            color: activo ? DashboardScreen.verde : DashboardScreen.secundario,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
