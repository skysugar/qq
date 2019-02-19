FROM base/archlinux

RUN echo '[multilib]' >> /etc/pacman.conf \
    && echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf \
    && echo '[archlinuxcn]' >> /etc/pacman.conf \
    && echo 'Server = https://cdn.repo.archlinuxcn.org/$arch' >> /etc/pacman.conf \
    && echo 'Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist \
    && echo 'zh_CN.UTF-8 UTF-8' > /etc/locale.gen \
    && echo 'export LC_CTYPE=zh_CN.UTF-8' >> .xprofile \
    && echo 'export LANG=zh_CN.utf-8' >> .xprofile \
    && echo 'export INPUT_METHOD=fcitx' >> .xprofile \
    && echo 'export XMODIFIERS=@im=fcitx' >> .xprofile \
    && echo 'export GTK_IM_MODULE=fcitx' >> .xprofile \
    && echo 'export QT_IM_MODULE=fcitx' >> .xprofile \
    && locale-gen \
    && rm -rf /etc/localtime \
    && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && pacman -Syu --noconfirm && pacman -S archlinuxcn-keyring --noconfirm \
    && pacman -S --noconfirm libjpeg-turbo ttf-dejavu wqy-zenhei wqy-microhei fcitx-googlepinyin alsa-utils deepin.com.qq.im \
    && rm -rf /var/cache/pacman/pkg/*

COPY start.sh .

CMD ["bash", "./start.sh"]
