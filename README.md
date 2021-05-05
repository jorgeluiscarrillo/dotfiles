# dotfiles

## Management

My dotfiles are managed with [GNU stow](https://www.gnu.org/software/stow/). This allows me to
maintain a versioned directory of all my configuration files.

## Usage

Clone this repository at `$HOME`:

```bash
git clone https://github.com/jorgeluiscarrillo/dotfiles && cd dotfiles/
```

Use your package manager to install stow. It is available in most distributions:

```bash
dnf install stow
```

Create a backup of your existing dotfiles, remove them in `$HOME` and install the new ones using:

```bash
make stow
```

To remove dotfiles:

```bash
make delete
```

