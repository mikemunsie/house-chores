cd docker/dev
docker-compose exec client pkill -f node
docker-compose exec client "${@:1}"
docker-compose restart client