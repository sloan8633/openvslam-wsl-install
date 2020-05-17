# OpenVSLAM install on Windows 10 WSL Ubuntu 16.04

- `demo_dataset`文件夹中包含了运行OpenVSLAM demo所需要的数据集
- `script`文件夹包含了WSL中快速安装OpenVSLAM环境的脚本

**测试环境：Windows 10 WSL Ubuntu 16.04**

- [OpenVSLAM Github仓库](https://github.com/xdspacelab/openvslam)
- [OpenVSLAM官方文档](https://openvslam.readthedocs.io/en/master/installation.html)
- [Windows 10 WSL Ubuntu 16.04下载地址](https://aka.ms/wsl-ubuntu-1604)

**OpenVSLAM安装脚本env_config.sh用法**

- 下载脚本到home目录:`wget https://raw.githubusercontent.com/sloan8633/openvslam-wsl-install/master/script/env_config.sh`
- 运行`bash env_config.sh`，安装过程由于网速和性能大概需要40mins左右

**demo数据集下载脚本download_demo_dataset.sh用法**

- 下载脚本到home目录：`wget https://raw.githubusercontent.com/sloan8633/openvslam-wsl-install/master/script/download_demo_dataset.sh`
- 运行`bash download_demo_dataset.sh`

**预览demo运行**

- 在WSL Ubuntu 16.04的home目录运行`cd openvslam/viewer && node app.js`
- 在Windows 10中启动浏览器输入地址`localhost:3001`