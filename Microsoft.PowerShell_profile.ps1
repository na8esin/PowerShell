Set-Alias -name gco -value gitCheckout
Set-Alias -name gca -value gitCommitAutomaticallyStageFiles
Set-Alias -name gpom -value gitPushOriginMaster

function prompt(){
    $Host.ui.RawUI.WindowTitle = Convert-Path (pwd).path
}

function gitCommitAutomaticallyStageFiles($message) {
  git commit -a -m $message
}
function gitPushOriginMaster() {
  git push origin master
}
function gitCheckout() {
  git checkout
}