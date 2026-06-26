# Semana 8 - Docker para producción

## Objetivo

Implementar una aplicación preparada para un entorno de producción utilizando Docker, aplicando buenas prácticas como el uso de un usuario sin privilegios, Docker Secrets, volúmenes persistentes, Healthcheck y Docker Compose para ejecutar el servicio de forma segura y estable.

---

# Actividades realizadas

- Se creó un laboratorio independiente llamado `semana8_docker_produccion`.
- Se desarrolló una aplicación web sencilla utilizando Python.
- Se construyó un Dockerfile siguiendo buenas prácticas para producción.
- Se implementó un archivo `.dockerignore`.
- Se configuró un archivo `compose.prod.yml`.
- Se utilizaron volúmenes para almacenar información persistente.
- Se implementó un secreto mediante Docker Secrets.
- Se configuró un Healthcheck para validar el estado de la aplicación.
- Se verificó el funcionamiento del contenedor mediante Docker Compose.

---

# Respuestas de la actividad

## 1. ¿Cuál es la diferencia entre un entorno de desarrollo y uno de producción?

Un entorno de desarrollo está orientado a la creación, modificación y prueba de aplicaciones, permitiendo realizar cambios constantemente. En cambio, un entorno de producción está diseñado para ofrecer estabilidad, seguridad y disponibilidad a los usuarios finales, minimizando riesgos y fallos durante la ejecución.

---

## 2. ¿Por qué es importante utilizar un usuario diferente de root dentro de un contenedor?

El uso de un usuario sin privilegios reduce significativamente los riesgos de seguridad. Si una aplicación presenta una vulnerabilidad, el atacante tendrá permisos limitados y no podrá comprometer completamente el sistema operativo ni el contenedor.

---

## 3. ¿Para qué sirven los Docker Secrets?

Docker Secrets permiten almacenar información sensible como contraseñas, claves o tokens de acceso de forma segura, evitando incluir estos datos directamente en el código fuente o dentro de la imagen Docker.

---

## 4. ¿Qué función cumple un Healthcheck?

El Healthcheck permite comprobar automáticamente si la aplicación continúa funcionando correctamente. Cuando se detecta un fallo, Docker puede identificar el problema rápidamente y facilitar acciones de recuperación.

---

## 5. ¿Por qué utilizar volúmenes en Docker?

Los volúmenes permiten conservar la información incluso cuando un contenedor es eliminado o recreado, garantizando la persistencia de los datos y facilitando la administración de aplicaciones.

---

# Evidencias

## Evidencia 1. Estructura del laboratorio

![Estructura](img/semana8/image1.png)

---

## Evidencia 2. Código fuente de la aplicación

![Aplicación](img/semana8/imagepy.png)

![Aplicación](img/semana8/imagepy2.png)

---

## Evidencia 3. Dockerfile

![Dockerfile](img/semana8/imageDF.png)

---

## Evidencia 4. Archivos de configuración

Archivo `.dockerignore`

![dockerignore](img/semana8/imageDIg.png)

Archivo `banner_msg.txt`

![Banner](img/semana8/imageBanner.png)

---

## Evidencia 5. Archivo compose.prod.yml

![Compose](img/semana8/imageCompose.png)

---

## Evidencia 6. Construcción del proyecto

```bash
docker compose -f compose.prod.yml up -d --build
```

![Construcción](img/semana8/imageBuiltYStarted.png)

---

## Evidencia 7. Estado del contenedor

```bash
docker compose ps
```

![Estado](img/semana8/imageCompose-ps.png)

---

## Evidencia 8. Aplicación en ejecución

![Aplicación](img/semana8/imagePort.png)

---

## Evidencia 9. Verificación mediante logs

```bash
docker logs semana8_docker_produccion-web-1
```

![Logs](img/semana8/imagefinal.png)

---

# Conclusión

Durante esta práctica se implementó un entorno de producción utilizando Docker y Docker Compose. Se aplicaron buenas prácticas como el uso de un usuario sin privilegios, la utilización de Docker Secrets, la persistencia mediante volúmenes, la configuración de Healthcheck y la ejecución controlada de la aplicación. Finalmente, se verificó el correcto funcionamiento del contenedor, obteniendo una aplicación más segura, estable y preparada para ejecutarse en un entorno de producción.