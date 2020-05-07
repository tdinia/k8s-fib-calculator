docker build -t timdinia/multi-client:latest -t timdinia/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t timdinia/multi-server:latest -t timdinia/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t timdinia/multi-worker:latest -t timdinia/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push timdinia/multi-client:latest
docker push timdinia/multi-server:latest
docker push timdinia/multi-worker:latest

docker push timdinia/multi-client:$SHA
docker push timdinia/multi-server:$SHA
docker push timdinia/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/client-deployment client=timdinia/multi-client:$SHA
kubectl set image deployments/server-deployment server=timdinia/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=timdinia/multi-worker:$SHA
