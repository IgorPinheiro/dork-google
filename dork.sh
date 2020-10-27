#!/bin/bash

#To execute this script is necessary to install the browser --> lynxy


if [ "$1" == "" ]
then
	echo "    DORK GOOGLE"
	echo "Criado por: Igor Pinheiro"
	echo "    Data: 09-06-20"
	echo ""
	echo "[+] MODO DE USAR [+]"
	echo "[+] way of doing [+]"
	echo "./dork.sh site.target.com pdf/txt/doc escolha uma extensão"
	echo "./dork.sh site.target.com pdf/txt or doc  choose an option of the extension"
else

echo "Executando Busca..."
sleep 2
echo "searching file .$2!"
echo ""

lynx --dump "https://google.com/search?&q=site:$1+ext:$2" | grep ."$2" | cut -d "=" -f2 | egrep -v "site|google" | sed "s/...$//" > temp

echo "[+] PREPARANDO PARA BAIXAR ARQUIVOS ENCONTRADOS [+]"
echo "[+] PREPARING TO DOWNLOAD FOUND FILES [+]"
sleep 2

for ext in $(cat temp);
do
	
	echo "Downloading file [$ext]"
	wget -q $ext
done
echo " "
echo " "
echo "*** >>>DOWNLOAD FINALIZADO<<< ***"
echo "*** >>> DOWNLOAD FINISHED <<< ***"
echo " "
echo "bye"
rm temp
fi
