# import-module "C:\_Repo\PnP-PowerShell\Commands\bin\Debug19\SharePointPnPPowerShell2019.psd1"
connect-pnponline https://tst-agora.atlas.hermes/sites/team-site -Credentials (Get-CredAdm) -UseAdfs
# Get-PnPConnection
Apply-PnPProvisioningTemplate .\samplePage.xml
# write-host "get-pnplist"
# get-pnplist
# Pause
# write-host "Get-PnPClientSidePage"
# Get-PnPClientSidePage home.aspx
# Pause
# write-host "get-pnpcontext"
# get-pnpcontext
# Pause
# write-host "Get-PnPAppAuthAccessToken"
# Get-PnPAppAuthAccessToken
# Pause
# write-host "Get-PnPConnection"
# Get-PnPConnection
# Pause
# write-host "Get-PnPAvailableClientSideComponents"
# Get-PnPAvailableClientSideComponents
# Pause

# get-pnpcontext