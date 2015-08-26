for i in 1 2 3 4 5 6
do
  echo ''
  echo "NETWORK GPU $i"
  var="overfat_lr$i/train.log"
  cat $var
done