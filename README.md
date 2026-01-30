

# nix-direnv
Impede a coleta de lixo das dependências de compilação criando um link simbólico para a derivação do shell resultante no diretório do usuário gcroots(A vida é muito curta para perder o cache de compilação do seu projeto se você estiver em um voo sem conexão com a internet).
O `nix-direnv` impede o _garbage collection_ das dependências atualmente em uso. Para fazer a limpeza dos symlinks e limpar as dependências que não são mais necessárias basta excluir a pasta `.direnv/` da raíz do projeto e rodar a o garbage collector do `NixOS`.


# nix-ld
No NixOS é necessário que o nix-ld esteja habilitado para usar Python.
https://github.com/nix-community/nix-ld

```
{
  programs.nix-ld.enable = true;
  environment.sessionVariables = {
    LD_LIBRARY_PATH = "$NIX_LD_LIBRARY_PATH";
    PATH = "$HOME/.cargo/bin";
  };
}
```