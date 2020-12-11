# Shell文本数据库

## 添加数据
./db.sh db_set 10 '{"name": "huan", "work": "frontend"}'
./db.sh db_set 12 '{"name": "qiqi", "work": "home"}'

db_set 函数对于极其简单的场景其实有非常好的性能，因为在文件尾部追加写入通常是非常高效的。

## 获取数据
./db.sh db_get 10

如果这个数据库中有着大量记录，则db_get 函数的性能会非常糟糕。每次你想查找一个键时，db_get 必须从头到尾扫描整个数据库文件来查找键的出现。

## 延伸
为了高效查找数据库中特定键的值，我们需要一个数据结构：索引（index）。
索引背后的大致思想是，保存一些额外的元数据作为路标，帮助你找到想要的数据。

## 参考文档

shell变量赋值不能有空格

### 函数语法

在 Shell中，调用函数时可以向其传递参数。在函数体内部，通过 $n 的形式来获取参数的值，例如，$1 表示第一个参数，$2 表示第二个参数...

带参数的函数示例：

#!/bin/bash
funWithParam(){
    echo "The value of the first parameter is $1 !"
    echo "The value of the second parameter is $2 !"
    echo "The value of the tenth parameter is $10 !"
    echo "The value of the tenth parameter is ${10} !"
    echo "The value of the eleventh parameter is ${11} !"
    echo "The amount of the parameters is $# !"  # 参数个数
    echo "The string of the parameters is $* !"  # 传递给函数的所有参数
}
funWithParam 1 2 3 4 5 6 7 8 9 34 73

$#	传递给函数的参数个数。
$*	显示所有传递给函数的参数。
$@	与 $* 相同，但是略有区别，请查看 Shell 特殊变量。
$?	函数的返回值。

### case语法
case 值 in
模式1)
    command1
    command2
    command3
    ;;
模式2）
    command1
    command2
    command3
    ;;
*)
    command1
    command2
    command3
    ;;
esac
