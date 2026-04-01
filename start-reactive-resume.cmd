@echo off
cd /d "C:\Users\Satrio Faiz\Downloads\github-repos\reactive-resume"

if not exist ".env" (
  copy /Y ".env.example" ".env" >nul
)

where docker >nul 2>nul
if %errorlevel%==0 (
  echo Starting required services...
  docker compose -f compose.dev.yml up -d postgres browserless seaweedfs seaweedfs_create_bucket
)

call ".\node_modules\.bin\vp.cmd" dev
