import 'package:flutter/material.dart';
import 'package:jayem_agencies/core/themes/app_theme.dart';
import 'package:jayem_agencies/presentation/providers/start_transport_provider.dart';
import 'package:provider/provider.dart';

class StartTransportScreen extends StatelessWidget {
  const StartTransportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StartTransportProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF7F00FF), Color(0xFF00C6FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              "Jayem\nAgencies",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF2196F3), Color(0xFF9C27B0)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(28),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Start New\nTransport',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.whiteText),
                  ),
                  _buildInputField(
                    context,
                    "Driver",
                    provider.driver,
                    provider.setDriver,
                  ),
                  _buildInputField(
                    context,
                    "Vehicle",
                    provider.vehicle,
                    provider.setVehicle,
                  ),
                  _buildInputField(
                    context,
                    "Warehouse",
                    provider.warehouse,
                    provider.setWarehouse,
                  ),
                  _buildInputField(
                    context,
                    "Destination store",
                    provider.destinationStore,
                    provider.setDestinationStore,
                  ),
                  _buildInputField(
                    context,
                    "Start reading",
                    provider.startReading,
                    provider.setStartReading,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: provider.submitTransport,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ).copyWith(
                      backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => null,
                      ),
                      elevation: MaterialStateProperty.all(0),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        // gradient: const LinearGradient(
                        //   colors: [Color(0xFF2196F3), Color(0xFF9C27B0)],
                        // ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "Start Transport",
                          style: TextStyle(
                            color: Color(0xFF9C27B0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // TextButton(
            //   onPressed: () => Navigator.pop(context),
            //   child: const Text(
            //     "Back to list",
            //     style: TextStyle(fontWeight: FontWeight.bold),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(
    BuildContext context,
    String label,
    String? value,
    Function(String) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextFormField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: Colors.white),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            border: InputBorder.none,
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
