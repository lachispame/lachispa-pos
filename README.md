# LaChispaPOS

Punto de Venta Lightning para LNBits (Lachispa.me)

## Descripción

LaChispaPOS es una aplicación de punto de venta (POS) que permite cobrar en Bitcoin Lightning Network usando billeteras LNBits. Diseñado para negocios que usan [Lachispa.me](https://lachispa.me) como billetera.

## Características

- ⚡ **Ventas Lightning** — Cobra al instante generando facturas en Lightning Network
- 📷 **Conexión por QR** — Escanea el QR de clave de facturación desde LaChispa
- 🌐 **Multi-moneda** — Soporta 10 monedas: CUP, MLC, USD, EUR, GBP, CAD, JPY, AUD, CHF, SATs
- 📈 **Tasas de cambio en tiempo real** — Cotizaciones actualizadas vía Yadio.io
- 💾 **Ventas pendientes** — Recuperación automática si se cierra la app
- 📊 **Historial de ventas** — Filtra por fecha y empleado
- 📤 **Exportar/Importar ventas** — Respaldo en JSON, importación de dependientes
- 📦 **Catálogo de productos** — Nombres, precios, categorías y monedas
- 📟 **Ticket de venta** — Comparte ticket como texto tras cada venta
- 📉 **Estadísticas** — Gráficos por día/semana/mes y top productos
- 👥 **Roles** — Dependiente (ventas) y Jefe (gestión completa)
- 📱 **Pagos NFC** — Paga acercando el dispositivo con LNURL
- 🍽️ **Gestión de Mesas** — Organiza ventas por mesas para restaurantes
- 🌍 **Multi-idioma** — Disponible en 8 idiomas (ES, EN, PT, DE, FR, IT, RU, JA)
- 🌙 **Interfaz oscura** — Tema oscuro estilo Lachispa

## Monedas Soportadas

| Código | Moneda |
|--------|--------|
| CUP | Peso Cubano |
| MLC | Moneda Convertible (CBDC) |
| USD | Dólar Estadounidense |
| EUR | Euro |
| GBP | Libra Esterlina |
| CAD | Dólar Canadiense |
| JPY | Yen Japonés |
| AUD | Dólar Australiano |
| CHF | Franco Suizo |
| SAT | Satoshis |

## Roles

### Dependiente
- Realizar ventas y cobrar con Lightning Network
- Exportar base de datos a JSON
- Ver historial de ventas propio
- Gestionar ventas pendientes
- Seleccionar moneda por venta

### Jefe
- Importar ventas de dependientes (archivo JSON)
- Ver todas las ventas del negocio
- Eliminar ventas importadas
- Gestionar catálogo de productos
- Visualizar estadísticas y gráficos

## Cómo Conectar

### Opción 1: Escaneo de QR (Recomendado)
1. Abre **LaChispa** (la billetera Lightning del owner)
2. Ve a **Menú lateral → QR de Clave de Facturación**
3. Se mostrará el **QR** para escanear
4. Escanea el **QR** desde la app LaChispaPOS en la pantalla de login

### Opción 2: Manual
1. En la app, ve a **Configuración** (icono QR)
2. Copia la **Invoice/read key** manualmente
3. Pega en el campo **API Key**
4. Toca **Guardar y probar**

## Internacionalización

La aplicación soporta 8 idiomas:

| Idioma | Código |
|--------|--------|
| Español | `es` |
| English | `en` |
| Português | `pt` |
| Deutsch | `de` |
| Français | `fr` |
| Italiano | `it` |
| Русский | `ru` |
| 日本語 | `ja` |

El idioma se detecta automáticamente del sistema y se puede cambiar desde Configuración.

## Instalación

```bash
# Obtener dependencias
flutter pub get

# Generar archivos de localización
flutter gen-l10n

# Build debug
flutter build apk --debug

# Build release
flutter build apk --release

# Build split APKs por arquitectura
flutter build apk --split-per-abi
```

## Tech Stack

| Tecnología | Propósito |
|------------|-----------|
| [Flutter](https://flutter.dev) | Framework multiplataforma |
| [Provider](https://pub.dev/packages/provider) | Manejo de estado |
| [SQLite](https://sqlite.org) (sqflite) | Base de datos local |
| [LNBits API](https://lnbits.com) | Facturación Lightning Network |
| [Yadio.io](https://yadio.io) | Tasas de cambio en tiempo real |
| [mobile_scanner](https://pub.dev/packages/mobile_scanner) | Escaneo de QR |
| [qr_flutter](https://pub.dev/packages/qr_flutter) | Generación de QR |
| [nfc_manager](https://pub.dev/packages/nfc_manager) | Pagos NFC |
| [web_socket_channel](https://pub.dev/packages/web_socket_channel) | Monitoreo de pagos en tiempo real |
| [share_plus](https://pub.dev/packages/share_plus) | Compartir tickets |
| [file_picker](https://pub.dev/packages/file_picker) | Importar archivos |
| [intl](https://pub.dev/packages/intl) | Internacionalización |

## Licencia

MIT
