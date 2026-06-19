# Helpix

Get a pretty, colored, and easy-to-read help output when you type `-h` or `--help` for all commands in Zsh

## How it works?

Simply, it intercepts those `-h` / `--help` flags in Zsh commands and pipes the output to **bat** for a colorful output.

Sounds amazing, let's give it a try! 🤩

## Prerequisites
- Zsh
- [Bat](https://github.com/sharkdp/bat)

## Installation

In your terminal, navigate to home directory and paste this:

```bash
git clone https://github.com/i17717/helpix.git
echo "source ~/helpix/helpix.zsh" >> ~/.zshrc
```

To use it, just run commands normally 🔥

```bash
ls -h
git --help
```