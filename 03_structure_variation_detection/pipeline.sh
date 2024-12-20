# pipeline for structure variation detection
minimap2 -ax asm5 --eqx Zm-B73-REFERENCE-GRAMENE-4.0.chrab Mo17_CAU1_refseq.single_chraa >Mo17_CAU1_refseq.single_chraa.sam 
minimap2 -ax asm5 --eqx Zm-B73-REFERENCE-GRAMENE-4.0.chrac Mo17_CAU1_refseq.single_chrab >Mo17_CAU1_refseq.single_chrab.sam 
minimap2 -ax asm5 --eqx Zm-B73-REFERENCE-GRAMENE-4.0.chrad Mo17_CAU1_refseq.single_chrac >Mo17_CAU1_refseq.single_chrac.sam 
minimap2 -ax asm5 --eqx Zm-B73-REFERENCE-GRAMENE-4.0.chrae Mo17_CAU1_refseq.single_chrad >Mo17_CAU1_refseq.single_chrad.sam 
minimap2 -ax asm5 --eqx Zm-B73-REFERENCE-GRAMENE-4.0.chraf Mo17_CAU1_refseq.single_chrae >Mo17_CAU1_refseq.single_chrae.sam 
minimap2 -ax asm5 --eqx Zm-B73-REFERENCE-GRAMENE-4.0.chrag Mo17_CAU1_refseq.single_chraf >Mo17_CAU1_refseq.single_chraf.sam 
minimap2 -ax asm5 --eqx Zm-B73-REFERENCE-GRAMENE-4.0.chrah Mo17_CAU1_refseq.single_chrag >Mo17_CAU1_refseq.single_chrag.sam 
minimap2 -ax asm5 --eqx Zm-B73-REFERENCE-GRAMENE-4.0.chrai Mo17_CAU1_refseq.single_chrah >Mo17_CAU1_refseq.single_chrah.sam 
minimap2 -ax asm5 --eqx Zm-B73-REFERENCE-GRAMENE-4.0.chraj Mo17_CAU1_refseq.single_chrai >Mo17_CAU1_refseq.single_chrai.sam 
minimap2 -ax asm5 --eqx Zm-B73-REFERENCE-GRAMENE-4.0.chraa Mo17_CAU1_refseq.single_chraj >Mo17_CAU1_refseq.single_chraj.sam 


python3 syri -c Mo17_CAU1_refseq.single_chraa.sam -r Zm-B73-REFERENCE-GRAMENE-4.0.chrab -q Mo17_CAU1_refseq.single_chraa -k -F 
