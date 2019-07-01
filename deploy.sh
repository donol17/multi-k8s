docker build -t donol17/multi-client -f ./client/Dockerfile ./client
docker build -t donol17/multi-server -f ./server/Dockerfile ./server
docker build -t donol17/multi-worker -f ./worker/Dockerfile ./worker
docker push donol17/multi-client
docker push donol17/multi-server
docker push donol17/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=donol17/multi-server
