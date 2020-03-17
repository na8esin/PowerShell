New-Item -Path . -Name C:\xampp\php -Value C:\Users\t.watanabe\scoop\apps\php56\current -ItemType SymbolicLink
New-Item -Path . -Name rootfs -Value C:\Users\t.watanabe\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs -ItemType SymbolicLink

gcm mysqld | fl
Start-Job {mysqld}

Set-Alias -name dc -value docker-compose

# out-file


# ファイル名を再帰的にリネーム
Get-ChildItem -Recurse -File | Rename-Item -NewName { $_.Name -replace 'insurer','product'}
# Set-Contentバージョン。置換後に、二つ目の置換対象がある場合は順番に注意
Get-ChildItem -Recurse -File -Name |
 %{$FileName=$_; `
  (gc -Raw $_) -creplace 'Insurer','Product' -creplace 'insurer','product' |
  Set-Content -encoding Default $FileName -NoNewline }


# リネーム。一階層だけの場合
ls | Rename-Item -NewName { $_.Name -replace 'cat','agent'}

# ハイフン系のパスを変える
Get-ChildItem -Recurse -File -Name |
 %{$FileName=$_; (gc -Raw $_)　-creplace 'parent-agent','group' |
 Set-Content -encoding Default $FileName -NoNewline }

# ファイル指定して、モジュール名を置換
$FileName="graphql.schema.ts"; (gc -Raw $FileName) -creplace 'cat','agent' -creplace 'Cat','Agent' |
 out-file -encoding Default $FileName


# node_modulesを再帰的に削除する
ri '*/node_modules' -Recurse -Force

# バックグランドプロセスでcakeを立ち上げる
$proc = start -filepath .\bin\cake -ArgumentList "server -p 8082" -WindowStyle Hidden -PassThru

# phpのプロセスを確認する
Get-Process -name php

Get-Process -name php | %{spps $_.id}


