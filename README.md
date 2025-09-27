# Flask + Docker + Kubernetes Practice

A simple project to practice deploying a Flask app with Docker and Kubernetes (via Minikube). Covers containerization, ConfigMaps, Deployments, and Services.

## Project Structure
k8s-practice/
├── app.py
├── Dockerfile
├── requirements.txt
└── k8s/
    ├── configmap.yaml
    ├── deployment.yaml
    └── service.yaml

## Workflow

### 1. Run Flask locally
python3 -m venv venv && source venv/bin/activate
pip install -r requirements.txt
python app.py

### 2. Build + run Docker image
docker build -t flask-k8s:latest .
docker run -p 5000:5000 flask-k8s:latest

### 3. Build image in Minikube
eval $(minikube docker-env)
docker build -t flask-k8s:latest .

### 4. Apply Kubernetes manifests
kubectl apply -f k8s/configmap.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

### 5. Verify + access
kubectl get pods
kubectl get svc
minikube service flask-service

## Useful Commands
kubectl scale deployment flask-app --replicas=5
kubectl logs <pod-name>
kubectl rollout restart deployment flask-app
kubectl rollout undo deployment flask-app

## Demonstrates
- Flask app with env vars
- Docker containerization
- ConfigMaps for config
- Deployments for pods
- Services (NodePort) for access
