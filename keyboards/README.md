### Sofle V2 keyboard
| Sofle | Info | Bongocat |
| - | - | - |
|![sofle](https://github.com/gustoliveira/dotfiles/assets/50436424/b0780738-2d6f-48bb-a6fd-177c7fed6153)|![info](https://github.com/gustoliveira/dotfiles/assets/50436424/84d41aab-4459-42b5-8c72-f0d99e222186)|![bongocat](https://github.com/gustoliveira/dotfiles/assets/50436424/c839c752-0ff4-410b-bcc2-fa89538ae100)|


### QMK
- [QMK Firmware Documentation](https://docs.qmk.fm/#/)
- [QMK Configurator](https://config.qmk.fm/#/sofle/rev1/LAYOUT)

#### Config
1. Install qmk firmware following the [documentation guide step](https://docs.qmk.fm/#/newbs_getting_started)

2. Set the default keyboard to `sofle/rev1`
```zsh
qmk config user.keyboard=sofle/rev1
```
3. Set the default keymap name like the github username `gustolivera`:

```zsh
qmk config user.keymap=gustolivera
```

The first two steps are important to use the qmk keymap file in this repository easily.

Make sure that `qmk config` is exactly like this:
```zsh
$ qmk config
find.keymap=default
mass_compile.keymap=default
user.keyboard=sofle/rev1
user.keymap=gustoliveira
```
3. Go to the keymaps directory in qmk_firmware directory and create a symlink to gustoliveira directory there:

```zsh
$ cd ~/qmk_firmware/keyboards/sofle/keymaps
$ ln -s /home/gustavo/projects/dotfiles/keyboards/gustoliveira gustoliveira
```
This will allow to make changes here reflect there.

4. After making changes in the keymap, compile and flash the new firmware into the keyboard:

```zsh
$ qmk compile
$ qmk flash
```
This will use the default configurations to compile and flash.

### Use qmk configurator

1. Go to qmk configurator site.
2. Upload a qmk keymap json file.
3. Make the desired changes and update the keymap version.
4. Download the new keymap.
5. In the directory with the new keymap use the following command to convert from JSON to C format:
```zsh
$ qmk json2c spk-003.json
```
Copy the return of the command above.

6. Paste they new keymap in `gustoliveira/keymap.c` file. Make sure to change the labels of each layer to show the current layer on the oled screen properly.
