import 'package:flutter/material.dart';
import 'package:myapp/models/data_dashboard.dart';

class CardAdmin extends StatelessWidget {
  final DataDashboard data;

  const CardAdmin({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.45,
      child: Card(
        child: SizedBox(
          width: double.infinity,
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data.value,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 8,
              ),
              Text('${data.name} Creados')
            ],
          ),
        ),
      ),
    );
  }
}
