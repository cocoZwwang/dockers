#！bin/sh
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
tag=1.17.0
repostoryHost=registry.cn-shenzhen.aliyuncs.com
repostoryNameSpace=cocoadel
docker build -t ${repostoryHost}/${repostoryNameSpace}/nginx:${tag} .
docker push ${repostoryHost}/${repostoryNameSpace}/nginx:${tag}