import 'package:flutter/material.dart';

class RecordIncomeScreen extends StatefulWidget {
  const RecordIncomeScreen({super.key});

  @override
  State<RecordIncomeScreen> createState() => _RecordIncomeScreenState();
}

class _RecordIncomeScreenState extends State<RecordIncomeScreen> {
  final TextEditingController montoController = TextEditingController(
    text: '4,500.00',
  );
  final TextEditingController categoriaController = TextEditingController(
    text: 'Consultoría y servicios',
  );
  final TextEditingController fechaController = TextEditingController(
    text: 'Hoy, 24 de octubre de 2025',
  );
  final TextEditingController notaController = TextEditingController();

  static const Color fondo = Color(0xFF0D1322);
  static const Color tarjeta = Color(0xFF1A1F2F);
  static const Color campo = Color(0xFF24293A);
  static const Color secundario = Color(0xFFC0C6DD);
  static const Color verde = Color(0xFFB2F722);

  @override
  void dispose() {
    montoController.dispose();
    categoriaController.dispose();
    fechaController.dispose();
    notaController.dispose();
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
              Container(
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
                          'MONTO DEL INGRESO',
                          style: TextStyle(
                            color: secundario,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: campo,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            '● USD (\$)⌄',
                            style: TextStyle(color: secundario),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    Row(
                      children: [
                        const Text(
                          '\$',
                          style: TextStyle(color: verde, fontSize: 48),
                        ),
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
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    const Row(
                      children: [
                        Text(
                          'Saldo disponible estimado',
                          style: TextStyle(color: secundario, fontSize: 15),
                        ),
                        Expanded(child: SizedBox()),
                        Text(
                          'Disponible al instante',
                          style: TextStyle(
                            color: Color(0xFF6BFCBB),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _tarjetaCategoria(),
              const SizedBox(height: 24),
              _tarjetaFecha(),
              const SizedBox(height: 24),
              _tarjetaDestino(),
              const SizedBox(height: 24),
              Container(
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
                          'Nota / referencia (opcional)',
                          style: TextStyle(color: secundario, fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: notaController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Ej.: pago de asesoría del cuarto trimestre',
                        hintStyle: TextStyle(color: Color(0xFF687043)),
                        prefixIcon: Icon(Icons.edit_note, color: secundario),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 38),
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
                      Icon(Icons.south),
                      SizedBox(width: 10),
                      Text(
                        'Guardar ingreso',
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
            ],
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: campo,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFF164746),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Icon(
                    Icons.business_center_outlined,
                    color: verde,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: TextField(
                    controller: categoriaController,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down, color: secundario),
              ],
            ),
          ),
          const SizedBox(height: 18),
          const Row(
            children: [
              _Etiqueta('Salario'),
              SizedBox(width: 8),
              _Etiqueta('Freelance'),
              SizedBox(width: 8),
              _Etiqueta('Inversión'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tarjetaFecha() {
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
                'Fecha del depósito',
                style: TextStyle(color: secundario, fontSize: 18),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 62,
                height: 62,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: campo,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  controller: fechaController,
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
              const Icon(Icons.calendar_month_outlined, color: secundario),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tarjetaDestino() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: tarjeta,
        borderRadius: BorderRadius.circular(28),
      ),
      child: const Column(
        children: [
          Row(
            children: [
              Text(
                'Depositar en',
                style: TextStyle(color: secundario, fontSize: 18),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.account_balance_outlined, color: verde, size: 34),
              SizedBox(width: 18),
              Expanded(
                child: Text(
                  'Bóveda principal de FlowCash\nCuenta corriente ••8842',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    height: 1.5,
                  ),
                ),
              ),
              Icon(Icons.swap_horiz, color: secundario),
            ],
          ),
        ],
      ),
    );
  }
}

class _Etiqueta extends StatelessWidget {
  final String texto;

  const _Etiqueta(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF24293A),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Text(texto, style: const TextStyle(color: Color(0xFFC0C6DD))),
    );
  }
}
