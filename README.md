# Build-Docker-iStoreOS
构建docker版iStoreOS

# 命令参考构建docker版immortalwrt
## 👉[immortalwrt](https://github.com/PlanetEditorX/immortalwrt)

# 适配
## Armbian版本docker
- 正常运行
## x86版本docker
- 编译失败，官方包直接编译异常，暂未解决。

# 操作步骤
## 1.拉取镜像
  ```bash
  docker pull yexundao/istoreos:latest
  ```
## 2.创建容器
  ```bash
  docker run --name iStoreOS -d --network macnet --privileged --restart=always yexundao/istoreos:latest /sbin/init
  ```
