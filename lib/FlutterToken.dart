import 'package:googleapis_auth/auth_io.dart';

String firebaseMessagingScope = "https://www.googleapis.com/auth/firebase.messaging";

Future<String> getAccessToken() async {

  final client = await clientViaServiceAccount(
      ServiceAccountCredentials.fromJson(
          {
            "type": "test",
            "project_id": "test",
            "private_key_id": "test",
            "private_key": "test",
            "client_email": "test",
            "client_id": "test",
            "auth_uri": "test",
            "token_uri": "test",
            "auth_provider_x509_cert_url": "test",
            "client_x509_cert_url": "test",
            "universe_domain": "test"
          }
      ),
      [firebaseMessagingScope]
  );

  return client.credentials.accessToken.data;

}

