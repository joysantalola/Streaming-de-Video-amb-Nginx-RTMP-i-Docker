# 🎥 Streaming Adaptatiu amb Nginx-RTMP & Docker

<p align="center">
  <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" alt="Docker">
  <img src="https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white" alt="Nginx">
  <img src="https://img.shields.io/badge/FFmpeg-0078D4?style=for-the-badge&logo=ffmpeg&logoColor=white" alt="FFmpeg">
</p>

Aquest repositori conté la configuració necessària per desplegar un servidor de streaming de vídeo que rep un senyal via **RTMP**, realitza **transcoding** en temps real i el serveix mitjançant **HLS** (HTTP Live Streaming) amb suport per a múltiples qualitats (adaptatiu).

---

## Requisits

- [Docker](https://www.docker.com/) i Docker Compose.
- [OBS Studio](https://obsproject.com/) per a la transmissió del senyal.
- Navegador web modern (Chrome, Firefox, Edge).

---

## Instal·lació i Desplegament

1. **Clona el repositori:**
```bash
 git clone [https://github.com/joysantalola/Streaming-de-Video-amb-Nginx-RTMP-i-Docker)
 cd Streaming-de-Video-amb-Nginx-RTMP-i-Docker
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
![Docker PS](img/ps.png)

## Configuració de l'Emissió (OBS)

Per començar a emetre, configura el teu codificador (OBS Studio) amb els següents paràmetres:

| Ajust | Valor |
| --- | --- |
| **Tipus d'emissió** | Servidor personalitzat |
| **URL del servidor** | `rtmp://localhost:1935/stream` |
| **Clau de transmissió** | `stream-olegueresteo` |

---
![Configuració OBS](img/obsconf.png)

## Verificació i Estadístiques

### Reproducció Web

Pots accedir al reproductor a `http://localhost:8080`. El sistema detecta automàticament les variants de qualitat:

![Reproductor Web](img/web.png)
### Panell de Control

Monitoritza el bitrate i els usuaris connectats en temps real:
--> [http://localhost:8080/stat](https://www.google.com/search?q=http://localhost:8080/stat)

![Stat](img/stats.png)
### Comprovació de fitxers HLS

Si vols verificar que el servidor està generant els segments de vídeo correctament:

```bash
docker exec streaming-video-olegueresteo ls -lh /opt/data/hls/

```

---
![Verificació](img/vids.png)

## Estructura del Projecte

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
