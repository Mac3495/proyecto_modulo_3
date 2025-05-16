# 📱 Proyecto final módulo 3 - **ScanApp**

**Autor:** Marcelo  
**Repositorio:** [proyecto_modulo_3](https://github.com/Mac3495/proyecto_modulo_3)

---

**Explicación:** [Video descriptivo](https://drive.google.com/file/d/1t8nc_GtDkVVIe0ecMHXGeRSWqQp102I2/view?usp=sharing)

## 📝 Descripción

**ScanApp** es una aplicación móvil desarrollada con **Flutter** como proyecto final del módulo 3.  
Su propósito es **ayudar a las personas a evitar ingredientes que no consumen**, escaneando productos alimenticios y detectando si contienen componentes no deseados.

El usuario puede:
- Registrar una cuenta personal.
- Añadir los ingredientes que no desea consumir (por alergia, dieta o preferencia).
- Tomar fotos de etiquetas de productos y escanearlas.
- Detectar automáticamente si el producto contiene alguno de esos ingredientes.

---

## ✨ Funcionalidades

- 📷 Toma fotos con la cámara.
- 🧠 Realiza detección de texto usando **IA** con Google **MLKit**.
- 💾 Guarda los registros de escaneo localmente usando **sqflite**.
- 🔍 Analiza el texto para buscar ingredientes no consumibles registrados por el usuario.
- 👤 Permite registro e inicio de sesión con cuenta personal.

---

## 🧪 Tecnologías utilizadas

- Flutter
- Riverpod
- Hooks
- GoRouter
- Clean Architecture
- MLKit de Google
- Lottie para animaciones
- SQFlite para almacenamiento local

---

## 🚀 ¿Cómo ejecutar el proyecto?

```bash
git clone https://github.com/Mac3495/proyecto_modulo_3.git
cd proyecto
flutter pub get
flutter run
```

**APK:** [Descargar](https://drive.google.com/file/d/1t_7x9snkHk6ozxvLHgKdhTDOCEhJflLU/view?usp=sharing)