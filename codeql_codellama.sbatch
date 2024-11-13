#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --gres=gpu:h100:2
#SBATCH --mem=200GB
#SBATCH --cpus-per-task=4

#SBATCH --time=1-23:59:59
#SBATCH --output=var/logs/%A/%a.out
#SBATCH --error=var/logs/%A/%a.err
#SBATCH --account=pr_177_general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=junyao.chen@nyu.edu

# --job-name comes from the run_batch wrapper script
nvidia-smi
export PATH="/scratch/jc9723/miniconda3/bin:$PATH"
conda init
eval "$(/scratch/jc9723/miniconda3/bin/conda shell.bash hook)"
source activate codeql
cd /scratch/jc9723/codeql
pwd

model=codellama-7b
python sec_eval.py --output_name $model --model_name $model --eval_type trained-new
