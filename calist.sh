#!/bin/sh

# Description: 指定した年月の1ヵ月分のリストを標準出力に表示

# 引数の数を確認
if [ $# -lt 2 ]; then
  echo "Name"
  echo "       calist.sh - View a list of one month of the specified year and month to standard output"
  echo "Usage"
  echo "       calist.sh %Year% %Month% %prefix% %suffix%"
  echo ""
  echo "           Year : Required"
  echo "          Month : Required"
  echo "         Prefix : Optional"
  echo "         Suffix : Optional"
  exit
fi

# 引数を変数に代入
Year=$1
Month=$2
Prefix=$3
Suffix=$4

# 引数の数値判定
expr "$Year" + 1 > /dev/null 2>&1
[ $? -gt 1 ] && echo "Invalid year '$Year'" && exit
expr "$Month" + 1 > /dev/null 2>&1
[ $? -gt 1 ] && echo "Invalid month '$Month'" && exit

# $Year が1000より小さいなら2000年を基準にする
[ $Year -lt 1000 ] && Year=`expr "$Year" + 2000`

# $Month が1より小さいなら何もせず終了
[ $Month -lt 1 ] && echo "Invalid month '$Month'" &&  exit
# $Month が12より大きいなら何もせず終了
[ $Month -gt 12 ] && echo "Invalid month '$Month'" &&  exit

# 変数の初期化（date関数に失敗したら終了）
STARTDATE=`date -d "$Year-$Month-1" "+%Y%m%d"`
[ $? -ne 0 ] && exit
ENDDATE=`date -d "$STARTDATE 1month - 1day" "+%Y%m%d"`
[ $? -ne 0 ] && exit

for ((i=$STARTDATE;i<=$ENDDATE;i++)); do
  echo "$Prefix$i$Suffix"
done
