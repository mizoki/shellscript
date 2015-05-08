#!/bin/sh
# Macのシステムファイルの削除
#
# Ver.1.00 (2012/09/18) : 作成
# Ver.2.00 (2015/05/08) : リソースフォークも削除するように変更

find . -name ".DS_Store" -or -name "._*" -exec echo delete {} ";" -exec rm -rf {} ";"
