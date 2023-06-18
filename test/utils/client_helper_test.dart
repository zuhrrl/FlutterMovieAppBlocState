import 'dart:io';

import 'package:ditonton/utils/client_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'client_helper_test.mocks.dart';

@GenerateMocks([BaseRequest])
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late ClientHelper clientHelper;
  late MockBaseRequest mockBaseRequest;

  setUp(() {
    clientHelper = ClientHelper();
    mockBaseRequest = MockBaseRequest();
  });
  test('get http client should not return null', () async {
    // arrange

    // act
    var client = await clientHelper.getHttpClient();

    expect(client, isA<HttpClient>());

    //assert
  });
}
