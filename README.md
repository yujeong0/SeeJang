롬복 적용
yunyoung1819.tistory.com/95


Redis 도커 실행
docker run -p 6379:6379 --name redis_boot -d redis
docker exec -i -t redis_boot redis-cli