{ pkgs, ... }:

{
  home.packages = with pkgs; [
    clang-tools
    nixd
    nodejs_24
    glsl_analyzer
    opencode
    (pkgs.python3.withPackages (ps: with ps; [
      python-lsp-server
      pylsp-mypy
      python-lsp-ruff
      pycodestyle
    ]))
  ];

  programs.neovim.initLua= ''
    vim.lsp.enable('clangd')
    vim.lsp.config('clangd', {
      capabilities = capabilities
    })

    vim.lsp.enable('nixd')
    vim.lsp.config('nixd', {
      capabilities = capabilities
    })

    vim.lsp.enable('glsl_analyzer')
    vim.lsp.config('glsl_analyzer', {
      capabilities = capabilities
    })

    vim.lsp.enable('pylsp')
    vim.lsp.config('pylsp', {
      capabilities = capabilities
    })
    
    vim.lsp.enable('rust_analyzer')
    vim.lsp.config('rust_analyzer', {
    	capabilities = capabilities,
    	settings = {
        ["rust-analyzer"] = {
          cargo = {
            features = "all"
          },
        },
      },
    })

    vim.diagnostic.config({
      virtual_lines = {
        current_line = true
      }
    })
  '';

}
