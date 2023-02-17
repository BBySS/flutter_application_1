// ignore_for_file: constant_identifier_names

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

const String USERPOOL_ID = 'eu-west-2_HwMniis2i';
const String APPCLIENT_ID = '2s531346dsarpsqlba11le1eqf';
const String REGION = 'eu-west-2';

Future<AmplifyConfig> amplifyConfig() async {
  final authPlugin = AmplifyAuthCognito();
  await Amplify.addPlugin(authPlugin);

  return const AmplifyConfig(
    auth: AuthConfig(
      plugins: {
        CognitoPluginConfig.pluginKey: CognitoPluginConfig(
          userAgent: 'aws-amplify/cli',
          version: '0.1.0',
          identityManager: AWSConfigMap({
            'Default': CognitoIdentityManager(),
          }),
          auth: AWSConfigMap({
            // 'Default': CognitoAuthConfig(
            // oAuth: CognitoOAuthConfig(
            //   appClientId: APPCLIENT_ID,
            //   scopes: [
            //     'email',
            //     'profile',
            //   ],
            //   signInRedirectUri: OAUTH_SIGNIN,
            //   signOutRedirectUri: OAUTH_SIGNOUT,
            //   webDomain: OAUTH_DOMAIN,
            // ),
            // authenticationFlowType: AuthenticationFlowType.userSrpAuth,
            // ),
            'Default': CognitoAuthConfig(
              authenticationFlowType: AuthenticationFlowType.customAuth,
            ),
          }),
          cognitoUserPool: AWSConfigMap({
            // 'CustomEndpoint': CognitoUserPoolConfig(
            //   poolId: USERPOOL_ID,
            //   appClientId: APPCLIENT_ID,
            //   // appClientSecret: APPCLIENT_SECRET,
            //   endpoint: OAUTH_DOMAIN,
            //   region: REGION,
            // ),
            'Default': CognitoUserPoolConfig(
              poolId: USERPOOL_ID,
              appClientId: APPCLIENT_ID,
              // appClientSecret: APPCLIENT_SECRET,
              region: REGION,
              // hostedUI: CognitoOAuthConfig(
              //   appClientId: APPCLIENT_ID,
              //   // appClientSecret: APPCLIENT_SECRET,
              //   scopes: ['openid', 'email'],
              //   signInRedirectUri: OAUTH_SIGNIN,
              //   signOutRedirectUri: OAUTH_SIGNOUT,
              //   webDomain: OAUTH_DOMAIN,
              // ),
            ),
            // 'DefaultCustomAuth': CognitoUserPoolConfig(
            //   poolId: USERPOOL_ID,
            //   appClientId: APPCLIENT_ID,
            //   appClientSecret: APPCLIENT_SECRET,
            //   region: REGION,
            // ),
          }),
          credentialsProvider: CredentialsProviders({
            'CognitoIdentity': AWSConfigMap({
              'Default': CognitoIdentityCredentialsProvider(
                poolId: USERPOOL_ID,
                region: REGION,
              ),
            }),
          }),
        ),
      },
    ),
  );
}
