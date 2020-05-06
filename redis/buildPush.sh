#！bin/sh
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
tag=5.0.4
repostoryHost=registry.cn-shenzhen.aliyuncs.com
repostoryNameSpace=cocoadel
docker build -t ${repostoryHost}/${repostoryNameSpace}/redis:${tag} .
docker push ${repostoryHost}/${repostoryNameSpace}/redis:${tag}