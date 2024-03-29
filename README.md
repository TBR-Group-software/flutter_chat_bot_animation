<p float = "center", align="center ">
     <img src="https://github.com/TBR-Group-software/flutter_chat_bot_animation/assets/34423346/11d94d99-84b6-4770-b101-2626f05eea6a" width = "250" />
</p>

## About the project
Atom is a prototype chat-bot application designed to showcase engaging animations and smooth screen transitions, aimed at enhancing user experience. With Atom, users can interact with a chat-bot interface while enjoying captivating animations and seamless navigation throughout the app.

<p float="center", align="center">
  <img src="https://github.com/TBR-Group-software/flutter_chat_bot_animation/assets/34423346/8a49fcf3-5fea-45bc-9c59-e8daa98de7cb" width="200" />
  <img src="https://github.com/TBR-Group-software/flutter_chat_bot_animation/assets/34423346/87ec7bc5-9798-46d8-bc46-c12af4414ca4" width="200" />
  <img src="https://github.com/TBR-Group-software/flutter_chat_bot_animation/assets/34423346/dbad8355-eaef-459b-9af8-8ec102ea40ba" width="200" />
  <img src="https://github.com/TBR-Group-software/flutter_chat_bot_animation/assets/34423346/a38c116b-63b7-4e44-aa4c-5a65fdbae7ed" width="200" />
</p>

## Features
- Interactive chat-bot interface.
- Engaging animations for a delightful user experience.
- Smooth screen transitions between different sections of the app.

## Built with
- [Flutter](https://flutter.dev/) - Beautiful native apps in record time.
- [IntelliJ IDEA](https://www.jetbrains.com/ru-ru/idea/) - Code Editing.
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) - To separate architecture into loosely coupled layers.
- [Flutter BloC](https://pub.dev/packages/flutter_bloc) - State Management for separating the UI from Business Logic.
- [Get It](https://pub.dev/packages/get_it) - Dependency Injection.
- [AutoRoute](https://pub.dev/packages/auto_route) - Streamlines Flutter navigation with code-generated routes and typed arguments.

## Chat sheet animation
<p>
     <img src="https://github.com/TBR-Group-software/flutter_chat_bot_animation/assets/34423346/78eecdf6-ca48-4366-8020-540319399176" width="200" />
</p>



```dart
static const _springDescription = SpringDescription(
    mass: 1,
    stiffness: 300,
    damping: 20,
  );
static const double _velocity = 10;

_chatSizeAnimationController = AnimationController.unbounded(vsync: this);

///Show chat
 final reverseSimulation = SpringSimulation(
   _springDescription,
   1,
   0,
   -_velocity,
 );
 _chatSizeAnimationController.animateWith(reverseSimulation);

///Hide chat
 final forwardSimulation = SpringSimulation(
   _springDescription,
   0,
   1,
   _velocity,
 );
 _chatSizeAnimationController.animateWith(forwardSimulation);
```

## Getting Started


**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/TBR-Group-software/flutter_chat_bot_animation.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

## License
This project is licensed under the GNU GPL v3 License - see the [LICENSE.md](https://github.com/TBR-Group-software/flutter_chat_bot_animation/blob/main/LICENSE.md) file for details.
