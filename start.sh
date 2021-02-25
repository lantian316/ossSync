#!/bin/bash
#/usr/bin/rsync
# 挂载阿里云OSS,需要保证宿主机有网络才行 如下是将深圳节点下的BUCKET_NAME挂载到 /aliOssStone

echo ${BUCKET_NAME}:${ACCESS_KEY}:${ACCESS_SECRET} > /etc/passwd-ossfs
chmod 640 /etc/passwd-ossfs

ossfs ${BUCKET_NAME} /aliOssStone -ourl=${BUCKET_ENDPOINT}
if [ $? != 0 ];then
    echo "failed"
    exit 2
else
    echo "succedd"
fi
sleep 3
 
while true
do
    /usr/bin/rsync -var /localOssStone/ /aliOssStone >> /tmp/rsync.log
    # 将本地localOssStone目录的内容同步至aliOssStone，也就是我们的oss
    sleep 600
done
