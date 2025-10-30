import 'package:flutter/material.dart';

// --- COLOR SCHEME FOR PRESENTATION ---
const Color _primaryTeal = Color(0xFF009688); // Primary color for FittedBox section
const Color _primaryBlue = Color(0xFF2196F3); // Primary color for FractionallySizedBox section
const Color _accentLight = Color(0xFFE0F7FA); // Light background for contrast

void main() {
  runApp(const LayoutDemoApp());
}

class LayoutDemoApp extends StatelessWidget {
  const LayoutDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FittedBox & FractionallySizedBox Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const LayoutDemoScreen(),
    );
  }
}

class LayoutDemoScreen extends StatelessWidget {
  const LayoutDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Layout Widgets: FittedBox vs FractionallySizedBox',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: _primaryTeal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // --- SECTION 1: FITTEDBOX (SCALING CONTENT) ---
            const Padding(
              padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: Text(
                '1. FittedBox: Scales Content to Fit',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: _primaryTeal),
              ),
            ),
            const Text(
              'FittedBox changes the size of its child (e.g., text) to ensure it fits perfectly within the parent\'s bounds, preventing overflow.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),

            // Parent Container: Defines the available space (the Constraint)
            Container(
              height: 70,
              width: 250,
              decoration: BoxDecoration(
                border: Border.all(color: _primaryTeal, width: 3),
                borderRadius: BorderRadius.circular(8),
                color: _accentLight,
              ),
              padding: const EdgeInsets.all(8),
              child: const Row(
                children: [
                  Expanded(
                    // The core FittedBox implementation
                    child: FittedBox(
                      // The child text is naturally too large for this space
                      child: Text(
                        'This Text is Scaled to Fit!This Text is Scaled to Fit! ',
                        style: TextStyle(
                          color: _primaryTeal,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.zoom_in, color: _primaryTeal),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // --- SECTION 2: FRACTIONALLYSIZEDBOX (RELATIVE SIZING) ---
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                '2. FractionallySizedBox: Sizes Relative to Parent',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: _primaryBlue),
              ),
            ),
            const Text(
              'This widget ignores its child\'s size and forces it to take up a fraction (percentage) of the parent\'s available space. It\'s ideal for responsive columns.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),

            // Outer Container: The Grandparent (The Screen's Width)
            Container(
              color: Colors.grey.shade200,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Text(
                    'Outer Parent (100% Width)',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 10),

                  // Inner Container (Parent): Defines the constraint for the FractionallySizedBox
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: _primaryBlue, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    // The core FractionallySizedBox implementation
                    child: FractionallySizedBox(
                      // This forces the child to be 75% of the parent's width...
                      widthFactor: 1.0,
                      // ... and 50% of the parent's height
                      heightFactor: 0.25,
                      
                      alignment: Alignment.center, // Center the smaller child
                      
                      child: Container(
                        decoration: BoxDecoration(
                          color: _primaryBlue.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Center(
                          child: Text(
                            '75% Width, 50% Height',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}