# Spark⚡ - Your Ultimate News Aggregator App 📰💥


## Overview

Spark is a modern, sleek news aggregator application built with Flutter, designed to provide users with a seamless and informative news reading experience. Leveraging the power of the NewsCatcher API, Spark brings you the latest news from around the globe at your fingertips.

## 📸 Screenshots and Architecture

<div align="center">
  <img src="https://res.cloudinary.com/dzabseimd/image/upload/v1748188728/Mobile_App_Screen_Mockup_Mosaic_1_baavki.png" width="350" alt="Home Screen"/>
  <img src="https://res.cloudinary.com/dzabseimd/image/upload/v1748188729/657shots_so_w7hrku.png" width="350" alt="Feature Screen"/>
</div>

</br>

<div align="center">
  <img src="https://res.cloudinary.com/dzabseimd/image/upload/v1748188728/napkin-selection_p2oplo.png" width="350" alt="Profile Screen"/>
</div>

## 🎥 Demo Video

[![App Demo Video](https://res.cloudinary.com/dzabseimd/image/upload/v1748189226/23739728_sl_012120_27300_18_ngqdmt.jpg)](https://player.cloudinary.com/embed/?cloud_name=dzabseimd&public_id=Record_2024-11-07-00-42-44_snrj5w&profile=cld-looping)

*Click the image above to watch the demo video*

**Alternative video hosting options:**
- **Cloudinary Link:** [Demo Video](https://player.cloudinary.com/embed/?cloud_name=dzabseimd&public_id=Record_2024-11-07-00-42-44_snrj5w&profile=cld-looping)

## 🌟 Features

- Real-time news aggregation
- Multiple category support
- Clean and intuitive user interface
- Responsive design
- Multilanguage Support, 7 Languages English, (German, French, Italian, Portuguese, Hindi, Spanish, and Thai).
- LLM Optimised Small and Concised News Summary For Quick Reading (Powered By Llama 3.1 8B AI Model)

## 🛠 Prerequisites

- Flutter SDK (Latest stable version)
- Dart SDK
- Android Studio / VS Code
- NewsCatcher API Key
- OpenRouter.ai API Key

## 🔧 Installation Steps

### 1. Clone the Repository

```bash
https://github.com/DebSaha141/News_Aggregator_Flutter.git
cd spark-news
```

### 2. Get Dependencies

```bash
flutter pub get
```

### 3.1 API Key Configuration for NewsCatchers API

1. Visit [NewsCatcher API Website](https://newscatcherapi.com/)
2. Create an account and obtain your API key
3. Create a `.env` file in the project root
4. Add your API key to the `.env` file:

```
API_KEY=your_newscatcher_api_key_here
```

### 3.1 API Key Configuration for OpenRouter API

1. Visit [NewsCatcher API Website](https://openrouter.ai/)
2. Create an account and obtain your API key
3. Create a `.env` file in the project root
4. Add your API key to the `.env` file:

```
LLM_API_KEY=your_OpenRouter_api_key_here
```

**⚠️ Ethical API Key Usage Guidelines:**

- Never share your API key publicly
- Store `.env` file in `.gitignore`
- Use API responsibly within rate limits
- Comply with NewsCatcher's terms of service

### 4. Run the Application

```bash
flutter run
```

## 🎨 Design Philosophy

Spark embraces a minimalist design language with:

- Elegant typography
- Smooth transitions
- Dark mode support
- Accessibility-first approach

## 🔒 Security Practices

- API key encryption
- Secure network calls
- Error handling
- Rate limiting implementation

## 📦 Dependencies

- Flutter
- Provider for state management
- http for HTTP requests
- Flutter .env for environment configuration
- Flutter Config Package
- URL Launcher For external browser view
- Fluttertoast for error display
- Flutter Carousel For Image Carousel
- Flutter Native Splash for Splash Screen

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

---

**Made with ❤️ and Flutter**
