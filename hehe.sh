for i in colors.properties termux.properties font.ttf; do
        if [ -f "$HOME/.termux/$i" ];then
        cp $HOME/.termux/$i $HOME/.termux/${i}.bk
        fi
        done
        apt install wget
	mkdir -p ~/.termux
	touch $HOME/.termux/configure.bk
	for i in colors.properties termux.properties font.ttf; do
		wget -q https://github.com/Hax4us/TermuxBlack/raw/master/style/$i -O ~/.termux/$i
	done
	#rm -r $PREFIX/etc/motd
	#echo "toilet -F metal -F border -f future termux black" >> $PREFIX/etc/bash.bashrc
	cp $PREFIX/etc/bash.bashrc $PREFIX/etc/bash.bashrc.bk
	sed -i s:PS1.*:"PS1=\'\\\\[\\\\e\[1\;34m\\\\]PATCHLOGGER ~ \\\[\\\e[0;37m\\\\]\'": $PREFIX/etc/bash.bashrc
	am broadcast --user 0 -a com.termux.app.reload_style com.termux > /dev/null
