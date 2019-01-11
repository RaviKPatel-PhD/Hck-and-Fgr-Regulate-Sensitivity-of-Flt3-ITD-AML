#!/bin/bash
#
#SBATCH --job-name=bwa_mem
#SBATCH -N 1
#SBATCH --cpus-per-task=8 # Request that ncpus be allocated per process.
#SBATCH -t 1-00:00 # Runtime in D-HH:MM


#
#
#
# Use samtools to sort by position and convert to bam
module load samtools/1.3.1-gcc5.2.0 #
samtools sort -@ 16 -o alignment_paired.bwa_mem.sorted.bam alignment_paired.bwa_mem.sam #
#
#
#
#load picard/2.11.0 and Identify read groups so that we can mark duplicates and recalibrate quality scores
##Note: Add as much info as possible or GATK will not work
module load picard/2.11.0 | java -jar /ihome/sam/apps/picard/picard-2.11.0/picard.jar AddOrReplaceReadGroups I=alignment_paired.bwa_mem.sorted.bam O=alignment_paired.bwa_mem.sorted_rg.bam  SORT_ORDER=coordinate RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=A #
#
#
#MarkDuplicates
module load picard/2.11.0 | java -jar /ihome/sam/apps/picard/picard-2.11.0/picard.jar MarkDuplicates I=alignment_paired.bwa_mem.sorted_rg.bam O=alignment_paired.bwa_mem.sorted_rg.dedup.bam METRICS_FILE=MDmetrics.txt CREATE_INDEX=TRUE #
#
#
#recalibrate quality scores
####### Need to test recalibrate base scores using the two following steps #######
#
#step 1
module load GATK/3.8.1 | java -jar /ihome/sam/apps/GATK/GenomeAnalysisTK-3.8.0/GenomeAnalysisTK.jar -T BaseRecalibrator -nct 4 -R /mnt/mobydisk/pan/genomics/refs/GATK_Resource_Bundle/b37/human_g1k_v37.fasta -knownSites /mnt/mobydisk/pan/genomics/refs/GATK_Resource_Bundle/b37/1000G_phase1.indels.b37.vcf -knownSites /mnt/mobydisk/pan/genomics/refs/GATK_Resource_Bundle/b37/Mills_and_1000G_gold_standard.indels.b37.vcf -knownSites /mnt/mobydisk/pan/genomics/refs/GATK_Resource_Bundle/b37/dbsnp_138.b37.vcf -I alignment_paired.bwa_mem.sorted_rg.dedup.bam -o recal_data.table #
#
#
#step 2
module load GATK/3.8.1 | java -jar /ihome/sam/apps/GATK/GenomeAnalysisTK-3.8.0/GenomeAnalysisTK.jar -T PrintReads -R /mnt/mobydisk/pan/genomics/refs/GATK_Resource_Bundle/b37/human_g1k_v37.fasta -BQSR recal_data.table -I alignment_paired.bwa_mem.sorted_rg.dedup.bam -o alignment_paired.bwa_mem.sorted_rg.dedup_indelrealigner_BQSR.bam #
#
#
#Variant Calling
echo "Calling variants with Haplotype caller. Final Step!" #
module load GATK/3.8.1 | java -jar /ihome/sam/apps/GATK/GenomeAnalysisTK-3.8.0/GenomeAnalysisTK.jar -R /mnt/mobydisk/pan/genomics/refs/GATK_Resource_Bundle/b37/human_g1k_v37.fasta -T HaplotypeCaller -I alignment_paired.bwa_mem.sorted_rg.dedup_indelrealigner_BQSR.bam --dbsnp /mnt/mobydisk/pan/genomics/refs/GATK_Resource_Bundle/b37/dbsnp_138.b37.vcf -stand_call_conf 30 -o Ravi_SNPs_for_sample.vcf # 
#
#
#
#Variant annotation
module load snpeff/4.3s | java -jar /ihome/sam/apps/snpeff/snpEff/snpEff.jar -v -c /ihome/sam/apps/snpeff/snpEff/snpEff.config GRCh37.75 Ravi_SNPs_for_sample.vcf > Ravi_SNPs_for_sample_annotated.vcf # 
#
#
#
##We had issues with space in the cluster so I deleted all the intermediate steps and just kept the raw data and final VCF
##Can always regenerate the intermediate steps if needed.
##Don't run this command if you want to keep intermediate steps.
find . -type f ! -name "Ravi*" -exec rm -rf {} \; #
#
echo "Script Complete!"
#
#
exit 0 #
