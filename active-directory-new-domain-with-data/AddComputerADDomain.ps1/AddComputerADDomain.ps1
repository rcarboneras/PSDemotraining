Configuration ADtotheDomain
{ 
   param 
   ( 
        [Parameter(Mandatory)]
        [String]$DomainName,

        [Parameter(Mandatory)]
        [System.Management.Automation.PSCredential]$AdminCreds

   ) 
        
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName xComputerManagement
    Import-DscResource -ModuleName xDSCFirewall
            
    [System.Management.Automation.PSCredential]$DomainCreds = New-Object System.Management.Automation.PSCredential ("$DomainName\$($AdminCreds.UserName)",$AdminCreds.Password)

    Node localhost
    {
        LocalConfigurationManager
        {
            ActionAfterReboot = 'ContinueConfiguration'
            ConfigurationMode = 'ApplyOnly'
            RebootNodeIfNeeded = $true
            AllowModuleOverWrite = $true
        }

        Service Winrm
        {
            Name = "Winrm"
            StartupType = "Automatic"
            State = "Running"
        }

        xComputer addtodomain
        {
            Name = $env:COMPUTERNAME
            Credential = $DomainCreds
            DomaiNName = $DomainName
             
        }
        xDSCFirewall DisableFirewall
        {
            Ensure = "Absent"
            Zone = "Domain"

        }

    }

}


