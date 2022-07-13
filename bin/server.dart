import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import '../src/controllers/product_controller.dart';
import '../src/services/product_service.dart';

// Configure routes.
final _router = Router();

void main(List<String> args) async {
  final ProductService productService = ProductService();
  final ProductController productController = ProductController(productService);

  _router
    ..get('/product', productController.getAll)
    ..get('/product/<id>', productController.get)
    ..post('/product', productController.create)
    ..put('/product', productController.update)
    ..delete('/product/<id>', productController.delete);

  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler =
      const Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
