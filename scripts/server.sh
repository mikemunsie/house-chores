cd ../client

docker build server --tag house-chores-server

cd docker/dev
docker-compose build
docker-compose up