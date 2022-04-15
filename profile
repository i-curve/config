Import-Module DirColors
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme JanDeDobbeleer

# 设置默认路径
$defaultPath=Get-Location
if ($defaultPath.ToString() -eq "C:\Users\curve" -or $defaultPath.ToString() -eq "C:\Windows\System32") {
	Set-Location E:\desktop\
}

# remove-item alias:curl
Remove-Item alias:where -force
set-alias which "C:\Windows\system32\where.exe"
Invoke-Expression (&starship init powershell)
Set-PSReadLineOption -EditMode Emacs

# 设置预测文本来源为历史记录
Set-PSReadLineOption -PredictionSource History
# 每次回溯输入历史，光标定位于输入内容末尾
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
# 设置 Tab 为菜单补全和 Intellisense
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
# 设置 Ctrl+d 为退出 PowerShell
Set-PSReadlineKeyHandler -Key "Ctrl+d" -Function ViExit
# 设置 Ctrl+z 为撤销
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo

# Autocompletion for arrow keys
# 设置向上键为后向搜索历史记录
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
# 设置向下键为前向搜索历史纪录
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward


#-------------------------------   Set Alias BEGIN    -------------------------------
# 3. 查看目录 ls & ll
function ListDirectory {
	(Get-ChildItem).Name
	Write-Host("")
}
Set-Alias -Name ls -Value ListDirectory
Set-Alias -Name ll -Value Get-ChildItem

# 4. 打开当前工作目录
function OpenCurrentFolder {
	param
	(
		# 输入要打开的路径
		# 用法示例：open C:\
		# 默认路径：当前工作文件夹
		$Path = '.'
	)
	Invoke-Item $Path
}
Set-Alias -Name open -Value OpenCurrentFolder
#-------------------------------    Set Alias END     -------------------------------




#-------------------------------   Set Network BEGIN    -------------------------------
# 1. 获取所有 Network Interface
function Get-AllNic {
	Get-NetAdapter | Sort-Object -Property MacAddress
}
Set-Alias -Name getnic -Value Get-AllNic

# 2. 获取 IPv4 关键路由
function Get-IPv4Routes {
	Get-NetRoute -AddressFamily IPv4 | Where-Object -FilterScript {$_.NextHop -ne '0.0.0.0'}
}
Set-Alias -Name getip -Value Get-IPv4Routes

# 3. 获取 IPv6 关键路由
function Get-IPv6Routes {
	Get-NetRoute -AddressFamily IPv6 | Where-Object -FilterScript {$_.NextHop -ne '::'}
}
Set-Alias -Name getip6 -Value Get-IPv6Routes
#-------------------------------    Set Network END     -------------------------------
