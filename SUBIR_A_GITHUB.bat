@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
cd /d "%~dp0"
title Subir el museo del comic a GitHub

echo.
echo   ============================================================
echo    SUBIR EL MUSEO DEL COMIC A GITHUB
echo    repositorio: https://github.com/Senki16/museo-comic-sebastian
echo   ============================================================
echo.

rem Busca git en el PATH y, si no esta, en las rutas de instalacion habituales
set "GIT=git"
where git >nul 2>nul
if errorlevel 1 (
  if exist "%ProgramFiles%\Git\cmd\git.exe" (
    set "GIT=%ProgramFiles%\Git\cmd\git.exe"
    echo   ^(Git no esta en el PATH; se usa la instalacion de Program Files^)
  ) else if exist "%ProgramFiles(x86)%\Git\cmd\git.exe" (
    set "GIT=%ProgramFiles(x86)%\Git\cmd\git.exe"
  ) else if exist "%LOCALAPPDATA%\Programs\Git\cmd\git.exe" (
    set "GIT=%LOCALAPPDATA%\Programs\Git\cmd\git.exe"
  ) else (
    echo   [X] No se encontro Git en este computador.
    echo       Instalalo desde https://git-scm.com/download/win
    echo.
    pause
    exit /b
  )
)

if not exist ".git" (
  echo   ^> Preparando el repositorio local sobre lo que ya hay en GitHub...
  "%GIT%" init
  "%GIT%" remote add origin https://github.com/Senki16/museo-comic-sebastian.git
  "%GIT%" fetch origin main
  "%GIT%" checkout -B main
  rem Toma la historia del repositorio como base, conservando los archivos de esta carpeta
  "%GIT%" reset --soft origin/main
)

set "GMAIL="
for /f "delims=" %%i in ('"%GIT%" config user.email 2^>nul') do set "GMAIL=%%i"
if "!GMAIL!"=="" (
  set /p GMAIL=  Tu correo de GitHub: 
  "%GIT%" config --local user.email "!GMAIL!"
)
set "GNAME="
for /f "delims=" %%i in ('"%GIT%" config user.name 2^>nul') do set "GNAME=%%i"
if "!GNAME!"=="" (
  set /p GNAME=  Tu usuario de GitHub: 
  "%GIT%" config --local user.name "!GNAME!"
)

echo.
echo   ^> Registrando los cambios...
"%GIT%" add -A
"%GIT%" commit -m "Narracion por vineta, paleta Pascual Bravo y portada del proceso perceptivo"

echo.
echo   ^> Subiendo (puede pedirte iniciar sesion en GitHub)...
"%GIT%" push -u origin main

echo.
if errorlevel 1 (
  echo   [X] El push no se completo. Revisa el mensaje de arriba.
) else (
  echo   [OK] Listo. Vercel redespliega solo en menos de un minuto.
)
echo.
pause
