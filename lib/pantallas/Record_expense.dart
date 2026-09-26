import 'package:flutter/material.dart';

class RecordExpenseScreen extends StatefulWidget {
  const RecordExpenseScreen({super.key});

  @override
  State<RecordExpenseScreen> createState() => _RecordExpenseScreenState();
}

class _RecordExpenseScreenState extends State<RecordExpenseScreen> {
  final TextEditingController montoController = TextEditingController(
    text: '385.50',
  );
  final TextEditingController categoriaController = TextEditingController(
    text: 'Viajes y comidas',
  );
  final TextEditingController descripcionController = TextEditingController(
    text: 'Cena de equipo en Nobu Downtown',
  );
  final TextEditingController fechaController = TextEditingController(
    text: 'Hoy, 24 de octubre',
  );

  static const Color fondo = Color(0xFF0D1322);
  static const Color tarjeta = Color(0xFF1A1F2F);
  static const Color campo = Color(0xFF24293A);
  static const Color secundario = Color(0xFFC0C6DD);
  static const Color verde = Color(0xFFB2F722);
  static const Color coral = Color(0xFFFFB4AB);

  @override
  void dispose() {
    montoController.dispose();
    categoriaController.dispose();
    descripcionController.dispose();
    fechaController.dispose();
    super.dispose();
  }

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
          'Acción rápida',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: Text(
              'F.',
              style: TextStyle(
                color: verde,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 22, 24, 32),
          child: Column(
            children: [
              _tarjetaMonto(),
              const SizedBox(height: 26),
              _tarjetaCategoria(),
              const SizedBox(height: 26),
              _tarjetaDescripcion(),
              const SizedBox(height: 26),
              Row(
                children: [
                  Expanded(child: _tarjetaFecha()),
                  const SizedBox(width: 18),
                  Expanded(child: _tarjetaPago()),
                ],
              ),
              const SizedBox(height: 26),
              _tarjetaRecibo(),
              const SizedBox(height: 42),
              SizedBox(
                width: double.infinity,
                height: 62,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: verde,
                    foregroundColor: fondo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle_outline),
                      SizedBox(width: 12),
                      Text(
                        'Guardar gasto',
                        style: TextStyle(
                          fontSize: 19,
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

  Widget _tarjetaMonto() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: tarjeta,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'MONTO DEL GASTO',
                style: TextStyle(
                  color: secundario,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const Expanded(child: SizedBox()),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: campo,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'USD (\$)  ⌄',
                  style: TextStyle(color: secundario),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              const Text('\$', style: TextStyle(color: coral, fontSize: 48)),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: montoController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              _MontoRapido('+ \$20'),
              SizedBox(width: 10),
              _MontoRapido('+ \$50'),
              SizedBox(width: 10),
              _MontoRapido('+ \$100'),
              Expanded(child: SizedBox()),
              Text('Limpiar', style: TextStyle(color: coral, fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tarjetaCategoria() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: tarjeta,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                'Categoría',
                style: TextStyle(color: secundario, fontSize: 18),
              ),
              Expanded(child: SizedBox()),
              Text(
                '✦ Categorizado',
                style: TextStyle(color: verde, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: campo,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                Container(
                  width: 62,
                  height: 62,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color(0xFF50576C),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.restaurant, color: verde, size: 32),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: categoriaController,
                    style: const TextStyle(color: Colors.white, fontSize: 19),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      helperText: 'Deducible de impuestos · Comidas de negocio',
                      helperStyle: TextStyle(color: secundario, fontSize: 13),
                    ),
                  ),
                ),
                const Icon(Icons.tune, color: secundario),
              ],
            ),
          ),
          const SizedBox(height: 18),
          const Row(
            children: [
              _Etiqueta('Comidas', true),
              SizedBox(width: 10),
              _Etiqueta('Viajes', false),
              SizedBox(width: 10),
              _Etiqueta('Oficina', false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tarjetaDescripcion() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: tarjeta,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                'Descripción',
                style: TextStyle(color: secundario, fontSize: 18),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextField(
            controller: descripcionController,
            style: const TextStyle(color: Colors.white, fontSize: 18),
            decoration: const InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.edit_note, color: secundario),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tarjetaFecha() {
    return Container(
      height: 142,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: tarjeta,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Text('Fecha', style: TextStyle(color: secundario, fontSize: 17)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.calendar_today_outlined, color: verde),
              const SizedBox(width: 9),
              Expanded(
                child: TextField(
                  controller: fechaController,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tarjetaPago() {
    return Container(
      height: 142,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: tarjeta,
        borderRadius: BorderRadius.circular(28),
      ),
      child: const Column(
        children: [
          Row(
            children: [
              Text(
                'Pagado con',
                style: TextStyle(color: secundario, fontSize: 17),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.credit_card, color: Color(0xFF6BFCBB)),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Metal (••4190)',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tarjetaRecibo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: tarjeta,
        borderRadius: BorderRadius.circular(28),
      ),
      child: const Row(
        children: [
          Icon(Icons.receipt_long, color: verde, size: 38),
          SizedBox(width: 18),
          Expanded(
            child: Text(
              'Adjuntar recibo o factura\n📷 Toca para escanear o soltar archivo',
              style: TextStyle(color: Colors.white, fontSize: 17, height: 1.6),
            ),
          ),
          Text('Opcional', style: TextStyle(color: secundario)),
        ],
      ),
    );
  }
}

class _MontoRapido extends StatelessWidget {
  final String texto;

  const _MontoRapido(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF24293A),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Text(texto, style: const TextStyle(color: Color(0xFFC0C6DD))),
    );
  }
}

class _Etiqueta extends StatelessWidget {
  final String texto;
  final bool activa;

  const _Etiqueta(this.texto, this.activa);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: activa ? const Color(0xFFB2F722) : const Color(0xFF24293A),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Text(
        texto,
        style: TextStyle(
          color: activa ? const Color(0xFF0D1322) : const Color(0xFFC0C6DD),
        ),
      ),
    );
  }
}
