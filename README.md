# 🎥 Streaming Adaptatiu amb Nginx-RTMP & Docker

<p align="center">
  <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" alt="Docker">
  <img src="https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white" alt="Nginx">
  <img src="https://img.shields.io/badge/FFmpeg-0078D4?style=for-the-badge&logo=ffmpeg&logoColor=white" alt="FFmpeg">
</p>

Aquest repositori conté la configuració necessària per desplegar un servidor de streaming de vídeo que rep un senyal via **RTMP**, realitza **transcoding** en temps real i el serveix mitjançant **HLS** (HTTP Live Streaming) amb suport per a múltiples qualitats (adaptatiu).

---

## 📖 Taula de Continguts
- [Arquitectura del Sistema](#-arquitectura-del-sistema)
- [Requisits](#-requisits)
- [Instal·lació i Desplegament](#-instal·lació-i-desplegament)
- [Configuració de l'Emissió (OBS)](#-configuració-de-lemissió-obs)
- [Verificació i Estadístiques](#-verificació-i-estadístiques)
- [Estructura del Projecte](#-estructura-del-projecte)

---

## 🏗️ Arquitectura del Sistema

El flux de dades segueix el següent esquema:
1. **Origen (OBS):** Envia vídeo H.264 via RTMP.
2. **Servidor (Nginx):** Rep el flux i utilitza FFmpeg per crear variants (720p, 480p, 360p).
3. **Destí (Navegador):** L'usuari consumeix el contingut mitjançant HLS amb Video.js.



---

## 💻 Requisits

- [Docker](https://www.docker.com/) i Docker Compose.
- [OBS Studio](https://obsproject.com/) per a la transmissió del senyal.
- Navegador web modern (Chrome, Firefox, Edge).

---

## 🚀 Instal·lació i Desplegament

1. **Clona el repositori:**
   ```bash
   git clone [https://github.com/el-teu-usuari/nom-del-repo.git](https://github.com/el-teu-usuari/nom-del-repo.git)
   cd nom-del-repo

```

2. **Aixeca els contenidors:**
```bash
docker-compose up -d

```


3. **Verifica l'estat dels serveis:**
```bash
docker ps

```



---

## 📹 Configuració de l'Emissió (OBS)

Per començar a emetre, configura el teu codificador (OBS Studio) amb els següents paràmetres:

| Ajust | Valor |
| --- | --- |
| **Tipus d'emissió** | Servidor personalitzat |
| **URL del servidor** | `rtmp://localhost:1935/stream` |
| **Clau de transmissió** | `stream-olegueresteo` |

---

## 📊 Verificació i Estadístiques

### Reproducció Web

Pots accedir al reproductor a `http://localhost:8080`. El sistema detecta automàticament les variants de qualitat:

### Panell de Control

Monitoritza el bitrate i els usuaris connectats en temps real:
👉 [http://localhost:8080/stat](https://www.google.com/search?q=http://localhost:8080/stat)

### Comprovació de fitxers HLS

Si vols verificar que el servidor està generant els segments de vídeo correctament:

```bash
docker exec streaming-video-olegueresteo ls -lh /opt/data/hls/

```

---

## 📂 Estructura del Projecte

```bash
.
├── docker-compose.yml   # Definició dels serveis i volums
├── nginx.conf           # Configuració del servidor i transcoding
├── html/
│   ├── index.html       # Reproductor Video.js personalitzat
│   └── stat.xsl         # Full d'estils per a les estadístiques
├── hls/                 # Fitxers de vídeo generats (ignorat per git)
└── img/                 # Captures de pantalla de la documentació

```



T'agradaria que t'ajudés a omplir les **Qüestions** de la pràctica (bitrates, càlculs, etc.) amb aquest mateix format de taules per afegir-ho al final?

```
