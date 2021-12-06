library aliyun_sign;

import 'dart:convert';

import 'package:crypto/crypto.dart';

class AliyunSign {
  const AliyunSign._();

  static String signFromQueries({
    required String accessKeySecret,
    required Map<String, String> queries,
    String method = 'GET',
  }) {
    final List<String> _sortedKeys = queries.keys.toList()..sort();
    final Map<String, String> _queries = <String, String>{
      for (final String k in _sortedKeys) encode(k): encode(queries[k]!),
    };
    final List<String> _formalizedStringPair = <String>[
      for (final MapEntry<String, String> e in _queries.entries)
        '${e.key}=${e.value}',
    ];
    final String _formalizedString = _formalizedStringPair.join('&');
    final String _signString = '$method'
        '&${encode('/')}'
        '&${encode(_formalizedString)}';
    final String _signature = encode(
      base64Encode(
        Hmac(
          sha1,
          utf8.encode(accessKeySecret + '&'),
        ).convert(utf8.encode(_signString)).bytes,
      ),
    );
    final String query = _queries.entries.fold(
      <String>[],
      (List<String> pre, MapEntry<String, String> e) =>
          pre..add('${e.key}=${e.value}'),
    ).join('&');
    return 'Signature=$_signature&$query';
  }

  static String encode(String value) {
    return Uri.encodeComponent(value)
        .replaceAll('+', '%20')
        .replaceAll('*', '%2A')
        .replaceAll('%7E', '~');
  }
}
