/*
* @Descripttion : 
* @Author       : Seulf
* @Date         : 2021-03-10 00:43:13
* @LastEditors  : Seulf
* @LastEditTime : 2021-03-13 01:06:27
*/

# 创建变量
# $null $true $false $_(当前处理的变量)
$a = 12
Write-Output $a

# 创建数组
$c = @(1, 2, 3, "123")
Write-Output $c[3]

# 创建哈希表
$d = @{"name" = 'Jack'; "age" = 12 }
Write-Output $d['name']
Write-Output $d.name

# if语句
if ($a -lt 12) {
    Write-Output "Ok"
}
elseif ($a -gt 12) {
    Write-Output "No"
}
else {
    Write-Output "Yes"
}

# switch语句
switch ($a) {
    12 { Write-Output "$a"; break }
    Default { Write-Output "no $a" }
}

# for语句
for ($i = 0; $i -lt $c.Count; $i++) {
    Write-Output $c[$i]
}
foreach ($i in $c) {
    Write-Output $i
}

# while循环
$i = 0
while ($i -lt $c.Count) {
    Write-Output $i
    $i++
}

