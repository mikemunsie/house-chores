if [ "$1" = "true" ]; then
  ENV="prod"
else
  ENV="dev"
fi

echo "Building for: ${ENV}"

docker build client --tag house-chores-client
docker build server --tag house-chores-server

cd docker/${ENV}/
docker-compose build
docker-compose up