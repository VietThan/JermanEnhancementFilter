#!/bin/bash
#SBATCH --mail-user=viet.than@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00:15:00
#SBATCH --mem=16G
#SBATCH --output=home/thanv/mything.log
#SBATCH --error=home/thanv/error.log

matlab -nodisplay -nosplash -nodesktop -r "run('example_vesselness3D.m');exit;"
