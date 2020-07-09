Set-Alias -name gco -value gitCheckout
Set-Alias -name gca -value gitCommitAutomaticallyStageFiles
Set-Alias -name gcad -value gitCommitAutomaticallyStageFilesDevelop
Set-Alias -name gpom -value gitPushOriginMaster
Set-Alias -name gpod -value gitPushOriginDevelop
Set-Alias -name glo -value gitLogOneline
Set-Alias -name unit -value vendorBinPhpUnit
Set-Alias -name cake -value binCakeServer

function prompt(){
    $Host.ui.RawUI.WindowTitle = Convert-Path (pwd).path
    $env:LANG = "ja_JP.UTF-8"
}

function binCakeServer {
  bin/cake server -H 0.0.0.0
}
function vendorBinPhpUnit($path) {
  vendor/bin/phpunit $path
}

function gitCommitAutomaticallyStageFilesDevelop($message) {
  git pull ; gca $message; gpod;
}
function gitCommitAutomaticallyStageFiles($message) {
  git commit -a -m $message
}
function gitPushOriginDevelop() {
  git push origin develop
}
function gitPushOriginMaster() {
  git push origin master
}
function gitCheckout() {
  git checkout
}
function gitLogOneline($rows) {
  git log --oneline $rows
}

function nano($path) {
  wsl nano /mnt/c/Users/$env:USERNAME/$path
}