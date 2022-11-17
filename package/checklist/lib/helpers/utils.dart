import 'package:encrypt/encrypt.dart';

const apiSecureKey="8080808080808080";

String encryptString(String privateKey, String msg) {

  if(apiSecureKey.isNotEmpty && msg.isNotEmpty) {
    final key = Key.fromUtf8(apiSecureKey);
    final iv = IV.fromUtf8(apiSecureKey);
    final encrypt = Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));
    return encrypt
        .encrypt(msg, iv: iv)
        .base64;
  }else{
    return msg;
  }

}

decryptString(String privateKey, Encrypted msg) {
  final key = Key.fromUtf8(apiSecureKey);
  final iv = IV.fromUtf8(apiSecureKey);
  final encrypt = Encrypter(AES(
    key,
    mode: AESMode.cbc,
  ));
  return encrypt.decrypt(msg, iv: iv);
}
