import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

import '../models/dto/product_dto.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';

class ProductController {
  ProductController(this._productService);

  final ProductService _productService;

  FutureOr<Response> getAll(Request request) async {
    try {
      final List<ProductModel> products = await _productService.findAll();
      return Response.ok(
          jsonEncode({
            'products': products.map((product) => product.toMap()).toList(),
          }),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          });
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode({'error': e.toString()}),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
    }
  }

  FutureOr<Response> get(Request request, String id) async {
    final int? productId = int.tryParse(id);
    try {
      final ProductModel product = await _productService.find(productId ?? 0);
      return Response(200, body: jsonEncode(product.toMap()), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      });
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode({'error': e.toString()}),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
    }
  }

  FutureOr<Response> create(Request request) async {
    final String body = await request.readAsString();
    final Map<String, dynamic> product = jsonDecode(body);
    final ProductDto dto = ProductDto.fromMap(product);
    try {
      final ProductModel productModel = await _productService.create(dto);
      return Response(201, body: jsonEncode(productModel.toMap()), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      });
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode({'error': e.toString()}),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
    }
  }

  FutureOr<Response> update(Request request) async {
    final String body = await request.readAsString();
    final Map<String, dynamic> product = jsonDecode(body);
    final ProductDto dto = ProductDto.fromMap(product);
    try {
      final ProductModel productModel = await _productService.update(dto);
      return Response(200, body: jsonEncode(productModel.toMap()), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      });
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode({'error': e.toString()}),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
    }
  }

  FutureOr<Response> delete(Request request, String id) async {
    final int? productId = int.tryParse(id);
    try {
      await _productService.delete(productId ?? 0);
      return Response(204,
          body: jsonEncode({'success': 'Deleted with success'}),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          });
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode({'error': e.toString()}),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
    }
  }
}
