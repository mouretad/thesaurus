#!/bin/sh

printf '%s\n%s\n' '1 : mono thread version' '2 : multi threads version'
read -${BASH_VERSION+e}r var

case "$var" in
"1")
	echo "mono thread version"
	rm -r result_mono.txt

	for i in `seq 1 30`;
	do
		echo "processing test $i"
		#execution du programme
    		./build_profiles test_5go.txt.s.filter.t10.c10.tc2.u > test.1.profiles
    
		#renommage du fichier
		mv test.txt test$i.txt  
	
		#creation du fichier resultat
		touch result_mono.txt

		# concaténation des résultats
		cat test$i.txt >> result_mono.txt
	
		#suppression des anciens fichiers
   	 	rm test$i.txt

	done
    ;;
"2")
	echo "multi-threaded version"
    	rm -r result_multi.txt

	for i in `seq 1 30`;
	do
		echo "processing test $i"
		#execution du programme
    		./build_profiles_multi test_5go.txt.s.filter.t10.c10.tc2.u > test.1.profiles
    
		#renommage du fichier
		mv test.txt test$i.txt

	
		#creation du fichier resultat
		touch result_multi.txt
		# concaténation des résultats
		cat test$i.txt >> result_multi.txt
	
		#suppression des anciens fichiers
   	 	rm test$i.txt
	
	done
    ;;
*)
    echo "error"
    ;;
esac
