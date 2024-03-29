# Bash Profile

This contains my ongoing bash profile that I use across multiple machines.

## Installation

1. Clone this repo
1. Symlink the desired files to replace the ones in your user directory. Replace the source directory with wherever you cloned the repo, or run the command from within this directory.

   ```bash
   ln -sb -t ~ $PWD/.bashrc
   ln -sb -t ~ $PWD/.bash_aliases
   ln -sb -t ~ $PWD/.direnvrc
   ```

    * Alternatively, using GNU Stow (from the parent directory) `stow --target=$HOME bash`

1. Restart the shell or run `source ~/.bashrc` to pick up the new profile
1. After ensuring everything is working properly, you may want to remove the backup files generated by the above command (if any were made). They may be at `~/.bashrc~`

## Packages

Some of these tools are from [this list](https://github.com/ibraheemdev/modern-unix)

### Bat (cat alternative)

```bash
sudo apt install bat
ln -s /usr/bin/batcat ~/.local/bin/bat
```

### fd (find alternative)

```bash
sudo apt install fd-find
ln -s $(which fdfind) ~/.local/bin/fd
```

### exa (ls alternative)

```bash
sudo apt install exa
```
