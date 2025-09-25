# Ejemplos de uso de cURL

Este documento muestra ejemplos de las distintas opciones más comunes del comando `curl`.

---

## Solicitudes básicas

### GET - obtener un recurso
curl https://example.com

### HEAD - solo cabeceras
curl -I https://example.com

### Seguir redirecciones automáticamente
curl -L http://httpbin.org/redirect-to?url=/get

---

## Métodos HTTP

### POST con datos JSON
curl -X POST https://jsonplaceholder.typicode.com/posts \
  -H "Content-Type: application/json" \
  -d '{"title":"foo","body":"bar","userId":1}'

### PUT - reemplazar recurso
curl -X PUT https://jsonplaceholder.typicode.com/posts/1 \
  -H "Content-Type: application/json" \
  -d '{"id":1,"title":"nuevo","body":"contenido","userId":1}'

### PATCH - actualizar parcialmente
curl -X PATCH https://jsonplaceholder.typicode.com/posts/1 \
  -H "Content-Type: application/json" \
  -d '{"title":"parcial"}'

### DELETE - borrar recurso
curl -X DELETE https://jsonplaceholder.typicode.com/posts/1

---

## Autenticación

### Autenticación básica (usuario:contraseña)
curl -u user:passwd https://httpbin.org/basic-auth/user/passwd

### Autenticación con token Bearer
curl -H "Authorization: Bearer <TOKEN>" https://httpbin.org/bearer

### Autenticación Digest
curl --digest -u user:passwd https://httpbin.org/digest-auth/auth/user/passwd

---

## Envío de datos

### POST con formulario (application/x-www-form-urlencoded)
curl -X POST https://httpbin.org/post -d "campo1=valor1&campo2=valor2"

### POST con archivo (multipart/form-data)
curl -X POST https://httpbin.org/post -F "file=@./archivo.txt"

### POST con datos binarios
curl -X POST https://httpbin.org/post --data-binary @archivo.bin

---

## Archivos y descargas

### Descargar a un archivo
curl -o salida.html https://example.com

### Reanudar descarga interrumpida
curl -C - -O https://example.com/archivo.zip

### Subir archivo vía FTP
curl -T archivo.txt ftp://usuario:clave@ftp.ejemplo.com/

---

## Cabeceras y cookies

### Enviar cabecera personalizada
curl -H "X-Custom-Header: valor" https://httpbin.org/headers

### Enviar cookies en la petición
curl -b "usuario=juan;rol=admin" https://httpbin.org/cookies

### Guardar cookies en archivo y reutilizarlas
curl -c cookies.txt https://httpbin.org/cookies/set?test=123
curl -b cookies.txt https://httpbin.org/cookies

---

## Seguridad y conexiones

### Ignorar verificación de certificado SSL
curl -k https://self-signed.badssl.com/

### Usar certificado y clave cliente
curl --cert certificado.pem --key clave.pem https://servidorseguro.com

### Forzar protocolo HTTP/2
curl --http2 https://example.com

### Forzar protocolo HTTP/3
curl --http3 https://example.com

---

## Información y depuración

### Verbose - salida detallada de la conexión
curl -v https://example.com

### Mostrar solo el código de estado HTTP
curl -s -o /dev/null -w "%{http_code}\n" https://example.com

### Medir tiempos de la conexión
curl -w "@curl-format.txt" -o /dev/null -s https://example.com
# (Archivo curl-format.txt debe contener variables como %{time_total})

---

## Otras opciones útiles

### Cambiar agente de usuario
curl -A "MiAgente/1.0" https://httpbin.org/user-agent

### Limitar velocidad de descarga
curl --limit-rate 100K https://example.com/archivo.zip -O

### Usar proxy
curl -x http://proxyservidor:8080 https://example.com

### Usar socket Unix (ejemplo con Docker)
curl --unix-socket /var/run/docker.sock http://localhost/containers/json
