#!/bin/sh
# .DS_Store ファイルの削除
#
# Ver.1.00 (2012/09/18) : 作成
#

find . -name ".DS_Store" -exec echo delete {} ";" -exec rm -rf {} ";"
