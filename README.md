# Breakout in Assembly
 A version of Breakout created using MIPS Assembly. Within the release is the Mars MIPS Simulator, downloaded from [Missouri State University](https://courses.missouristate.edu/kenvollmar/mars/). The game can be played by running download the .asm file and running it with Mars.

## Description
 [Atari Breakout](https://en.wikipedia.org/wiki/Breakout_(video_game)) is a game published by Atari in 1976, where the player controls a paddle and bounces a ball several times to break bricks located near the top of the screen. Over the years, it has also gone by a variety of other names, such as Brick-Breaker or Arkanoid. 
 This is a version of a Breakout like game created entirely in Assembly. To play the game, download the latest release and follow the instructions below.
<img src="https://raw.githubusercontent.com/Dismany0/misc_images/main/ezgif.com-crop.gif" height="500"/>

 ## How to Play
Download the latest release containing both the Mars Simulator and the .asm file. Open the .asm file using Mars. Upon opening it, run the game by opening both the **Bitmap Display** and the **Keyboard and Display MMIO Simulator**, both found under **Tools** in Mars. Change the following settings within the Bitmap Display as follows below.

**Unit width in pixels:       4**

**Unit height in pixels:      4**

**Display width in pixels:    512**

**Display height in pixels:   512**

**Base Address for Display:   0x10008000 ($gp)**


Make sure you press **Connect to MIPS** for both the input and bitmap display.
Finally, press the start button in Mars. The game should display on the bitmap display. Inputting controls into the Keyboard Simulator will control the game.

The controls are as follows
 | Key      | Control |
| ----------- | ----------- |
| A      | Move Left       |
| D   | Move Right        |
| S   | Start Game        |
| P   | Pause        |
| Q   | Quit        |
| R      | Restart   |

For additional details, follow the comments found on the top of the .asm file.
