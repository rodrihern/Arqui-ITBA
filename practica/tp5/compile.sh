docker start tp5
docker exec -it tp5 make -C /root/Toolchain clean
docker exec -it tp5 make -C /root/Toolchain all
docker exec -it tp5 make -C /root clean
docker exec -it tp5 make -C /root all