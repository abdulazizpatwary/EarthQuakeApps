#  EarthQuakeApp

A simple **Flutter** application that displays **recent earthquakes worldwide** using real-time data from the **USGS Earthquake API**. The app shows earthquake **time**, **location**, and **magnitude** in a clean list, with more details shown in a dialog on tap.

---

##  Screens & UX

* Scrollable list of earthquakes
* Formatted date & time
* Magnitude badge
* Tap to view details in an alert dialog

---

##  Features

*  Real-time earthquake data (USGS)
*  `ListView.builder` for efficient rendering
*  Date & time formatting with `intl`
*  Material UI
*  Clean, beginner-friendly code

---

##  Tech Stack

* **Flutter (Dart)**
* **http** – API requests
* **intl** – Date & time formatting
* **Material Design**

---

##  API

**USGS Earthquake GeoJSON Feed (Past Day)**

```
https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson
```


## ⚙️ How It Works

1. App starts and fetches data using `http.get()`
2. JSON response is decoded into a Dart `Map`
3. Earthquake features are extracted into a list
4. Data is rendered using `ListView.builder`
5. Tapping a list item opens an `AlertDialog` with details

---



### Prerequisites

* Flutter SDK
* Android Studio / IntelliJ IDEA
* Android Emulator or Physical Device









