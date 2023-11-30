#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=etc.ntminer.vip:26666
WALLET=0xE0DF5702833dBe9FE7838D0290a7650931519d17.lolMinerWorker

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./lolMiner --algo ETCHASH --pool $POOL --user $WALLET $@
