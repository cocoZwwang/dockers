#！bin/sh
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
tag=8.0.16
repostoryHost=registry.cn-shenzhen.aliyuncs.com
repostoryNameSpace=cocoadel
docker build -t ${repostoryHost}/${repostoryNameSpace}/mysql:${tag} .
docker push ${repostoryHost}/${repostoryNameSpace}/mysql:${tag}