#!/bin/bash -l
base_job_name="june16_cavia_cifar_hyperparam"
job_file="job_cifar.sh"
expnm="Cavia_For_Cifar"
for batch in 8 4 2 16
do
for context in 100 50 150 200 250
do
for filter in 128 64 32 256 512
do
  	job_name=$base_job_name$((batch))b$((context))c$((filter))
        out_file=$base_job_name$((batch))b$((context))c$((filter)).out
        error_file=$base_job_name$((batch))b$((context))c$((filter)).err
        export out_file
        export error_file
        export batch
        export context
        export filter
        sbatch -J $job_name -o $out_file -t 00-10:00:00 -p tier3 -e $error_file $job_file

done
done
done
