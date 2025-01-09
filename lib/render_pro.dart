library render_pro;

import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;
import 'dart:developer' as developer;

/// A class to manage image preloading and caching.
class RenderPro {
  static final Map<String, ui.Image> _imageCache = {};

  /// Initialize the RenderPro by preloading the provided image URLs.
  static Future<void> init(List<String> urls) async {
    for (final url in urls) {
      await _preloadImage(url);
    }
  }

  /// Preloads a single image and stores it in the cache.
  static Future<void> _preloadImage(String url) async {
    try {
      final imageData = await _fetchImage(url);
      final codec = await ui.instantiateImageCodec(imageData);
      final frame = await codec.getNextFrame();
      _imageCache[url] = frame.image;
    } catch (e) {
      developer.log(
        'Failed to preload image',
        name: 'RenderPro',
        error: e,
        stackTrace: StackTrace.current,
      );
    }
  }

  /// Fetches image data from a network URL.
  static Future<Uint8List> _fetchImage(String url) async {
    final uri = Uri.parse(url);
    if (kIsWeb) {
      // Web-compatible image fetching
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return response.bodyBytes;
      } else {
        throw Exception("Failed to load image from $url");
      }
    } else {
      // Non-web image fetching
      final request = await HttpClient().getUrl(uri);
      final response = await request.close();
      if (response.statusCode == 200) {
        return await consolidateHttpClientResponseBytes(response);
      } else {
        throw Exception("Failed to load image from $url");
      }
    }
  }

  /// Retrieves a preloaded image from the cache.
  static ui.Image? getImage(String url) {
    return _imageCache[url];
  }
}

/// A widget to display preloaded images.
class RenderProImage extends StatelessWidget {
  final String url;
  final Widget? placeholder;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;
  final FilterQuality? filterQuality;

  const RenderProImage({
    required this.url,
    this.placeholder,
    this.height,
    this.width,
    this.fit,
    this.alignment,
    this.filterQuality,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cachedImage = RenderPro.getImage(url);

    if (cachedImage != null) {
      return Container(
        height: height,
        width: width,
        alignment: alignment,
        child: RawImage(
          image: cachedImage,
          fit: fit,
          filterQuality: filterQuality ?? FilterQuality.low,
        ),
      );
    } else {
      return Image.network(
        url,
        height: height,
        width: width,
        fit: fit,
        alignment: alignment ?? Alignment.center,
        filterQuality: filterQuality ?? FilterQuality.low,
        errorBuilder: (context, error, stackTrace) {
          return placeholder ?? const Icon(Icons.broken_image);
        },
      );
    }
  }
}
