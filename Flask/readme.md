## SteamDB Flask

### Install

1. download python3.7, best with 3.10 and then follow the instruction to finish install, remember add bin folder to PATH
2. open cmd or PowerShell or terminal whatever can enter command line, then type pip install virtualenv
3. then cd to folder, it looks like .../SteamDB/Flask
4. type virtualenv venv
5. cd to folder Scripts, it looks like ..../SteamDB/Flask/venv/Scripts.
6. type .\activate(on Windows) or activate(on Linux, etc.)，if you see a (venv) in the front of your command line, it means you did right.
7. cd to misc folder, it should look like ..../SteamDB/misc
8. type pip install -r requirements.txt and wait for auto installation.
9. cd to flask folder, it should look like ..../SteamDB/Flask
10. type python -m flask run
11. if you see "Running on http://127.0.0.1:5000", that means you did right.
12. keep the window open, you can just put it to backstage, but ***DO NOT*** close it.
13. check details in api docs

### 安装

1. 下载python 3.7以上的版本，最好是3.10，并根据安装程序向导完成安装，注意将bin文件夹添加到PATH环境变量。
2. 打开cmd， PowerShell，或者terminal随便什么能输入命令行的东西，然后输入pip install virtualenv
3. 然后cd到文件夹，路径看起来是这样的..../SteamDB/Flask
4. 输入virtualenv venv
5. 然后cd到文件夹，路径看起来是这样的..../SteamDB/Flask/venv/Scripts.
6. 输入 .\activate(Windows系统) 或者 activate(Linux系统等)，如果你看到在命令行最前面多了 (venv) 证明你做对了。
7. 接着cd到misc文件夹，路径看起来是这样的 ..../SteamDB/misc.
8. 输入 pip install -r requirements.txt 然后等待自动安装.
9. cd到Flask文件夹，路径看起来是这样的 ..../SteamDB/Flask.
10. 输入 python -m flask run.
11. 如果你在命令行上看到了 Running on http://127.0.0.1:5000，证明你做对了.
12. 保持这个窗口的打开，你可以把它加入后台，但***不要***关闭这个进程。
13. 在api_docs中了解更多。