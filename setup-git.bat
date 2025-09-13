@echo off
echo Setting up Git repository for HIT DevOps Project...

REM Initialize Git repository
git init

REM Add all files
git add .

REM Create initial commit
git commit -m "Initial commit: HIT DevOps Project - User Management System"

echo.
echo Git repository initialized successfully!
echo.
echo Next steps:
echo 1. Create a new repository on GitHub
echo 2. Add the remote origin: git remote add origin YOUR_GITHUB_URL
echo 3. Push to GitHub: git push -u origin main
echo.
echo Example GitHub URL: https://github.com/yourusername/hit-devops-project.git
pause
