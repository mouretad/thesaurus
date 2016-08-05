#!/bin/sh

echo "openMP version"
rm -r result_openMP.txt

for i in `seq 1 30`;
do
	echo "processing test $i"
	#execution du programme
	./build_profiles test_5go.txt.s.filter.t10.c10.tc2.u > test.2.profiles
  
	#renommage du fichier
	mv test.txt test$i.txt  

	#creation du fichier resultat
	touch result_openMP.txt

	# concaténation des résultats
	cat test$i.txt >> result_openMP.txt

	#suppression des anciens fichiers
 	rm test$i.txt

done
