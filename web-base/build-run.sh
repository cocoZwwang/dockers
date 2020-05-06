#！bin/sh
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
#阿里云镜像仓库
repostoryHost=registry.cn-shenzhen.aliyuncs.com
#仓库命名空间
repostoryNamespace=cocoadel
tag=1.0
#暴露的端口
p=5001
fullJarName=$(ls |grep *.jar)
jarname=${fullJarName%.*}
tag=${jarname##*-}
service=${jarname%-*}
echo jarname: ${jarname}
echo tag: ${tag}
echo service: ${service}
imagename=${repostoryHost}/${repostoryNamespace}/${service}:${tag}
docker build --build-arg servicName=${jarname} --build-arg port=${p} -t ${imagename} .
# docker push  ${imagename}
path=$(pwd)
cd ../.. && \
docker-compose stop && \
docker-compose rm -f && \
docker-compose up -d
cd ${path}
