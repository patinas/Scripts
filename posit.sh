#!/bin/bash

set -e

IMAGE_NAME=rstudio/rstudio-workbench:ubuntu1804
APP_NAME=posit-workbench
REPLICAS=2

# Create namespace
kubectl create namespace ${APP_NAME}

# Create configmap
kubectl -n ${APP_NAME} create configmap ${APP_NAME}-config --from-file=config/

# Create secret
kubectl -n ${APP_NAME} create secret generic ${APP_NAME}-secret --from-literal=password='test1234!'

# Create deployment
cat <<EOF | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ${APP_NAME}
  namespace: ${APP_NAME}
spec:
  replicas: ${REPLICAS}
  selector:
    matchLabels:
      app: ${APP_NAME}
  template:
    metadata:
      labels:
        app: ${APP_NAME}
    spec:
      containers:
      - name: ${APP_NAME}
        image: ${IMAGE_NAME}
        imagePullPolicy: Always
        env:
        - name: ENV
          value: 'production'
        ports:
        - containerPort: 80
        volumeMounts:
        - name: config
          mountPath: /etc/config
          readOnly: true
      volumes:
      - name: config
        configMap:
          name: ${APP_NAME}-config
      - name: secret
        secret:
          secretName: ${APP_NAME}-secret
EOF

# Create service
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Service
metadata:
  name: ${APP_NAME}
  namespace: ${APP_NAME}
spec:
  selector:
    app: ${APP_NAME}
  ports:
  - name: http
    port: 80
    targetPort: 80
EOF
