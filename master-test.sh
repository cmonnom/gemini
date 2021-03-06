check()
{
	if diff $1 $2; then
    	echo ok
	else
    	echo fail
	fi
}
export -f check

cd test

# setup the testing databases from the testing VCF files
bash data-setup.sh

# Test basic functionality
bash test-columns.sh

# Test loading functionality
bash test-load.sh

# Test genotype BLOB functionality
bash test-genotypes.sh

# Test ClinVar attributes
bash test-clinvar.sh

# Test population_gen metrics
bash test-pop.sh

# Test mappability
bash test-map.sh

# Test genome annotations
bash test-genome.sh

# Test encode annotations
bash test-encode.sh

# Test EFF string derived elements in INFO column
bash test-effstring.sh

# Test loading functionality
bash test-annotate-tool.sh

# Test pathway tool
bash test-pathtool.sh

# Test interaction tool
bash test-interactions.sh

# Test query tool
bash test-query.sh

# Test stats tool
bash test-stats.sh

# Test windower
bash test-windower.sh

# Test gemini region
bash test-region.sh

# Test pfam domains
bash test-pfam.sh

# Test GERP scores
bash test-gerp.sh

# cleanup
rm ./*.db
rm ./file.dot

