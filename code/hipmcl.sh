lastdb -P 20 -p -c ./tot.fasta_db ./tot.fasta 
lastal -f BlastTab -P 20 tot.fasta_db tot.fasta  >  tot.fasta.maf
filter_blast -i tot.fasta.maf -o tot.fasta.maf.f2 --identity 95 --qfile $1.len --qper 75 --tops 1 
awk '$1!=$2' tot.fasta.maf.f2  > tot.fasta.maf.f3
mpirun -np 10 hipmcl -M tot.fasta.maf.f3 -I 2 -per-process-mem 200 -o tot.fasta.maf.f4
