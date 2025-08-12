#!/bin/bash

# 引数として問題名を受け取る
problem_name=$1

# 問題をダウンロード
exercism download --track=ruby --exercise="$problem_name"
# Gitの操作
git add .
git commit -m "$problem_name 解答前"
git push origin main

echo "ダウンロードと初期コミットが完了しました。"
echo "解答を作成してください。"