// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:render_pro/render_pro.dart';

void main() async {
  // Ensure bindings are initialized before preloading images
  WidgetsFlutterBinding.ensureInitialized();

  // Run the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RenderPro Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imageUrls = Global().imageUrls;

  @override
  void initState() {
    super.initState();
    List<String> initialImageUrls = imageUrls;
    RenderPro.init(initialImageUrls);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RenderPro Example'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Loading images for next screen:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NextScreen(),
                    ));
              },
              child: const Text("HomeScreen"))
        ],
      ),
    );
  }
}

class Global {
  List<String> imageUrls = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrX7nxND2CUn9u_vklCWYEzIzbuNHzQfLmIw&s',
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmCy16nhIbV3pI1qLYHMJKwbH2458oiC9EmA&s",
    "https://fps.cdnpk.net/images/home/subhome-ai.webp?w=649&h=649",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZz_aEaEAX0yAzanEe_wfwTHlzCnad7IkNKzHs4NS-NIZ66QfCRVILJRZvhgfMEP_txgU&usqp=CAU",
    "https://i0.wp.com/picjumbo.com/wp-content/uploads/beautiful-fall-waterfall-free-image.jpeg?w=600&quality=80",
    "https://thumbs.dreamstime.com/b/incredibly-beautiful-sunset-sun-lake-sunrise-landscape-panorama-nature-sky-amazing-colorful-clouds-fantasy-design-115177001.jpg",
    'https://images.samsung.com/levant/smartphones/galaxy-s24-ultra/images/galaxy-s24-ultra-highlights-color-carousel-global-mo.jpg?imbypass=true',
    'https://img.freepik.com/premium-photo/aesthetic-sky-background_636537-267412.jpg',
  ];
}

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder image URLs (already preloaded in main)
    final placeholderImageUrls = Global().imageUrls;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Loaded Network Images'),
      ),
      body: ListView.builder(
        itemCount: placeholderImageUrls.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: RenderProImage(
                width: double.infinity,
                url: placeholderImageUrls[index],
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                placeholder: const CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }
}
