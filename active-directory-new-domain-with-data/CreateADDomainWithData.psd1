@{ 

    AllNodes = @( 

        @{ 

            Nodename = 'localhost'

            PSDscAllowDomainUser = $true

        }
    )



    
    NonNodeData = @{



        UserData = @'
UserName,Password,Dept,Title
DanPark,PowerShell4,IT,Specialist
Alice,PowerShell4,Accounting,Manager
Charlie,PowerShell4,Marketing,Manager
Debbie,PowerShell4,Operations,Manager
Eddie,PowerShell4,Accounting,Specialist
Frieda,PowerShell4,IT,Specialist
George,PowerShell4,Marketing,Specialist
Harriet,PowerShell4,Operations,Specialist
'@



        RootOUs = 'Accounting','IT','Marketing','Operations'

        ChildOUs = 'Users','Computers','Groups'

        TestObjCount = 5



    }

}
