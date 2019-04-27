# NSWA Ranga Easy-Config 自动配置脚本

## 为什么会有这个脚本

很多用户抱怨更新完整包后系统配置会丢失，然后不得不重复配置很多工作，但是，NSWA Ranga 具有强大的脚本化能力，定制一个属于你的一键“初始化”脚本非常简单，得益于 [命令行客户端](https://github.com/glider0/ranga-client/)，创造力得以一定程度的解放。

## 要如何配置

复制 `config-main.sh` 等配置文件以设置你想要的各项参数。

更新完整包系统后，不要在 Web 控制台上进行任何操作，运行 `./initsystem.sh` 开始配置系统，不可重复运行

另外，如果需要执行自定义命令，你应该写入 `preuser.sh` 和 `postuser.sh` 以避免污染主要脚本。

请参考手册，你需要的一切这里都有： https://glider0.github.io/doc.zh/euman.html
