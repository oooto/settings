# Ubuntuの設定
# 1.パッケージリストの更新
# 1-1.デフォルトのリポジトリをアメリカから日本に変更する。
cd /etc/apt
sudo sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://jp.archive.ubuntu.com/ubuntu/%g" sources.list
# 1-2.最新情報の取得
sudo apt update
# 1-3.パッケージの更新
sudo apt upgrade

# 2.デスクトップ環境設定
# 2-1.UbuntuでのGUI設定
sudo apt install x11-apps x11-utils x11-xserver-utils dbus-x11
cd
echo 'export DISPLAY=localhost:0.0' >> ~/.bash_profile
source ~/.bash_profile
# 2-2.GUI用の日本語フォントをインストール
sudo apt install fonts-ipafont
# 2-3.デスクトップをインストール(xfce)
sudo apt install xfce4-terminal
sudo apt install xfce4-session
sudo apt install xfce4
export DISPLAY=:0.0
export LIBGL_ALWAYS_INDIRECT=1

# 3.日本語化設定
# 3-1.日本語化パッケージインストール
sudo apt install language-pack-ja
# 3-2.日本語設定を変更する
sudo update-locale LANG=ja_JP.UTF-8
