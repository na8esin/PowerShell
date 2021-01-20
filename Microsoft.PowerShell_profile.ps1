Set-Alias -name gac -value gitAddCheckout
Set-Alias -name gco -value gitCheckout
Set-Alias -name gca -value gitCommitAutomaticallyStageFiles
Set-Alias -name gcad -value gitCommitAutomaticallyStageFilesDevelop
Set-Alias -name gpo -value gitPushOrigin
Set-Alias -name gpom -value gitPushOriginMaster
Set-Alias -name gpod -value gitPushOriginDevelop
Set-Alias -name glo -value gitLogOneline
Set-Alias -name unit -value vendorBinPhpUnit
Set-Alias -name cake -value binCakeServer

Set-PSReadlineOption -BellStyle None

function prompt(){
    $Host.ui.RawUI.WindowTitle = Convert-Path (pwd).path
    $env:LANG = "ja_JP.UTF-8"
    [System.Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
    [System.Console]::InputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")

    # git logなどのマルチバイト文字を表示させるため (絵文字含む)
    $env:LESSCHARSET = "utf-8"
}

function binCakeServer {
  bin/cake server -H 0.0.0.0
}
function vendorBinPhpUnit($path) {
  vendor/bin/phpunit $path
}
function gitAddCheckout() {
  git add . ; git checkout;
}
function gitCommitAutomaticallyStageFilesDevelop($message) {
  git pull ; gca $message; gpod;
}
function gitCommitAutomaticallyStageFiles($message) {
  git add . ; git commit -a -m $message
}
function gitPushOrigin($branch) {
  git push origin $branch
}
function gitPushOriginDevelop() {
  git push origin develop
}
function gitPushOriginMaster() {
  git push origin master
}
function gitCheckout($branch) {
  git checkout $branch
}
function gitLogOneline($rows) {
  git log --oneline $rows
}

function nano($path) {
  wsl nano /mnt/c/Users/$env:USERNAME/$path
}