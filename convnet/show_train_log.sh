for i in 1 2 3 4 5 6
do
  echo ''
  echo "NETWORK GPU $i"
  var="rslt/overfat_lr$i/train.log"
  cat $var
done

plist=$(pidof -o 30688 luajit)
for i in $plist
do
    echo $i
    kill -9 $i
done



for d in */ ; do
    echo '' >> rslt_13h_29aout.log
    echo "NETWORK $d" >> rslt_13h_29aout.log
    var="${d}train.log"
    cat $var >> rslt_13h_29aout.log
done