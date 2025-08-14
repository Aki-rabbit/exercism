#!/bin/bash

# 引数として問題名を受け取る
problem_name=$1

# 解答後のコミットとプッシュ
git add .
git commit -m "$problem_name 解答"
git push origin main

# ファイル名をハイフンからアンダースコアに変換
file_name=$(echo $problem_name | tr '-' '_')

# exercismに提出
exercism submit ./ruby/$problem_name/$file_name.rb

echo "解答のコミット、プッシュ、提出が完了しました。"