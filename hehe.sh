if [[ ${1} == "--install" || ${1} == "-i" ]];then
for i in colors.properties termux.properties font.ttf; do
        if [ -f "$HOME/.termux/$i" ];then
        cp $HOME/.termux/$i $HOME/.termux/${i}.bk
        fi
        done
        apt install wget
	mkdir -p ~/.termux
	touch $HOME/.termux/configure.bk
	for i in colors.properties termux.properties font.ttf; do
		wget -q https://github.com/mpb00121/termux/raw/main/style/$i -O ~/.termux/$i
	done
	#rm -r $PREFIX/etc/motd
	#echo "toilet -F metal -F border -f future termux black" >> $PREFIX/etc/bash.bashrc
	cp $PREFIX/etc/bash.bashrc $PREFIX/etc/bash.bashrc.bk
	sed -i s:PS1.*:"PS1=\'\\\\[\\\\e\[0\;31m\\\\]ROOT@PATCH_LOGGER~ \\\[\\\e[0;37m\\\\]\'": $PREFIX/etc/bash.bashrc
	am broadcast --user 0 -a com.termux.app.reload_style com.termux > /dev/null
        exit 0

elif [[ ${1} == "--uninstall" || ${1} == "-u" ]];then

if [ -f "$PREFIX/etc/bash.bashrc.bk" ];then
	mv $PREFIX/etc/bash.bashrc.bk $PREFIX/etc/bash.bashrc
fi

if [[ -f "$HOME/.termux/configure.bk" ]];then
	for i in colors.properties termux.properties font.ttf; do
        mv $HOME/.termux/${i}.bk $HOME/.termux/${i}
	done
	rm $HOME/.termux/configure.bk
	am broadcast --user 0 -a com.termux.app.reload_style com.termux > /dev/null
fi
	echo "[i] Theme Uninstalled Successfully."

        exit 0
fi
