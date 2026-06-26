# Semana 9 - Introducción a Kubernetes

## Objetivo

Comprender el funcionamiento básico de Kubernetes mediante la creación y administración de recursos dentro de un clúster local, utilizando Minikube y kubectl para desplegar, exponer y escalar aplicaciones contenerizadas.

---

# Actividades realizadas

- Se verificó la instalación y configuración de kubectl.
- Se creó un clúster local utilizando Minikube.
- Se validó el acceso al clúster de Kubernetes.
- Se consultaron los recursos básicos del clúster.
- Se creó un namespace llamado `laboratorio-k8s`.
- Se desplegó una aplicación Nginx mediante un Deployment.
- Se creó un Service de tipo ClusterIP para exponer la aplicación.
- Se accedió al servicio mediante `kubectl port-forward`.
- Se escaló el Deployment a tres réplicas.
- Se consultaron los eventos del namespace.
- Se eliminaron los recursos creados para finalizar la práctica.

---

# Respuestas de la actividad

## 1. ¿Qué es Kubernetes?

Kubernetes es una plataforma de orquestación de contenedores que permite desplegar, administrar y escalar aplicaciones de forma automática. Facilita la gestión de múltiples contenedores distribuidos en uno o varios nodos, garantizando alta disponibilidad y una administración eficiente.

---

## 2. ¿Qué es un Pod?

Un Pod es la unidad mínima de ejecución en Kubernetes. Puede contener uno o varios contenedores que comparten red, almacenamiento y recursos, ejecutándose siempre en el mismo nodo del clúster.

---

## 3. ¿Qué función cumple un Deployment?

Un Deployment administra la creación y actualización de Pods, garantizando que siempre exista el número de réplicas definido por el usuario. Además, permite realizar actualizaciones y recuperaciones automáticas cuando ocurre algún fallo.

---

## 4. ¿Para qué sirve un Service?

Un Service proporciona un punto de acceso estable para uno o varios Pods, permitiendo la comunicación entre aplicaciones o con usuarios externos sin depender de la dirección IP individual de cada Pod.

---

## 5. ¿Qué ventajas ofrece Kubernetes frente a ejecutar contenedores manualmente?

Kubernetes automatiza tareas como el despliegue, escalamiento, recuperación ante fallos, balanceo de carga y administración de recursos. Esto facilita la disponibilidad de las aplicaciones y simplifica la administración de infraestructuras basadas en contenedores.

---

# Evidencias

## Evidencia 1. Verificación de kubectl

```bash
kubectl version --client
```

![Kubectl](img/semana9/imageVClient.png)

---

## Evidencia 2. Información del clúster

```bash
kubectl cluster-info
```

![Cluster](img/semana9/imageCluster.png)

---

## Evidencia 3. Nodo del clúster

```bash
kubectl get nodes
```

![Nodes](img/semana9/imageGnodes.png)

---

## Evidencia 4. Namespaces disponibles

```bash
kubectl get namespaces
```

![Namespaces](img/semana9/A2/imageGNamesSpaces.png)

---

## Evidencia 5. Recursos iniciales

```bash
kubectl get deployments
kubectl get pods
kubectl get services
```

![Recursos](img/semana9/A2/imageGdeplo.png)
![Recursos](img/semana9/A2/imageG-P-S.png)

---

## Evidencia 6. Creación del namespace

```bash
kubectl create namespace laboratorio-k8s
kubectl get namespaces
```

![Namespace](img/semana9/A3/imageNSCreated.png)
![Namespace](img/semana9/A3/imageGN.png)

---

## Evidencia 7. Creación del Deployment

```bash
kubectl create deployment web-nginx --image=nginx -n laboratorio-k8s
kubectl get deployments -n laboratorio-k8s
kubectl get pods -n laboratorio-k8s
```

![Deployment](img/semana9/A4/imageCDeplo.png)
![Deployment](img/semana9/A4/image2.png)
![Deployment](img/semana9/A4/image3.png)

---

## Evidencia 8. Creación del Service

```bash
kubectl expose deployment web-nginx --type=ClusterIP --port=80 -n laboratorio-k8s
kubectl get services -n laboratorio-k8s
kubectl describe service web-nginx -n laboratorio-k8s
```

![Service](img/semana9/A5/image1.png)
![Service](img/semana9/A5/image2.png)
![Service](img/semana9/A5/image3.png)

---

## Evidencia 9. Acceso mediante Port Forward

```bash
kubectl port-forward service/web-nginx 8080:80 -n laboratorio-k8s
```

![PortForward](img/semana9/A6/image1.png)

![Nginx](img/semana9/A6/image2.png)

---

## Evidencia 10. Escalamiento del Deployment

```bash
kubectl scale deployment web-nginx --replicas=3 -n laboratorio-k8s
kubectl get deployments -n laboratorio-k8s
kubectl get pods -n laboratorio-k8s
```

![Scale](img/semana9/A7/image1.png)
![Scale](img/semana9/A7/image2.png)
![Scale](img/semana9/A7/image3.png)

---

## Evidencia 11. Consulta de recursos y eventos

```bash
kubectl get all -n laboratorio-k8s
kubectl get events -n laboratorio-k8s
```

![Eventos](img/semana9/A8/image1.png)
![Eventos](img/semana9/A8/image2.png)

---

## Evidencia 12. Eliminación del laboratorio

```bash
kubectl delete namespace laboratorio-k8s
kubectl get namespaces
```

![Delete](img/semana9/A8/image3.png)

---

# Conclusión

Durante esta práctica se adquirieron los conceptos básicos de Kubernetes mediante el uso de un clúster local con Minikube. Se aprendió a crear namespaces, desplegar aplicaciones utilizando Deployments, exponer servicios mediante Services, acceder a las aplicaciones utilizando port-forward y escalar réplicas de forma automática. Finalmente, se eliminaron los recursos creados, comprendiendo el ciclo completo de administración de aplicaciones dentro de Kubernetes.