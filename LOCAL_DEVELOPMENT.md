# Windows 本地预览

环境：RubyInstaller 3.3 with DevKit、Bundler 2.6.6；网站依赖由 Gemfile.lock 锁定。

在项目目录打开 Git Bash，运行：

```bash
bash run_server.sh
```

访问 http://127.0.0.1:4000 。修改页面后会自动重新构建并刷新；修改 _config.yml 后需重启。按 Ctrl+C 停止。

脚本实际执行：

```bash
bundle exec jekyll serve --open-url --livereload --trace
```

如果更习惯 PowerShell，也可以运行：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\run_server.ps1
```

端口被占用时，可在 PowerShell 命令末尾添加 `-Port 4001`。

首次配置或换电脑时，先安装 Ruby 3.3 和编译工具：

```powershell
winget install --id RubyInstallerTeam.RubyWithDevKit.3.3 --exact --source winget
```

重新打开终端后运行：

```powershell
gem install bundler -v 2.6.6 --no-document
bundle _2.6.6_ config set --local path vendor/bundle
bundle _2.6.6_ install
```

本地预览不需要 GitHub Token。Google Scholar 引用统计、外部字体等远程资源仍需要网络。此脚本只启动本机服务，不会推送或发布网站。
