import 'package:flutter/material.dart';
import '../../data/services/crypto_stream_service.dart';
import '../../domain/entities/crypto_entity.dart';
import '../widgets/price_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _service = CryptoStreamService();

  @override
  void initState() {
    super.initState();
    _service.start();
  }

  @override
  void dispose() {
    _service.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C1B2E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C1B2E),
        title: const Text(
          'Monitor de Criptomonedas',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<List<CryptoEntity>>(
        stream: _service.cryptoStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.tealAccent),
                  SizedBox(height: 16),
                  Text('Cargando precios...', style: TextStyle(color: Colors.white70)),
                ],
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error}',
                style: const TextStyle(color: Colors.redAccent, fontSize: 15),
                textAlign: TextAlign.center,
              ),
            );
          }

          final cryptos = snapshot.data ?? [];
          return RefreshIndicator(
            onRefresh: () async => _service.start(),
            child: ListView.builder(
              itemCount: cryptos.length,
              itemBuilder: (_, i) => PriceCard(crypto: cryptos[i]),
            ),
          );
        },
      ),
    );
  }
}