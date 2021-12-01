fsdfsiiiiii# PIAI_B3
Repository for PIAI B3

https://backlog.com/git-tutorial/kr/intro/intro2_2.html

###깃허브에 가입해주시고 유저네임 기억해주세요
### 깃허브에 본인 레포지토리 하나 만들어주세요~

sudo apt-get update 

sudo apt install git

git –version

mkdir testgit

cd testgit

git init

# 이제 여기에 텍스트 파일 만들어주세요 아무거나~

git config --global user.name “유저네임”

git config –global user.email “email”

git config –list

git add .
 
git commit -m “commit msg”

git status

git log

git remote add origin 깃허브주소

git push origin <branch name>

# 로그인 정보 요구함

git config credential.helper store
git push origin <branch name>

# git 받아오기(clone)

git clone https://github.com/accident960/PIAI_B3

수정후 

git add .
 
git commit -m “commit msg”

git push origin <branch name>

# branch 추가하고 변경

git branch <name>

ls -all

git checkout <name>


