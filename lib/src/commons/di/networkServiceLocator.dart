import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
 import 'package:crypdo/src/commons/di/preferenceServiceLocator.dart';
import 'package:crypdo/src/commons/utils/authentication/AuthenticationInterceptor.dart';
import 'package:crypdo/src/commons/utils/authentication/AuthenticationPrefManger.dart';
import 'package:crypdo/src/commons/utils/authentication/AuthenticationRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypdo/src/commons/utils/mockNetwork/http_mock_adapter.dart';

GetIt getIt = GetIt.I;

const String BASE_URL = "http://37.152.182.49:8080/";
const int CONNECT_TIMEOUT = 10000;

const String BASE_DIO_CLIENT = "BASE_DIO_CLIENT";

const String AUTHENTICATED_INTERCEPTOR = "AUTHENTICATED_INTERCEPTOR";
const String AUTHENTICATED_DIO_CLIENT = "AUTHENTICATED_DIO_CLIENT";
const String MOCK_DIO_CLIENT = "MOCK_DIO_CLIENT";

setUpNetworkServiceLocator() {
  getIt.registerSingleton<Dio>(
      Dio(BaseOptions(baseUrl: BASE_URL, connectTimeout: CONNECT_TIMEOUT)),
      instanceName: BASE_DIO_CLIENT);


  getIt.registerSingletonAsync<Dio>(
          () =>  getMockClient(),
      instanceName: MOCK_DIO_CLIENT);


  getIt.registerSingletonWithDependencies<AuthenticationPrefManger>(
      () => AuthenticationPrefMangerImp(
          defaultPreferences: getIt.get<SharedPreferences>(instanceName: BASE_PREFERENCES)),
      dependsOn: [InitDependency(SharedPreferences, instanceName: BASE_PREFERENCES)]);

  getIt.registerSingletonWithDependencies<AuthenticationRepository>(
      () => AuthenticationRepositoryImp(prefManger: getIt.get<AuthenticationPrefManger>())
  ,dependsOn: [AuthenticationPrefManger]);


  getIt.registerSingletonWithDependencies<Interceptor>(
      () => AuthenticationInterceptor(repository: getIt.get<AuthenticationRepository>()),
      instanceName: AUTHENTICATED_INTERCEPTOR,dependsOn: [AuthenticationRepository]);

  getIt.registerSingletonWithDependencies<Dio>(
      ()  =>   getAuthenticatedClient(getIt.get<Interceptor>(instanceName: AUTHENTICATED_INTERCEPTOR)),
      instanceName: AUTHENTICATED_DIO_CLIENT, dependsOn: [InitDependency(Interceptor, instanceName: AUTHENTICATED_INTERCEPTOR)]);

}

Dio getAuthenticatedClient( Interceptor authenticatedInterceptor) {
  Dio baseDio = Dio(BaseOptions(baseUrl: BASE_URL, connectTimeout: CONNECT_TIMEOUT));
  baseDio.interceptors.add(authenticatedInterceptor);
  baseDio.interceptors.add(LogInterceptor(requestBody: true));
  return baseDio;
}

Future<Dio> getMockClient() async {
  Dio dio = Dio(BaseOptions(baseUrl: BASE_URL, connectTimeout: CONNECT_TIMEOUT));
  creteMockAdapter(dio);
  dio.interceptors.add(LogInterceptor(requestBody: true));
   return dio;
}

DioAdapter creteMockAdapter( Dio dio){

  final dioAdapter = DioAdapter(dio: dio);

  const homeData = '/api/v1/home';

  dioAdapter.onPost(homeData, (server) => server.reply(200,
      {"wallet":{
        "balance": 10000,
      },
        "titleItems":[{
          "key":"BUY_SELL",
          "nameEn":"buy and sell",
          "icon":"https://www.uplooder.net/img/image/29/84b9b679f8abed502560da179a708539/profits.svg",


        },
          {
          "key":"TRANSFER",
          "nameEn":"transfer",
            "icon":"https://www.uplooder.net/img/image/100/5e2b8aecabb178be1ac2c5f51c9af5fb/switch.svg",


          },
          {
          "key":"CACHE_WALLET",
          "nameEn":"wallet",
            "icon":"https://www.uplooder.net/img/image/48/a0edac0f0cfc17c1222fb16bf1c73a6e/wallet.svg",

          }

        ]
      }

      ));


  const currencyData = '/api/v1/assets';

  dioAdapter.onGet(currencyData, (server) => server.reply(200,
    [{
      "name":"bitcoin",
      "color":"#DDDDDD",
      "count":5.0
    },{
      "name":"lightcoin",
      "color":"#F0F0F0",
      "count":3.0,
    }
      ,{
      "name":"tether",
      "color":"#DFDFDF",
      "count":6.0,
    }  ,{
      "name":"cardano",
      "color":"#E3E3E3",
      "count":1.0,
    }
    ]

  ));
  const contacts = '/api/v1/contacts';

  dioAdapter.onGet(contacts, (server) => server.reply(200,
      [{
        "name":"jimmy",
        "family":"mcgill",
        "mobileNumber":0912121212,
        "address":1,
      },{
        "name":"soul",
        "family":"goodman",
        "mobileNumber":0912121212,
        "address":3,
      }
        ,{
        "name":"jessy",
        "family":"pinkman",
        "mobileNumber":0912121212,
        "address":3,
      }  ,{
        "name":"jordan",
        "color":"peterson",
        "mobileNumber":0912121212,
        "address":4,
      }
      ]

  ));





  return dioAdapter;

}

