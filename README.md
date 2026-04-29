<img width="493" height="890" alt="image" src="https://github.com/user-attachments/assets/d22123ae-ca4c-41d0-a21e-6980a6173cee" />

# 🚀 Crypto Live Monitor
### proyecto_stream — Taller Técnico de StreamControllers en Flutter

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![API](https://img.shields.io/badge/CoinGecko-API-8DC63F?style=for-the-badge&logo=bitcoin&logoColor=white)
![Android](https://img.shields.io/badge/Android-Studio-3DDC84?style=for-the-badge&logo=android&logoColor=white)

---

## 📱 Vista Previa

> Dashboard en tiempo real con precios de Bitcoin, Ethereum y Solana — actualizándose automáticamente cada 30 segundos mediante un `StreamController`.

---

## 🎯 Objetivo del Proyecto

Aplicación móvil desarrollada en **Flutter/Dart** como parte de un taller técnico universitario sobre programación reactiva con **Streams**. Consume la API pública de **CoinGecko** para mostrar precios de criptomonedas en tiempo real, con indicadores visuales de subida/bajada de precio.

---

## ✨ Funcionalidades

- 📡 **Datos en tiempo real** — Actualización automática cada 30 segundos via `StreamController`
- 📈 **Indicadores visuales** — Verde (subida) / Rojo (bajada) con iconos de tendencia
- 🔄 **Gestión del ciclo de vida** — Stream abierto en `initState()` y cerrado en `dispose()` sin memory leaks
- ⚠️ **Manejo de errores** — Estados de carga, error de red y límite de API en Español
- 🏗️ **Clean Architecture** — Separación en capas `data / domain / presentation`

---

## 🏛️ Arquitectura del Proyecto

```
lib/
├── data/
│   ├── models/
│   │   └── crypto_model.dart          # Mapeo JSON → Entidad
│   └── services/
│       └── crypto_stream_service.dart # StreamController + API + Timer.periodic
│
├── domain/
│   └── entities/
│       └── crypto_entity.dart         # Entidad de dominio pura
│
├── presentation/
│   ├── screens/
│   │   └── dashboard_screen.dart      # StatefulWidget + StreamBuilder
│   └── widgets/
│       └── price_card.dart            # AnimatedContainer por cripto
│
└── main.dart                          # Entry point
```

---

## 🧠 Conceptos Técnicos Aplicados

| Concepto | Implementación |
|----------|----------------|
| `StreamController<T>` | Controla el flujo de datos de la API |
| `StreamBuilder<T>` | Reactiva la UI ante cada emisión del stream |
| `Timer.periodic` | Dispara el fetch cada 30 segundos |
| `dispose()` | Cierra el stream y cancela el timer sin memory leaks |
| `addError()` | Emite errores de red al stream para manejo en UI |
| `fromJson()` | Factory constructor para parsear la respuesta de CoinGecko |
| `AnimatedContainer` | Transición suave de color en cada actualización |

---

## 🌐 API Utilizada

**CoinGecko Public API** — Gratuita, sin necesidad de registro básico.

```
GET https://api.coingecko.com/api/v3/simple/price
    ?ids=bitcoin,ethereum,solana
    &vs_currencies=usd
    &include_24hr_change=true
```

### Respuesta de ejemplo:
```json
{
  "bitcoin": {
    "usd": 75930.00,
    "usd_24h_change": -0.52
  },
  "ethereum": {
    "usd": 2258.62,
    "usd_24h_change": -1.28
  },
  "solana": {
    "usd": 83.01,
    "usd_24h_change": -0.91
  }
}
```

> ⚠️ **Límite de rate:** ~30 llamadas/min en el plan gratuito. Se recomienda obtener una [Demo API Key gratuita](https://coingecko.com/en/api/pricing) para evitar errores 429.

---

## 🛠️ Requisitos Previos

- Flutter SDK `>=3.0.0`
- Dart SDK `>=3.0.0`
- Android Studio (para el emulador)
- Visual Studio Code con extensión Flutter
- JDK 17

---

## 🚀 Instalación y Ejecución

### 1. Clonar el repositorio
```bash
git clone https://github.com/tu-usuario/proyecto_stream.git
cd proyecto_stream
```

### 2. Instalar dependencias
```bash
flutter pub get
```

### 3. Verificar que no hay errores
```bash
flutter analyze
```

### 4. Lanzar el emulador desde Android Studio y ejecutar
```bash
flutter run
```

---

## 📦 Dependencias

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.0
```

---

## 📋 Permiso de Internet (Android)

En `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

---

## 🔑 Configuración de API Key (Opcional pero recomendado)

Para evitar el error `429 - Límite de API alcanzado`, agrega tu Demo API Key gratuita en `crypto_stream_service.dart`:

```dart
static const _apiKey = 'TU_API_KEY_AQUI';

static const _url =
    'https://api.coingecko.com/api/v3/simple/price'
    '?ids=bitcoin,ethereum,solana'
    '&vs_currencies=usd'
    '&include_24hr_change=true'
    '&x_cg_demo_api_key=$_apiKey';
```

Obtén tu key gratis en → [coingecko.com/en/api/pricing](https://coingecko.com/en/api/pricing)

---

## 📚 Lecciones Aprendidas

1. **Los streams tienen ciclo de vida** — siempre cerrar con `dispose()` para evitar memory leaks.
2. **Separar responsabilidades** — la UI no debe saber cómo se obtienen los datos.
3. **Manejo de errores en streams** — usar `addError()` y capturarlo en `snapshot.hasError`.
4. **Rate limiting de APIs** — respetar los límites de llamadas con `Timer.periodic` y un intervalo adecuado.
5. **`AnimatedContainer`** — permite transiciones visuales suaves sin animaciones complejas.

---

## 👨‍💻 Autor
JUAN FELIPE MORA REVELO 
Desarrollado como parte del Taller Técnico de **Ingeniería de Software**  
Universidad · Curso de Desarrollo Móvil con Flutter  

---

## 📄 Licencia

Este proyecto es de uso educativo. Libre para modificar y distribuir con fines académicos.
