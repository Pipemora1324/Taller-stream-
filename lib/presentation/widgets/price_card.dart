import 'package:flutter/material.dart';
import '../../domain/entities/crypto_entity.dart';

class PriceCard extends StatelessWidget {
  final CryptoEntity crypto;

  const PriceCard({super.key, required this.crypto});

  @override
  Widget build(BuildContext context) {
    final isPositive = crypto.change24h >= 0;
    final color = isPositive ? Colors.green : Colors.red;
    final icon = isPositive ? Icons.trending_up : Icons.trending_down;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        border: Border.all(color: color.withValues(alpha: 0.4)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.15),
          child: Icon(icon, color: color),
        ),
        title: Text(
          crypto.name,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        subtitle: Text(
          'Variación 24h: ${crypto.change24h.toStringAsFixed(2)}%',
          style: TextStyle(color: color, fontSize: 13),
        ),
        trailing: Text(
          '\$${crypto.priceUsd.toStringAsFixed(2)}',
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}