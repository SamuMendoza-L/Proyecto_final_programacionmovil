import 'package:flutter/material.dart';

class DetalleDeudaScreen extends StatelessWidget {
  final String titulo;
  final String monto;
  final String fecha;

  const DetalleDeudaScreen({
    super.key,
    required this.titulo,
    required this.monto,
    required this.fecha,
  });

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
          'Detalle de deuda',
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
          padding: const EdgeInsets.fromLTRB(28, 14, 28, 32),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: tarjeta,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 9,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF24293A),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '● DEUDA ACTIVA',
                        style: TextStyle(
                          color: secundario,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      titulo,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 31,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 9),
                    const Text(
                      'Obligación financiera de FlowCash',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: secundario, fontSize: 16),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: 205,
                      height: 205,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFF161B2B),
                        shape: BoxShape.circle,
                        border: Border.all(color: verde, width: 14),
                      ),
                      child: const Text(
                        '58% PAGADO\n\$8,800\nTotal abonado',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          height: 1.6,
                        ),
                      ),
                    ),
                    const SizedBox(height: 34),
                    const Text(
                      'MONTO PENDIENTE',
                      style: TextStyle(
                        color: secundario,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$$monto',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 22),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF24293A),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Próximo pago: fecha límite $fecha',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: secundario, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 26),
              Row(
                children: [
                  Expanded(
                    child: _tarjetaInfo(
                      Icons.percent,
                      'Tasa de interés',
                      '4.25% APR',
                      'Tasa fija',
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: _tarjetaInfo(
                      Icons.payments_outlined,
                      'Cuota mensual',
                      '\$650.00',
                      'Programada',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: _tarjetaInfo(
                      Icons.timelapse_outlined,
                      'Plazo restante',
                      '10 meses',
                      'Estado: activa',
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: _tarjetaInfo(
                      Icons.account_balance_outlined,
                      'Cuenta de pago',
                      'Bóveda',
                      'Pago automático',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 34),
              const Row(
                children: [
                  Text(
                    'Historial de pagos',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    'Ver estado',
                    style: TextStyle(color: verde, fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _historialPagos(),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: verde,
                    foregroundColor: fondo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    'Volver',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tarjetaInfo(
    IconData icono,
    String etiqueta,
    String valor,
    String detalle,
  ) {
    return Container(
      height: 168,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: tarjeta,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  etiqueta,
                  style: const TextStyle(color: secundario, fontSize: 15),
                ),
              ),
              Icon(icono, color: verde),
            ],
          ),
          const Expanded(child: SizedBox()),
          Row(
            children: [
              Text(
                valor,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  detalle,
                  style: const TextStyle(color: verde, fontSize: 13),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _historialPagos() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: tarjeta,
        borderRadius: BorderRadius.circular(28),
      ),
      child: const Column(
        children: [
          _PagoHistorial('Principal e interés', 'Oct 05, 2025', '-\$650.00'),
          _PagoHistorial('Principal e interés', 'Sep 05, 2025', '-\$650.00'),
          _PagoHistorial('Principal e interés', 'Ago 05, 2025', '-\$650.00'),
        ],
      ),
    );
  }
}

class _PagoHistorial extends StatelessWidget {
  final String titulo;
  final String fecha;
  final String monto;

  const _PagoHistorial(this.titulo, this.fecha, this.monto);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Color(0xFFB2F722)),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              '$titulo\n$fecha · Procesado',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.45,
              ),
            ),
          ),
          Text(
            monto,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
