{
  pkgs,
  lib,
}:
let
  lsp_internal =
    name: bin:
    let
      pkg = pkgs.${name};
    in
    {
      ${name} = {
        command = "${pkg}/bin/${bin}";
        args = [ "--stdio" ];
      };
    };
  lsp_pkg =
    name:
    (lsp_internal name name)
    // {
      __functor = self: bin: lsp_internal name bin;
    };
in
{
  lsp = (
    lib.removeAttrs (
      {
        rust-analyzer = {
          binary.path_lookup = true;
          initialization_options = {
            cachePriming = false;
            check.features = "all";
            cargo = {
              features = "all";
              allTargets = false;
              buildScripts = true;
            };
            diagnostics = {
              experimental = true;
            };
            imports = {
              prefix = "self";
              granularity = {
                group = "module";
              };
            };
          };
        };
      }
      // (lsp_pkg "nixd")
      // (lsp_pkg "vscode-langservers-extracted" "vscode-json-language-server")
      // (lsp_pkg "vscode-langservers-extracted" "vscode-markdown-language-server")
    ) [ "__functor" ]
  );
}
