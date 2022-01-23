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
