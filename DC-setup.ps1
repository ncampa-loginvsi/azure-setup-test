$connectTestResult = Test-NetConnection -ComputerName stereomckhotmailcommon.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
# Save the password so the drive will persist on reboot
cmd.exe /C "cmdkey /add:`"stereomckhotmailcommon.file.core.windows.net`" /user:`"localhost\stereomckhotmailcommon`" /pass:`"o+xfn2mLmxOI4hre8kkVbcfvIuB5g/PYeJWK3+R6mu0LhtauiEL+s1IWU4Ek+r7L6di++dD5LbkdqFcMuvYufw==`""
# Mount the drive
New-PSDrive -Name Z -PSProvider FileSystem -Root "\\stereomckhotmailcommon.file.core.windows.net\nas" -Persist
} else {
Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}