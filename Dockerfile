FROM centos:7
Add ./start.sh /start.sh
RUN yum -y install wget curl \
    && mkdir -p /etc/yum.repos.d/bak \
    && mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/bak/ \
    && wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo \
    && wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo \
    && yum clean all \
    && yum makecache fast \
    && yum -y install yum-utils vim net-tools wget curl unzip zip dos2unix rsync telnet tree \
    && cd /tmp/ && wget http://gosspublic.alicdn.com/ossfs/ossfs_1.80.5_centos7.0_x86_64.rpm \
    && yum -y localinstall ossfs_1.80.5_centos7.0_x86_64.rpm \
    && mkdir /aliOssStone /localOssStone \
    && rm -f /anaconda-post.log /tmp/ossfs_1.80.5_centos7.0_x86_64.rpm /tmp/yum.log \
    && yum clean all && chmod +x /start.sh
CMD /start.sh
