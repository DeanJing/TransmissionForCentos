# TransmissionForCentos
### Centos安装Transmission一键脚本


````shell
yum update -y
````

````shell
yum install wget curl -y
wget --no-check-certificate https://raw.githubusercontent.com/DeanJing/TransmissionForCentos/main/TransmissionForCentos.sh
sh TransmissionForCentos.sh
````
