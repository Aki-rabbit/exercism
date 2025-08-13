#!/bin/bash

# 引数として問題名を受け取る
# saddle-points のようにハイフンを含む名前を想定
problem_name=$1

# ディレクトリ名はハイフンのまま使用
problem_dir="$problem_name"

# ファイル名はハイフンをアンダースコアに置換して使用
test_file_name="${problem_name//-/_}_test.rb"

# テストファイルのパスを構築
test_file_path="./ruby/$problem_dir/$test_file_name"

# rubyコマンドでテストファイルを実行
ruby "$test_file_path"
