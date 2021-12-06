import 'package:flutter_test/flutter_test.dart';

import 'package:aliyun_sign/aliyun_sign.dart';

void main() {
  test('Signature test', () {
    final Map<String, String> queries = <String, String>{
      'AccessKeyId': 'my_access_key_id',
      'Action': 'CreateToken',
      'Format': 'JSON',
      'RegionId': 'cn-shanghai',
      'SignatureMethod': 'HMAC-SHA1',
      'SignatureNonce': 'b924c8c3-6d03-4c5d-ad36-d984d3116788',
      'SignatureVersion': '1.0',
      'Timestamp': '2019-04-18T08:32:31Z',
      'Version': '2019-02-28',
    };
    final String signature = AliyunSign.signFromQueries(
      accessKeySecret: 'my_access_key_secret',
      queries: queries,
    );
    expect(
      signature,
      equals(
        'Signature=hHq4yNsPitlfDJ2L0nQPdugdEzM%3D'
        '&AccessKeyId=my_access_key_id'
        '&Action=CreateToken'
        '&Format=JSON'
        '&RegionId=cn-shanghai'
        '&SignatureMethod=HMAC-SHA1'
        '&SignatureNonce=b924c8c3-6d03-4c5d-ad36-d984d3116788'
        '&SignatureVersion=1.0'
        '&Timestamp=2019-04-18T08%3A32%3A31Z'
        '&Version=2019-02-28',
      ),
    );
  });
}
