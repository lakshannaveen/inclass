import 'package:flutter/material.dart';
import 'add.dart'; // Import AddPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulating dynamic booking data, this can be fetched from an API or database.
    List<Map<String, String>> bookings = [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Set AppBar color to blue
        title: const Text('Booking System'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Navigate to AddPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Bookings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: bookings.isEmpty
                  ? const Center(child: Text('No bookings available.'))
                  : ListView.builder(
                      itemCount: bookings.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(bookings[index]['title'] ??
                                'Booking ${index + 1}'),
                            subtitle: Text(bookings[index]['details'] ??
                                'Details not available'),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () {
                              // Handle booking tap
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add logic for button press, for example, navigating to a new page or adding data
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
