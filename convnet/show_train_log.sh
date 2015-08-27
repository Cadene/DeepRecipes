for i in 1 2 3 4 5 6
do
  echo ''
  echo "NETWORK GPU $i"
  var="rslt/overfat_lr$i/train.log"
  cat $var
done

for i in 20439 20399 20363 20318 20278 20242 20021
do
    kill -9 $i
done


