# 🎬 Flutter TMDB App  
## Prueba realizada por **Johnny Bohorquez**  

Aplicación desarrollada en **Flutter** utilizando la API de **The Movie Database (TMDB)**.  

---

## 📌 Características  
✅ Construida con **Flutter 3.29.1**  
✅ Arquitectura basada en **BLoC** para gestión de estado  
✅ Manejo eficiente de imágenes con **Cached Network Image**  
✅ Animaciones fluidas con **Animate_do**  
✅ UI inspirada en **Material Design**  

---

## ⚙️ Configuración y Uso  

### **1️⃣ Configurar API Key**  
En el archivo **`constants.dart`** ubicado en:  
📂 `lib/core/utils/constants.dart`  
- Se encuentra la variable **`apiKey`**, donde se puede cambiar la clave de API según sea necesario.  
- **IMPORTANTE:** Para la prueba, la clave de API proporcionada en el correo ya está configurada.  
- En un entorno de producción, **se recomienda usar un `.env`** para ocultar la API Key por seguridad.  

---

### **2️⃣ Ejecutar la Aplicación**  
Desde el editor de código, seleccionar el dispositivo en el que se ejecutará la aplicación (**físico o emulador**).  

Ejecutar el siguiente comando en la terminal o usar **F5** en el editor de código:   
```sh
flutter run
```

---

### **3️⃣ Ejecutar la Aplicación** 
# Ejecutar todos los tests
```sh
flutter test  
```

# Ejecutar un test específico
```sh
flutter test test/movies_screen_test.dart  
```

# Ejecutar tests filtrando por descripción
```sh
flutter test --plain-name "TEST: MovieCard renders correctly with title and score"
```


