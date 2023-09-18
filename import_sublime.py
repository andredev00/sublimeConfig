import subprocess
import os
import time

# Função para verificar o sucesso de uma etapa
def check_success(return_code, message):
    if return_code == 0:
        print(f"Sucesso: {message}")
    else:
        print(f"Erro: {message}")
        exit(1)

# Instalação do Sublime Text e Sublime Merge (ajuste os caminhos conforme sua instalação)
sublime_text_installer = r'C:\Caminho\Para\Sublime Text Installer.exe'
sublime_merge_installer = r'C:\Caminho\Para\Sublime Merge Installer.exe'

print("Instalando o Sublime Text...")
subprocess.run([sublime_text_installer], shell=True)
check_success(0, "Instalação do Sublime Text")

print("Instalando o Sublime Merge...")
subprocess.run([sublime_merge_installer], shell=True)
check_success(0, "Instalação do Sublime Merge")

# Espere até que o Sublime Text e o Sublime Merge sejam instalados
time.sleep(10)

# Instale o Package Control no Sublime Text (ajuste o caminho conforme sua instalação)
sublime_text_executable = r'C:\Caminho\Para\Sublime Text\sublime_text.exe'

print("Instalando o Package Control para o Sublime Text...")
subprocess.run([sublime_text_executable, '--command', 'install_package_control'], shell=True)
check_success(0, "Instalação do Package Control para o Sublime Text")

# Instale o LSP (Language Server Protocol) no Sublime Text usando o Package Control
print("Instalando o LSP (Language Server Protocol) no Sublime Text...")
subprocess.run([sublime_text_executable, '--command', 'install_package', 'LSP'], shell=True)
check_success(0, "Instalação do LSP (Language Server Protocol) no Sublime Text")

# Instale outros pacotes ou plugins aqui usando comandos semelhantes

print("Instalação concluída!")
