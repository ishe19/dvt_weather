# DVT Weather App



## This is a Flutter-based weather application that utilizes the BLoC pattern for state management and follows a hybrid MVC (Model-View-Controller) architecture.

## Features
- Get current weather conditions based on user's location
- View detailed weather information such as temperature, humidity, wind speed, and more
- Search for weather conditions in different locations
- Save favorite locations for quick access

## Dependencies
The following dependencies are used in this project:

### flutter_bloc: 
  A Flutter-specific package that integrates the BLoC pattern with Flutter widgets.

### geolocator: 
  Allows retrieving the user's location for accurate weather data.

### dio:
  A powerful HTTP networking package, supports Interceptors, Aborting and canceling a request, Custom adapters, Transformers and many more.

### Shared_preferences :
  For storing and persisting simple data to the device

### Equatable
  A Dart package that helps to implement value based equality without needing to explicitly override == and hashCode.


## Installation
To run the Weather App on your local machine, follow these steps:

1. Make sure you have Flutter installed. If not, refer to the official Flutter installation guide: [Flutter Installation](https://docs.flutter.dev/get-started/install)

2. Clone the repository:
  - git clone https://github.com/ishe19/dvt_weather/weather-app.git
3. Navigate to the project directory:
  - cd dvt_weather
4. Install dependencies:
  - flutter pug get
5.Run the app:
  - flutter run

## Usage
Upon launching the Weather App, you will be presented with the home screen displaying the current weather conditions based on your device's location. You can also search for weather conditions in different locations by entering the city name in the search bar.
To view detailed weather information, simply tap on a specific location or choose a favorite location from the saved locations list.

## Screenshots

![Home Screen](https://github.com/ishe19/dvt_weather/blob/main/assets/screenshots/home_screen.png))

![Search Screen](https://github.com/ishe19/dvt_weather/blob/main/assets/screenshots/search_screen.png)

![Favourites Screen](https://github.com/ishe19/dvt_weather/blob/main/assets/screenshots/favourites_screen.png)

![Favourites Details](https://github.com/ishe19/dvt_weather/blob/main/assets/screenshots/Favourites_Details_Screen.png)




