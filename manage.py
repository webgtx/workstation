#!/bin/python3
from prompt_toolkit import prompt, HTML
from prompt_toolkit import print_formatted_text as print
from prompt_toolkit.styles import Style
from prompt_toolkit.shortcuts import message_dialog, input_dialog, radiolist_dialog
from shutil import copytree, copy
from pathlib import Path
import yaml

theme = Style.from_dict({
    "dialog": "bg:#282c34",
})

with open("whitelist.yaml", "r") as f:
    whitelist = yaml.safe_load(f)

# https://stackoverflow.com/questions/78430874/copying-files-and-directories-using-a-single-method-from-shutil-copytree-is-not
def copyall(src: str, dst: str):
    """Copy all files or/and directories from one directory inside of another directory"""
    if Path(src).is_dir() and Path(dst).is_dir():
        for file_path in Path(src).iterdir():
            if file_path.is_dir():
                copytree(file_path, Path(dst) / file_path.name)
            else:
                copy(file_path, Path(dst) / file_path.name)

task = radiolist_dialog(
    title="Workspace Manager",
    text="Select dotfiles",
    style=theme,
    values=[
        ("import_dotfiles", "Import dotfiles"),
        ("install_dotfiles", "Install dotfiles"),
        ("install_rcfiles", "Install rcfiles"),
    ]
).run()

match task:
    case "import_dotfiles":
        for software in whitelist["dotfiles"]:
            copyall(Path.home() / ".config" / software, Path("configs") / software)
            print(f"import {software} to the repository")

    case "install_dotfiles":
        copyall("./configs", Path.home() / ".config")

    case "install_rcfiles":
        for rcfile in Path("./rcs").iterdir():
            copy(rcfile, Path.home() / f".{rcfile}")
    case _:
        exit(0)
