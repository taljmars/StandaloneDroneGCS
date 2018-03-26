
git.exe fetch --no-tags --progress https://github.com/taljmars/StandaloneDroneGCS +refs/heads/*:refs/remotes/origin/* --depth=19

echo --------------- Windows 64 --------------
del Windows64\*.zip
copy C:\Users\taljmars\.jenkins\workspace\DroneGCS\ClientInstallation\Windows\Console-*-win-x64.zip C:\Users\taljmars\.jenkins\workspace\DroneGCS\..\StandaloneDroneGCS\Windows64\Console-1.18-win-x64.zip

echo --------------- Linux --------------

git status
git add *
git commit -m "Building standalone package for Build-111"
git status