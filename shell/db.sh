#!/bin/bash

db_set() {
	echo "$1,$2" >> database
}

db_get() {
	grep "^$1," database | sed -e "s/^$1,//" | tail -n 1
}

command="$1"

case $command in
    db_set) 
        db_set "$2" "$3"
        ;;
    db_get) 
        db_get "$2"
        ;;
    *) echo "请输入db_set key value 存储数据 or db_get key 获取数据";;
esac

# status="baz"
# status=$(case $status in
#   "foo") echo "bar" ;;
#   "baz") echo "buh" ;;
#   *) echo $status ;;
# esac)
# echo "status: $status"