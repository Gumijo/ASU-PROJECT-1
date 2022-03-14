#Homework7
#Daniela Lugo Mendez 
$directory = Get-ChildItem -Path *
foreach ($item in $directory){
    Get-Acl $item
}