 
# Crypdo Flutterπ Demo App

A demo flutter  app for cryptocurrency trading, wallet balance,send cryptro to contacts and ...  
 
 

## Screen records βΊ
![r1](https://github.com/alirezaHabibpour/crypdo/blob/master/demo-records/1.gif)
,![r2](https://github.com/alirezaHabibpour/crypdo/blob/master/demo-records/2.gif)
<br />

## Tools π§

- [Flutter](https://kotlinlang.org/docs/reference/coroutines-overview.html) - For asynchronous and more..
- [Dart](https://flutter.dev/) - Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.
- [Bloc](https://bloclibrary.dev/#/) - A predictable state management library for Dart. normally or with an exception.
- [GetIt](https://pub.dev/packages/get_it) -  A simple Service Locator for Dart and Flutter projects
- [Dartz](https://pub.dev/packages/dartz) - Functional programming  library in Dart  
- [Dio](https://pub.dev/packages/dio) - A powerful Http client for Dart, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout etc.
- [Retrofit](https://pub.dev/packages/retrofit) -  A type conversion dio client generator using source generator   

<br />

## Architecture π

the architecture is featuers modular architecture that every single features is on on package itself with dependencies just to common base classes and utils

![](extras/arch.jpg)

<br />

## Project Structure π

```
βββ common
|   βββ base
β   β    βββ BaseScreen.dart
β   β    βββ BaseBloc.dart
β   β    βββ BaseStatus.dart
β   β    βββ BaseEvent.dart
β   β    βββ BaseRepository.dart
|   βββ di
|   |     βββ networkServiceLocator.dart
β   |     βββ preferenceServiceLocator.dart
β   β
|   βββ exceptions
|   |     βββ networkServiceLocator.dart
β   |     βββ preferenceServiceLocator.dart
β   β
|   βββ exceptions
β   |     βββ failure.dart
β   β
|   βββ utils
|     βββ authentication.dart
|     βββ mockNetwork.dart
 
```
 

## TODO ποΈ

  - [ ] move feature modules from package to separate module
  - [ ] add unit test for bloc layer 
