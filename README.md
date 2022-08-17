### Docker基本图像构建

## 建筑图像步骤
```bash
 1、base/{BaseImage|ReleaseImage} 在此路径创建image目录
 2、在gitlab-ci.yml 文件里面创建job
 3、加载common.sh脚本，并传递相关的变量
 ```
## common.sh 脚本介绍
```bash
 Usage: common.sh <imagename> [tag]
 Examples:
     common.sh ubuntu 16.04
     common.sh ubuntu 如果不指定tag默认为latest
 ```

## 标准化设计
```bash
1、在创建image目录名字时必须跟job名字保持一致
2、image路径必须要跟job stage名字保持一致，目前是BaseImage｜ReleaseImage，BaseImage用来存放最基础os image，ReleaseImage用来存放各编程语言使用的image 但是ReleaseImage必须依赖BaseImage构建。
