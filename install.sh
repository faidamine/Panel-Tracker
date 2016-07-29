#!/bin/bash
echo "[ ]====================================================================[ ]";
echo "[ ]                         Ptrack  Tool                               [ ]";
echo "[ ]                  Ptrack Tool Install Script                        [ ]";
echo "[ ]====================================================================[ ]";
echo "";
echo "[!] Install.sh will install ptrack tool in the system [Y/n]" ; 
read baba
if [ $baba == "y" ] ; 
  then
    echo " "
  else
    exit
fi

echo "[!] Where Do you want to install the tool? [Ex:/usr/share/doc]:";
read refdir
echo "[!] Checking directories..."
if [ -d "$refdir/Panel-Tracker" ] ;
then
echo "[!] A directory Panel-Tracker was found! Do you want to replace it? [Y/n]:" ; 
read mama
if [ $mama == "y" ] ; 
then
 rm -R "$refdir/Panel-Tracker"
else
 exit
fi
fi

 echo "[!] Installing ...";
 echo "";
 git clone https://github.com/Desiprox/Panel-Tracker.git $refdir/Panel-Tracker;
 echo "#!/bin/bash 
 perl $refdir/Panel-Tracker/ptrack.py" '${1+"$@"}' > ptrack;
 chmod +x ptrack;
 sudo cp ptrack /usr/bin/;
 rm ptrack;


if [ -d "$refdir/Panel-Tracker" ] ;
then
echo "";
echo "Tool istalled with success!";
echo "";
  echo "[ ]====================================================================[ ]";
  echo "[ ]     All is done!! You can execute Ptrack by typing ptrack !        [ ]"; 
  echo "[ ]====================================================================[ ]";
  echo "";
else
  echo "[!] Installation faid!! ";
  exit
fi
