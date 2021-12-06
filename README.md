# 阿里云签名

快速通过 Query Map 获得多数阿里云 SDK 通用的签名。

## 使用方法

传入服务所需的 Access Key Secret 及所有参数，可选 GET 或 POST 方式。

```dart
// 获取签名
final String signature = AliyunSign.signFromQueries(
  accessKeySecret: 'my_access_key_secret',
  queries: <String, String>{
    'AccessKeyId': 'my_access_key_id',
    'Action': 'CreateToken',
    'Format': 'JSON',
    'RegionId': 'cn-shanghai',
    'SignatureMethod': 'HMAC-SHA1',
    'SignatureNonce': 'b924c8c3-6d03-4c5d-ad36-d984d3116788', // 通常使用 Uuid().v4
    'SignatureVersion': '1.0',
    'Timestamp': '2019-04-18T08:32:31Z', // 通常使用 DateTime.now().toUtc().toIso8601String()
    'Version': '2019-02-28',
  },
  method: 'POST', // 默认为 GET
);
```
