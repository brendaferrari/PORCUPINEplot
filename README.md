🔴❗UNDER DEVELOPMENT❗🔴

# Porcupine plot generation automation (PORCUPINEplot)

<img align="left" width="300" src="images\porcupine.png">

PORCUPINEplot is a script developed to automate the generation of porcupine plots of PCA analysis.
<br><br>
To use this program, first you need to calculate the Principal Components (PCs) of the protein trajectory. Feel free to check and use the PCA program I also developed over [here](https://github.com/brendaferrari/PCAauto).
<br><br>
To create a Porcupine plot, you are going to need the protein structure (pdb file) and the PC trajectory file (dcd file). You may also use other extensions for structure (gro) and trajectory (xtc) but you are going to need to change ln 13 of [porcupineGenerator.sh](porcupineGenerator.sh) to:

```
if ls -l *.{gro,xtc};
```
<br><br>

---
## Instalation

Download the code and unzip it on the desirable directory. To prepare the environment use the following command:

```
conda env create -f environment.yml
``` 

Be aware to uncomment the sections on the environment.yml file depending on which OS you are using.

---
## How to use

Activate the environment using:

```
conda activate porcupineplot
```

The program uses a shell script to automate the calculation of data in multiple folders. To use this feature go to the root directory and on the terminal use:

```
bash \porcupineGenerator.sh
```

If you are interested only on running one folder, you may just add your files to the porcupineGenerator directory and use:

```
pymol script.pml
```

Before running the program, be aware to do some edits to the [script.pml](porcupineGenerator\script.pml) file:

```
#---------------START-------------------------------------------------
##### Change this filename to the name of your archive #####
load pc0.pdb
load_traj pc0.dcd
run modevectors.py
##### Change the 10001 to the number of frames the traectory has #####
split_states pc0, 1, 10001
##### Change the name 'pc0_0001' to the name of your filename #####
##### Here you can also format the porcupine plot #####
modevectors pc0_0001, pc0_10001, cutoff=.0, head_length=2, head=0.4, headrgb=(1,.2,.1) ,tailrgb=(1,.2,.1) ,notail=0
set cartoon_trace,1
set cartoon_tube_radius, 0.3
cmd.disable('all')
cmd.enable('pc0_0001',1)
cmd.enable('modevectors',1)
set ray_shadow,0
##### Change the name of the session file #####
##### After that, you may save as PNG #####
save PCA_porcupine_pc0.pse,format=pse
#----------END------------------------------------------------
```

---
## Observations

* This script was developed following the 
SK D tutorial on youtube, the PML file was developed based on its PML file. The tutorial and files can be found [here](https://www.youtube.com/watch?v=4ORfXubNhJo&ab_channel=SKD).

* The file [modvectors.py](porcupineGenerator\modevectors.py) was developed by [Sean M. Law](https://pymolwiki.org/index.php/User:Slaw) and its description can be found [here](porcupineGenerator\modevectors.py)

---
## Authorship

* Author: **Brenda Ferrari** ([brendaferrari](https://github.com/brendaferrari))

Social preview original photo by **Brenda Ferrari** ([brendaferrari](https://github.com/brendaferrari))
