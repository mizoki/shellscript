#!/bin/sh
# Macのシステムファイルの削除
#
# Ver.1.00 (2012/09/18) : 作成
# Ver.2.00 (2015/05/08) : リソースフォークも削除するように変更
# Ver.2.01 (2015/07/22) : ファイルが削除できない問題を修正
# Ver.2.10 (2015/07/22) : ファイルの削除と検索をオプションで分岐するように変更

if [ "$1" = "-D" ]; then
  find . -name ".DS_Store" -print0 | xargs -0 rm -v
  find . -name "._*" -print0 | xargs -0 rm -v
else
  find . -name ".DS_Store"
  find . -name "._*"
fi
