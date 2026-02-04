#!/bin/bash

app="$1"
gestor=""

# Detectar gestor disponible
if apt-cache show "$app" >/dev/null 2>&1; then
    gestor="apt"
    
elif flatpak search "$app" | grep -q "$app"; then
    gestor="flatpak"
    
elif snap info "$app" >/dev/null 2>&1; then
    gestor="snap"
    
else
    echo "No se pudo encontrar '$app' en APT, Flatpak ni Snap."
    exit 1
fi

# Instalar con el gestor detectado
echo "Instalando '$app' usando $gestor..."
case "$gestor" in
    apt)
        sudo apt-get install -y "$app"
        ;;
        
    flatpak)
        flatpak install -y "$app"
        ;;
        
    snap)
        sudo snap install "$app"
        ;;
esac
