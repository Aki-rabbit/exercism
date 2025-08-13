#!/bin/bash

# 引数として問題名を受け取る
problem_name=$1

# 解答後のコミットとプッシュ
git add .
git commit -m "$problem_name 解答"
git push origin main

# exercismに提出
exercism submit ./ruby/$problem_name/lib/$problem_name.rb

echo "解答のコミット、プッシュ、提出が完了しました。"