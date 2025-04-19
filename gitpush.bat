@echo off
chcp 65001 > nul

rem 检查是否有未提交的更改
git diff --quiet --exit-code
if %errorlevel% equ 0 (
    echo 本地没有修改，无需提交。
    pause
    exit /b
)

echo 开始提交并上传当前文件夹的 Git 仓库...
git add .
if %errorlevel% neq 0 (
    echo 执行 git add . 时出错！
    pause
    exit /b
)
git commit -m "upd"
if %errorlevel% neq 0 (
    echo 执行 git commit -m "upd" 时出错！
    pause
    exit /b
)
git push
if %errorlevel% neq 0 (
    echo 执行 git push 时出错！
    pause
    exit /b
)
echo 提交并上传成功！
pause