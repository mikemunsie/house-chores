if [ "$1" = "prod" ]; then
  ENV="prod"
else
  ENV="dev"
fi

echo "Building for: ${ENV}"

docker build client --tag house-chores-client
docker build server --tag house-chores-server

cd client;
npm run dev &

cd ..;

cd docker/${ENV}/
docker-compose build
docker-compose up