# ⚡ Flash Chat

## 🌟 Overview
Flash Chat is a real-time chat application built with Flutter, Firebase, and Cloud Firestore. This app enables users to sign up, log in, and message other users instantly. The application combines a clean, intuitive design with powerful backend integration.

---

## 🚀 Features

### 🌟 Real-Time Messaging
- Send and receive messages instantly.
- Messages are displayed with timestamps for accurate sequencing.
- Real-time updates using Firebase Cloud Firestore.

### 🎮 User Management
- **Sign Up**: Create an account by entering your email and password.
- **Log In**: Access your account securely.

### 🔄 Cross-Platform Compatibility
- Responsive design for both Android and iOS devices.

### 🎨 Animated UI
- Hero animations for smooth screen transitions.
- Animated text effects for the welcome screen.

---

## 🛠️ Technologies Used
- **Flutter**: Framework for UI development.
- **Firebase Auth**: User authentication.
- **Cloud Firestore**: Backend database for real-time data storage.
- **Hero Animations**: For seamless transitions.
- **Animated Text Kit**: Adding dynamic text animations.

---

## 🎥 Demo Video

https://user-images.githubusercontent.com/100719856/227959692-9d9ebbb3-66be-4aab-b910-ecdbb2ec14ff.mp4

---

## 📸 Screenshots
### Welcome Screen

![welcome_screen](https://github.com/user-attachments/assets/d5c6d340-1077-4988-a8db-baf3cc9ddf5f)

### Chat Screen

![chat_screen](https://github.com/user-attachments/assets/bad89e82-1543-4b19-8731-0b3c1de0ee08)

![chat_Screen](https://github.com/user-attachments/assets/49794575-74c8-4bf9-a37b-89b8f1ed4c26)

### Registration Screen

![register_screen_1](https://github.com/user-attachments/assets/4ad2af3c-3215-436b-9e93-7fb06471264b)

![register_screen_2](https://github.com/user-attachments/assets/e0536bdd-21f3-4313-a904-f3aeb2dfdc71)

![register_screen3](https://github.com/user-attachments/assets/8250ec5f-6370-41fe-8d83-4877a4475f36)

### Log In Screen

![login_Screen_!](https://github.com/user-attachments/assets/2fd04964-77ae-4788-9528-c1cb481d0882)

![login_screen](https://github.com/user-attachments/assets/2fb7a710-8717-4034-a5b0-2e9eec86e12a)

---

## 📂 Project Structure
```plaintext
lib
├── main.dart                     # Entry point of the application
├── constants.dart                # Common constants used across the app
├── components
│   └── rounded_button.dart       # Custom widget for reusable buttons
├── screens
│   ├── welcome_screen.dart       # Welcome screen with animations
│   ├── login_screen.dart         # User login screen
│   ├── registration_screen.dart  # User registration screen
│   └── chat_screen.dart          # Main chat interface
```

---

## 📋 Dependencies
The following dependencies are used in this project, as defined in the `pubspec.yaml` file:

### Direct Dependencies
- **flutter**: Framework for building natively compiled applications for mobile, web, and desktop from a single codebase.
- **animated_text_kit**: For dynamic text animations.
- **firebase_core**: Core Firebase functionalities.
- **firebase_auth**: User authentication via Firebase.
- **cloud_firestore**: Real-time database for storing chat messages.
- **modal_progress_hud**: For displaying loading indicators.

### Development Dependencies
- **flutter_test**: Used for testing the application.
- **flutter_lints**: Encourages good coding practices by providing a set of lint rules.

---

## 📋 Code Highlights

### Sending a Message
```dart
TextButton(
  onPressed: () {
    messageTextController.clear();
    _firestore.collection('messages').add({
      'text': messageText,
      'sender': loggedInUser!.email,
      'timestamp': FieldValue.serverTimestamp(),
    });
  },
  child: Text('Send', style: kSendButtonTextStyle),
);
```

### Real-Time Message Stream
```dart
StreamBuilder <QuerySnapshot<Map<String, dynamic>>>(
  stream: _firestore.collection('messages').orderBy('timestamp').snapshots(),
  builder: (context, snapshot) {
    if (!snapshot.hasData) {
      return CircularProgressIndicator();
    }
    final messages = snapshot.data.docs.reversed;
    List<MessageBubble> messageBubbles = [];
    for (var message in messages) {
      messageBubbles.add(MessageBubble(
        sender: message['sender'],
        text: message['text'],
        isMe: loggedInUser!.email == message['sender'],
      ));
    }
    return ListView(children: messageBubbles);
  },
);
```

---

## 🙏 Acknowledgments
Special thanks to **Dr. Angela Yu** for her insightful course, [The Complete Flutter Development Bootcamp with Dart](https://www.udemy.com/course/flutter-bootcamp-with-dart/). This application was inspired and developed as part of her lessons.

