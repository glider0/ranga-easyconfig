**请注意：这个项目已经失去维护。对于 4.5.9 及以上的完整更新，除非另有说明，你的大部分主要设置将会保留，极少数设置可能会被重置。因此本项目已经没有必要进行。**

以下是原 README

# NSWA Ranga Easy-Config 自动配置脚本

## 为什么会有这个脚本

很多用户抱怨更新完整包后系统配置会丢失，然后不得不重复配置很多工作，但是，NSWA Ranga 具有强大的脚本化能力，定制一个属于你的一键“初始化”脚本非常简单，得益于 [命令行客户端](https://github.com/glider0/ranga-client/)，创造力得以一定程度的解放。

## 要如何配置

修改 `config-main.sh` 等配置文件以设置你想要的各项参数。它们是一系列的 Key-Value 对以控制 easyconfig 如何配置系统。

配置文件中具有详细的注释。

更新完整包系统后，不要在 Web 控制台上进行任何操作，运行 `./initsystem.sh` 开始配置系统，不可重复运行

另外，如果需要执行自定义命令，你应该写入 `preuser.sh` 和 `postuser.sh` 以避免污染主要脚本。

请参考手册，你需要的一切这里都有： https://glider0.github.io/doc.zh/euman.html
