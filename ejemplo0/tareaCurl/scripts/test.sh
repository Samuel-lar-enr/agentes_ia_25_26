#!/bin/bash

echo "=== GET - Obtener un recurso ==="
curl https://jsonplaceholder.typicode.com/posts/1
echo -e "\n"

echo "=== HEAD - Mostrar solo cabeceras ==="
curl -I https://jsonplaceholder.typicode.com/posts/1
echo -e "\n"

echo "=== Seguir redirecciones ==="
curl -L https://jsonplaceholder.typicode.com/redirect-to?url=/posts/1
echo -e "\n"

echo "=== POST - Crear un recurso ==="
curl -X POST https://jsonplaceholder.typicode.com/posts \
  -H "Content-Type: application/json" \
  -d '{"title":"foo","body":"bar","userId":1}'
echo -e "\n"

echo "=== PUT - Reemplazar recurso ==="
curl -X PUT https://jsonplaceholder.typicode.com/posts/1 \
  -H "Content-Type: application/json" \
  -d '{"id":1,"title":"nuevo","body":"contenido","userId":1}'
echo -e "\n"

echo "=== PATCH - Actualizar parcialmente ==="
curl -X PATCH https://jsonplaceholder.typicode.com/posts/1 \
  -H "Content-Type: application/json" \
  -d '{"title":"parcial"}'
echo -e "\n"

echo "=== DELETE - Eliminar recurso ==="
curl -X DELETE https://jsonplaceholder.typicode.com/posts/1
echo -e "\n"

echo "=== POST con formulario URL encoded ==="
curl -X POST https://jsonplaceholder.typicode.com/posts \
  -d "title=foo&body=bar&userId=1"
echo -e "\n"

echo "=== POST multipart/form-data ==="
curl -X POST https://jsonplaceholder.typicode.com/posts \
  -F "file=@./archivo.txt" \
  -F "title=ejemplo"
echo -e "\n"

echo "=== POST datos binarios ==="
curl -X POST https://jsonplaceholder.typicode.com/posts \
  --data-binary @archivo.bin
echo -e "\n"

echo "=== Cabecera personalizada ==="
curl -H "X-Custom-Header: valor" https://jsonplaceholder.typicode.com/posts/1
echo -e "\n"

echo "=== Enviar cookies ==="
curl -b "usuario=juan;rol=admin" https://jsonplaceholder.typicode.com/posts/1
echo -e "\n"

echo "=== Guardar y reutilizar cookies ==="
curl -c cookies.txt https://jsonplaceholder.typicode.com/posts/1
curl -b cookies.txt https://jsonplaceholder.typicode.com/posts/1
echo -e "\n"

echo "=== Ignorar SSL ==="
curl -k https://jsonplaceholder.typicode.com/posts/1
echo -e "\n"

echo "=== Forzar HTTP/2 ==="
curl --http2 https://jsonplaceholder.typicode.com/posts/1
echo -e "\n"

echo "=== Forzar HTTP/3 ==="
curl --http3 https://jsonplaceholder.typicode.com/posts/1
echo -e "\n"

echo "=== Verbose ==="
curl -v https://jsonplaceholder.typicode.com/posts/1
echo -e "\n"

echo "=== Código HTTP ==="
curl -s -o /dev/null -w "%{http_code}\n" https://jsonplaceholder.typicode.com/posts/1
echo -e "\n"

echo "=== Agente de usuario ==="
curl -A "MiAgente/1.0" https://jsonplaceholder.typicode.com/posts/1
echo -e "\n"

echo "=== Limitar velocidad de descarga ==="
curl --limit-rate 100K https://jsonplaceholder.typicode.com/posts -o out.json
echo -e "\n"

echo "=== Usar proxy ==="
curl -x http://proxyservidor:8080 https://jsonplaceholder.typibcode.com/posts/1
echo -e "\n"
