# Nix Templates

A collection of Nix flake templates for quickly setting up development environments with direnv integration.

## Requirements

### nix-direnv
Enable [nix-direnv](https://github.com/nix-community/nix-direnv) in your NixOS configuration:
```nix
{
  programs.direnv.enable = true;
}
```

### nix-ld
On NixOS, [nix-ld](https://github.com/nix-community/nix-ld) needs to be enabled to use the Python layout with uv.

```nix
{
  programs.nix-ld.enable = true;
  environment.sessionVariables = {
    LD_LIBRARY_PATH = "$NIX_LD_LIBRARY_PATH";
  };
}
```

## Usage

### Initialize a new project
```bash
# Create and enter your project directory
mkdir my-project
cd my-project

# Initialize with Python template
nix flake init -t github:hericksilva9/nix-templates#python

# Allow direnv
direnv allow
```

### Available templates

- `python` - Python development environment with direnv and uv

### List all templates
```bash
nix flake show github:hericksilva9/nix-templates
```

### nix-direnv
nix-direnv prevents garbage collection of dependencies currently in use. 
- You can reload your environment with:
```bash
nix-direnv-reload
```

- To clean up symlinks and remove dependencies that are no longer needed, simply delete the `.direnv/` folder from the project root and run the NixOS garbage collector.


## License

This project is licensed under the MIT License.