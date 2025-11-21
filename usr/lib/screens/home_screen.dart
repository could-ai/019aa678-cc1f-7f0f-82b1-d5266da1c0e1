import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Umer Software', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          TextButton(onPressed: () {}, child: const Text('Home')),
          TextButton(onPressed: () {}, child: const Text('Projects')),
          TextButton(onPressed: () {}, child: const Text('Courses')),
          TextButton(onPressed: () {}, child: const Text('Support')),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: const Text('Login'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () => Navigator.pushNamed(context, '/signup'),
              child: const Text('Sign Up'),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Hero Section
              FadeTransition(
                opacity: _animation,
                child: Container(
                  height: screenSize.height * 0.6,
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome to Umer Software',
                          style: TextStyle(
                            fontSize: screenSize.width > 800 ? 50 : 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade800,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Your one-stop solution for learning, teaching, and project collaboration.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenSize.width > 800 ? 22 : 18,
                            color: Colors.black54,
                          ),
                        ),
                         const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                            textStyle: const TextStyle(fontSize: 18)
                          ),
                          child: const Text('Explore Projects'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // Placeholder for other sections
              const SizedBox(height: 40),
              const Text("Featured Projects", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              // Add project list here
              const SizedBox(height: 20),
              const Text("Latest Posts", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              // Add post list here
               const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
