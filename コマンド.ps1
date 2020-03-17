New-Item -Path . -Name C:\xampp\php -Value C:\Users\t.watanabe\scoop\apps\php56\current -ItemType SymbolicLink
New-Item -Path . -Name rootfs -Value C:\Users\t.watanabe\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs -ItemType SymbolicLink

gcm mysqld | fl
Start-Job {mysqld}

Set-Alias -name dc -value docker-compose
Set-Alias -name gca -value "git commit -a -m"

# out-file


# �t�@�C�������ċA�I�Ƀ��l�[��
Get-ChildItem -Recurse -File | Rename-Item -NewName { $_.Name -replace 'insurer','product'}
# Set-Content�o�[�W�����B�u����ɁA��ڂ̒u���Ώۂ�����ꍇ�͏��Ԃɒ���
Get-ChildItem -Recurse -File -Name |
 %{$FileName=$_; `
  (gc -Raw $_) -creplace 'Insurer','Product' -creplace 'insurer','product' |
  Set-Content -encoding Default $FileName -NoNewline }


# ���l�[���B��K�w�����̏ꍇ
ls | Rename-Item -NewName { $_.Name -replace 'cat','agent'}

# �n�C�t���n�̃p�X��ς���
Get-ChildItem -Recurse -File -Name |
 %{$FileName=$_; (gc -Raw $_)�@-creplace 'parent-agent','group' |
 Set-Content -encoding Default $FileName -NoNewline }

# �t�@�C���w�肵�āA���W���[������u��
$FileName="graphql.schema.ts"; (gc -Raw $FileName) -creplace 'cat','agent' -creplace 'Cat','Agent' |
 out-file -encoding Default $FileName


# node_modules���ċA�I�ɍ폜����
ri '*/node_modules' -Recurse -Force

# �o�b�N�O�����h�v���Z�X��cake�𗧂��グ��
$proc = start -filepath .\bin\cake -ArgumentList "server -p 8082" -WindowStyle Hidden -PassThru

# php�̃v���Z�X���m�F����
Get-Process -name php

Get-Process -name php | %{spps $_.id}


