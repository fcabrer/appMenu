import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'Ui_Controls_Screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ui Controls'),
      ),
      body: const _UiControlsview(),
    );
  }
}

class _UiControlsview extends StatefulWidget {
  const _UiControlsview();

  @override
  State<_UiControlsview> createState() => _UiControlsviewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsviewState extends State<_UiControlsview> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;

  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            title: const Text('Developer Mode'),
            subtitle: const Text('Controles adicionales'),
            value: isDeveloper,
            onChanged: (value) => setState(() {
                  isDeveloper = !isDeveloper;
                })),
        ExpansionTile(
          title: const Text('Vehiculo de Transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Viajar por carro'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: ((value) => setState(() {
                    selectedTransportation = Transportation.car;
                  })),
            ),
            RadioListTile(
              title: const Text('By Plane'),
              subtitle: const Text('Viajar por Avion'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: ((value) => setState(() {
                    selectedTransportation = Transportation.plane;
                  })),
            ),
            RadioListTile(
              title: const Text('By Boat'),
              subtitle: const Text('Viajar por Barco'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: ((value) => setState(() {
                    selectedTransportation = Transportation.boat;
                  })),
            ),
            RadioListTile(
              title: const Text('By Submarine'),
              subtitle: const Text('Viajar por Submarino'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: ((value) => setState(() {
                    selectedTransportation = Transportation.submarine;
                  })),
            ),
          ],
        ),
        CheckboxListTile(
            title: const Text('Desayuno?'),
            value: wantsBreakfast,
            onChanged: (value) => setState(() {
                  wantsBreakfast = !wantsBreakfast;
                })),
        CheckboxListTile(
            title: const Text('Almuerzo?'),
            value: wantsLunch,
            onChanged: (value) => setState(() {
                  wantsLunch = !wantsLunch;
                })),
        CheckboxListTile(
            title: const Text('Cena?'),
            value: wantsDinner,
            onChanged: (value) => setState(() {
                  wantsBreakfast = !wantsDinner;
                })),
      ],
    );
  }
}
