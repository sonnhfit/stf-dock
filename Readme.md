
# Installation

* install docker
* install docker-compose
* clone this repo
* config 
* build 

# Cài docker
gõ từng lệnh bên dưới hoặc xem tại link chính thức [install docker](https://docs.docker.com/engine/install/ubuntu/)
```
$ sudo apt-get update

$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
   
```

```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
```
sudo apt-key fingerprint 0EBFCD88
```

```
$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```


```
$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io

```
Cấp quyền cho lệnh docker 
```
sudo usermod -aG docker $USER
```


# Cài docker compose 
link cài đặt chính thức tại [install docker compose](https://docs.docker.com/compose/install/#install-compose)

```
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
```

# config 
sửa địa chỉ IP ở trong file `.env` thành địa chỉ của máy

# build 
Run `docker-compose up -d --build` 
# sử dụng 
Gõ địa chỉ ip đã cài đặt vào trình duyệt,  
đăng nhập bằng bất kỳ địa chỉ email nào hợp lệ 

- Bật chế độ debug trên điện thoại android (chưa hỗ trợ android 10)
- cắm thiết bị vào 

