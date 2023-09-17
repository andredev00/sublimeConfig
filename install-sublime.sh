#!/bin/bash

# Função para verificar o sucesso de uma etapa
check_success() {
    if [ $? -eq 0 ]; then
        echo "Sucesso: $1"
    else
        echo "Erro: $1"
        exit 1
    fi
}

# Instalar o Homebrew (package manager para macOS) caso não esteja instalado
if ! command -v brew &>/dev/null; then
    echo "A instalar o Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    check_success "Instalação do Homebrew"
fi

# Instalar o Sublime Text 4 pelo Homebrew
echo "A instalar o Sublime Text 4..."
brew install --cask sublime-text
check_success "Instalação do Sublime Text"

# Instalar o Sublime Merge pelo Homebrew
echo "A instalar o Sublime Merge..."
brew install --cask sublime-merge
check_success "Instalação do Sublime Merge"

# Espesra até que o Sublime Text e o Sublime Merge sejam instalados
sleep 10

# Verifica se o Package Control já existe para o Sublime Text, e se não existir, instale-o manualmente
if [ ! -f ~/Library/Application\ Support/Sublime\ Text/Installed\ Packages/Package\ Control.sublime-package ]; then
    echo "Instalando o Package Control manualmente para o Sublime Text..."
    mkdir -p ~/Library/Application\ Support/Sublime\ Text/Installed\ Packages/
    curl -o ~/Library/Application\ Support/Sublime\ Text/Installed\ Packages/Package\ Control.sublime-package https://packagecontrol.io/Package%20Control.sublime-package
    check_success "Instalação manual do Package Control para o Sublime Text"
fi

# Verifica se o Package Control já existe para o Sublime Merge, e se não existir, instale-o manualmente
if [ ! -f ~/Library/Application\ Support/Sublime\ Merge/Installed\ Packages/Package\ Control.sublime-package ]; then
    echo "Instalando o Package Control manualmente para o Sublime Merge..."
    mkdir -p ~/Library/Application\ Support/Sublime\ Merge/Installed\ Packages/
    curl -o ~/Library/Application\ Support/Sublime\ Merge/Installed\ Packages/Package\ Control.sublime-package https://packagecontrol.io/Package%20Control.sublime-package
    check_success "Instalação manual do Package Control para o Sublime Merge"
fi

# Instala o LSP (Language Server Protocol) usando o Package Control no Sublime Text
echo "Instalando o LSP (Language Server Protocol) no Sublime Text..."
echo "Isso pode demorar um pouco, aguarde..."
subl --command "install_package LSP"
check_success "Instalação do LSP (Language Server Protocol) no Sublime Text"

# Instala o plugin "Formatter" para a linguagem Java no Sublime Text (exemplo com Java-Completions)
echo "Instalando o plugin 'Formatter' para Java no Sublime Text..."
subl --command "install_package Java-Completions"
check_success "Instalação do plugin 'Formatter' para Java no Sublime Text"

# Instala o plugin "Formatter" para a linguagem JavaScript no Sublime Text (exemplo com JavaScript-Beautify)
echo "Instalando o plugin 'Formatter' para JavaScript no Sublime Text..."
subl --command "install_package JavaScript-Beautify"
check_success "Instalação do plugin 'Formatter' para JavaScript no Sublime Text"

# Abrir o Sublime Text
echo "Abrindo o Sublime Text..."
subl

# Abrir o Sublime Merge
echo "Abrindo o Sublime Merge..."
smerge

echo "Instalação concluída!"
