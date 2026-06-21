# Helpix 

<p align="center" style="font-weight: bold">A Custom zsh plugin for beautifying help flags</p>

<img align="center" src="" alt="helpix banner" />

<br />

Get a pretty, colored, and easy-to-read help output when you type `-h` or `--help` for all zsh commands.

## How it works?

Simply, it intercepts those `-h` / `--help` flags in Zsh commands and pipes the output to **bat** for a colorful output.

Sounds amazing, let's give it a try! 🤩

## Prerequisites

- Zsh 
- [Bat](https://github.com/sharkdp/bat)

## Installation

### Manual

In your terminal, navigate to home directory and type:

```bash
git clone https://github.com/i17717/helpix.git
echo "source ~/helpix/helpix.plugin.zsh" >> ~/.zshrc
```

### Oh My Zsh

```bash
git clone https://github.com/i17717/helpix \
~/.oh-my-zsh/custom/plugins/helpix
```
You must then add `helpix` to your plugins array in `~/.zshrc`:

```bash
plugins(
	helpix
	...
	)
```
Restart your shell.

**To use it, just type any commands normally** 🔥

```bash
ls -h
git --help
```

## Customization

By default, Helpix uses `bat` as its viewer, but you can change it to something else, such as `less` or `more`.

```bash
HELPIX_VIEWER=less
```

Helpix is enabled by default, but you can disable it without removing it from your `plugins` array.

```bash
HELPIX_ENABLED=0
```
