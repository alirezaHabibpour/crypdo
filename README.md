 
# Crypdo Flutter💙 Demo App

A demo flutter  app for cryptocurrency tratding and wallet balance with send cryptro to contacts ...  
 
 

## Screen records ⏺
![r1](https://github.com/alirezaHabibpour/crypdo/blob/master/demo-records/1.gif)
,![r2](https://github.com/alirezaHabibpour/crypdo/blob/master/demo-records/2.gif)
<br />

## Tools 🔧

- [Flutter](https://kotlinlang.org/docs/reference/coroutines-overview.html) - For asynchronous and more..
- [Dart](https://flutter.dev/) - Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.
- [Bloc](https://bloclibrary.dev/#/) - A predictable state management library for Dart. normally or with an exception.
- [GetIt](https://pub.dev/packages/get_it) -  A simple Service Locator for Dart and Flutter projects
- [Dartz](https://pub.dev/packages/dartz) - Functional programming  library in Dart  
- [Dio](https://pub.dev/packages/dio) - A powerful Http client for Dart, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout etc.
- [rRetrofit](https://pub.dev/packages/retrofit) -  A type conversion dio client generator using source generator   

<br />

## Architecture 📐

the architecture is featuers modular architecture that every single features is on on package itself with dependencies just to common base classes and utils

![](extras/arch.jpg)

<br />

## Project Structure 📂

```
├── common
|   └── base
│   │    ├── BaseScreen.dart
│   │    ├── BaseBloc.dart
│   │    ├── BaseStatus.dart
│   │    ├── BaseEvent.dart
│   │    └── BaseRepository.dart
|   └── di
|   |     ├── networkServiceLocator.dart
│   |     └── preferenceServiceLocator.dart
│   │
|   └── exceptions
|   |     ├── networkServiceLocator.dart
│   |     └── preferenceServiceLocator.dart
│   │
|   └── exceptions
│   |     └── failure.dart
│   │
|   └── utils
|     ├── authentication.dart
|     └── mockNetwork.dart
 
```
 

## TODO 🗒️

  - [ ] move feature modules from package to separate module
  - [ ] add unit test for bloc layer 
