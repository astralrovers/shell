#bash不支持浮点运算，需要通过bc进行，scale是一个内置变量，指定它来说明结果的精度
var=$(echo "scale=3; 2.7 / 2" | bc)
echo "the result is $var"


sum=$(expr 3 + 5)
sum2=$[3 + 5]
echo "加法的第一种方式：$sum"
echo "加法的第二种方式：$sum2"

#一种更加清晰的方式
var2=$(bc << EOF
scale = 4
a = ($sum + $sum2)
b=$var
a / b
EOF
)

echo "last : $var2"

#通过echo $? 查看退出码(小于255)
#exit 5

if grep "astralrovers" /etc/passwd; then    #执行语句时if时根据退出的状态码是否
                                            #为0去判断的
    echo "找到用户"
else
    echo "用户不存在"
fi
