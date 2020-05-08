#！bin/sh
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
tag=1.6.7.5
repostoryHost=registry.cn-shenzhen.aliyuncs.com
repostoryNameSpace=cocoadel
docker build -t ${repostoryHost}/${repostoryNameSpace}/mycat:${tag} .
docker push ${repostoryHost}/${repostoryNameSpace}/mycat:${tag}