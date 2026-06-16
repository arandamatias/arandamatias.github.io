@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo Generando galeria de entrega...

set "CLIENTE=Ingresa el nombre del cliente"
set /p CLIENTE="Nombre del cliente (ej: Restaurante El Fogon): "

set "OUTPUT=index.html"

(
echo ^<!DOCTYPE html^>
echo ^<html lang="es"^>
echo ^<head^>
echo ^<meta charset="UTF-8"^>
echo ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
echo ^<title^>Entrega — %CLIENTE%^</title^>
echo ^<link rel="icon" type="image/png" href="../../favicon.png"^>
echo ^<link rel="stylesheet" href="../../css/style.css"^>
echo ^<style^>
echo .entrega-item{ position:relative; background:#141414; }
echo .entrega-item img{ width:100%%; aspect-ratio:1/1; object-fit:cover; display:block; transition: opacity .3s; }
echo .entrega-item img:hover{ opacity:0.85; }
echo .btn-dl{ width:100%%; background:none; border:none; border-top:1px solid var(--line^); color:var(--accent^); font-size:0.72rem; letter-spacing:0.15em; text-transform:uppercase; padding:0.7em 1em; cursor:pointer; font-family:'Inter', sans-serif; display:flex; align-items:center; justify-content:center; gap:0.5rem; transition: background .2s, color .2s; }
echo .btn-dl:hover{ background:var(--accent^); color:var(--paper^); }
echo .btn-dl-all{ display:inline-block; margin-top:1.8rem; border:1px solid var(--accent^); color:var(--accent^); padding:0.8em 2em; font-size:0.78rem; letter-spacing:0.2em; text-transform:uppercase; background:none; cursor:pointer; font-family:'Inter', sans-serif; transition: background .25s, color .25s; }
echo .btn-dl-all:hover{ background:var(--accent^); color:var(--paper^); }
echo ^</style^>
echo ^</head^>
echo ^<body^>
echo ^<header^>
echo ^<a href="../../index.html" class="logo"^>
echo ^<span class="name"^>Matías Aranda^</span^>
echo ^<span class="role"^>Visual Creator^</span^>
echo ^</a^>
echo ^</header^>
echo ^<section class="page-head"^>
echo ^<a href="../../index.html" class="breadcrumb"^>← Volver al portfolio^</a^>
echo ^<h1^>Entrega — ^<em^>%CLIENTE%^</em^>^</h1^>
echo ^<p^>Descargá las fotos que más te gusten. Cualquier consulta escribime a ^<a href="mailto:hola@arandamatias.com" style="color:var(--accent^);"^>hola@arandamatias.com^</a^>^</p^>
echo ^<button class="btn-dl-all" onclick="descargarTodo(^)"^>↓ Descargar todas^</button^>
echo ^</section^>
echo ^<section class="gallery"^>
echo ^<div class="thumb-grid reveal" id="grid"^>
) > "%OUTPUT%"

set COUNT=0
for %%f in (*.jpg *.jpeg *.JPG *.JPEG *.png *.PNG *.webp *.WEBP) do (
    set /a COUNT+=1
    echo ^<div class="entrega-item"^>>> "%OUTPUT%"
    echo ^<img src="%%f" alt="%%~nf"^>>> "%OUTPUT%"
    echo ^<button class="btn-dl" onclick="descargar('%%f'^)"^>↓ Descargar^</button^>>> "%OUTPUT%"
    echo ^</div^>>> "%OUTPUT%"
)

(
echo ^</div^>
echo ^</section^>
echo ^<footer^>
echo ^<div class="footer-cta"^>
echo ^<h2^>Empecemos ^<em^>algo.^</em^>^</h2^>
echo ^<p style="margin-top:1.2rem; font-size:0.95rem; color:var(--grey^);"^>Proyectos, colaboraciones y consultas.^</p^>
echo ^</div^>
echo ^<div class="footer-links"^>
echo ^<a href="mailto:hola@arandamatias.com"^>Escribime →^</a^>
echo ^<a href="https://instagram.com/arandamatias"^>Instagram →^</a^>
echo ^</div^>
echo ^<div class="footer-bottom"^>
echo ^<span^>© 2026 Matías Aranda — arandamatias.com^</span^>
echo ^<span^>Resistencia, Chaco, Argentina^</span^>
echo ^</div^>
echo ^</footer^>
echo ^<script src="../../js/main.js"^>^</script^>
echo ^<script^>
echo function descargar(nombre^) {
echo   var a = document.createElement('a'^);
echo   a.href = nombre;
echo   a.download = nombre;
echo   document.body.appendChild(a^);
echo   a.click(^);
echo   document.body.removeChild(a^);
echo }
echo function descargarTodo(^) {
echo   var imgs = document.querySelectorAll('.entrega-item img'^);
echo   imgs.forEach(function(img, i^) {
echo     setTimeout(function(^) {
echo       descargar(img.getAttribute('src'^)^);
echo     }, i * 400^);
echo   }^);
echo }
echo ^</script^>
echo ^</body^>
echo ^</html^>
) >> "%OUTPUT%"

echo.
echo Listo! Se generaron %COUNT% fotos en index.html
echo Ahora hace commit y push desde GitHub Desktop.
echo.
pause
