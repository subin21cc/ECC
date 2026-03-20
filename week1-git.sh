#!/bin/bash

# ==========================================
# Do It Git 실습 자동화 스크립트 (Chap 1 ~ Chap 4)
# ==========================================

echo "🚀 실습 환경(폴더)을 준비합니다..."
# 기존 실습 폴더가 있다면 삭제하고 새로 시작 (초기화 목적)
rm -rf git_practice remote_repo.git
mkdir git_practice
cd git_practice

echo -e "\n=========================================="
echo "🎯 [Chap 1] Git 초기 설정 (config)"
echo "=========================================="
# 본인의 깃허브 이름과 이메일로 변경하여 사용하세요.
git config --local user.name "subin21cc"
git config --local user.email "subin21cc@gmail.com"
git config --local init.defaultBranch main
echo "✅ 사용자 이름 및 이메일 설정이 완료되었습니다."


echo -e "\n=========================================="
echo "🎯 [Chap 2] Git 시작 및 기본 (init, add, commit)"
echo "=========================================="
git init
echo "✅ Git 저장소가 초기화되었습니다."

echo "Hello, Git!" > hello.txt
git status
git add hello.txt
echo "✅ hello.txt 파일을 스테이지에 올렸습니다."

git commit -m "docs: 첫 번째 커밋 - hello.txt 생성"
echo "✅ 첫 번째 커밋 완료."

echo "Learning Git is fun." >> hello.txt
git add hello.txt
git commit -m "docs: 두 번째 커밋 - hello.txt 내용 추가"
echo "✅ 두 번째 커밋 완료. 현재 로그를 확인합니다:"
git log --oneline


echo -e "\n=========================================="
echo "🎯 [Chap 3] 브랜치 생성 및 병합 (branch, switch, merge)"
echo "=========================================="
git branch feature-login
echo "✅ 'feature-login' 브랜치를 생성했습니다."

git switch feature-login
echo "✅ 'feature-login' 브랜치로 이동했습니다."

echo "Login function created." > login.txt
git add login.txt
git commit -m "feat: 로그인 기능 추가"
echo "✅ 브랜치에서 새로운 커밋을 작성했습니다."

git switch main
echo "✅ 다시 'main' 브랜치로 돌아왔습니다."

git merge feature-login
echo "✅ 'feature-login' 브랜치의 내용을 'main'에 병합했습니다."
echo "✅ 현재 브랜치 구조와 로그:"
git log --oneline --graph --all


echo -e "\n=========================================="
echo "🎯 [Chap 4] 원격 저장소 연동 및 푸시 (remote, push)"
echo "=========================================="
# 실습 코드가 실제로 작동하게 만들기 위해, 상위 폴더에 원격 저장소 역할을 할 폴더를 생성합니다.
cd ..
mkdir remote_repo.git
cd remote_repo.git
git init --bare
echo "✅ 원격 저장소 역할을 할 Bare Repository를 생성했습니다."

cd ../git_practice
git remote add origin ../remote_repo.git
echo "✅ 로컬 저장소에 원격 저장소(origin)를 연결했습니다."
git remote -v

git push -u origin main
echo "✅ 원격 저장소로 코드를 성공적으로 Push 했습니다!"

echo -e "\n🎉 모든 실습(Chap 1 ~ Chap 4)이 성공적으로 완료되었습니다!"
