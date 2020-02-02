# WSLの導入と初期設定方法

WSLを導入して、初期設定するときの自分用メモを残しておく。

## Ubuntuのインストール
### Windowsの機能の有効化
1. タスクバーの検索を使って"コントロールパネル"を開く
2. プログラム > Windowsの機能の有効化または無効化
3. "Windows Subsystem for Linux"にチェックを入れる
4. Windowsを再起動する
### Ubuntuのインストール
1. タスクバーの検索を使って"Microsoft Store"を開く
2. Microsoft Store画面の上側の検索で"Ubuntu"を検索する
3. "Ubuntu x.x LTS"を入手する
    - LTS:Long Term Supportの略で、サポート期間が最低でも5年で通常よりも長い。
4. "複数のデバイスで利用する"は、"必要ありません"を選択する。
5. 起動ボタンを押して起動する。
### Ubuntuの設定
1. `username`と`password`を設定する。
2. `$ lsb_release -a`で(念の為)Ubuntuのバージョンを確認する。
3. パッケージリストの更新
    1. デフォルトのリポジトリをアメリカから日本に変更する。
        ```
        $cd /etc/apt
        $sudo sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://jp.archive.ubuntu.com/ubuntu/%g" sources.list
        ```
    2. 最新情報の取得`$ sudo apt update`
    3. パッケージの更新`$ sudo apt upgrade`
4. 日本語化設定
    1. 日本語化パッケージインストール`$ sudo apt install language-pack-ja`
    2. 日本語設定を変更する`$ sudo update-locale LANG=ja_JP.UTF-8`
    3. 言語設定反映のために一回ログアウト`$ exit`
    4. winのスタートメニューから、Ubuntuを起動する。
    5. `$ date`で日本語化されていて、日本のタイムゾーンになっていることを確認する。
5. エクスプローラーでフォルダを開く
    1. Ubuntu側で次を実行すると、winのエクスプローラーでUbuntuのフォルダが開く`$ explorer.exe  .`
    2. 適当なフォルダで右クリックし、"クイックアクセスにピン留めする"を選択する。
6. rootでのログインとパスワード設定
    1. rootにログイン`$ sudo su -`
    2. rootのパスワードを変更する`$ passwd`
7. Ubuntuのログイン・ログアウト
    - ログアウト`exit`
8. デスクトップ環境設定
    1. VcXsrvのインストール
        - 特に設定することなくインストール
    2. VcXsrvの初期設定
        - ファイアウォール系の画面が出たらキャンセル
    3. UbuntuでのGUI設定
        `$ sudo apt install x11-apps x11-utils x11-xserver-utils dbus-x11`
        ```
        cd
        echo 'export DISPLAY=localhost:0.0' >> ~/.bash_profile
        source ~/.bash_profile
        ```
        `xeyes`で目のようなウィンドウがでたら成功
    4. デスクトップ環境構築
        - GUI用の日本語フォントをインストール
        `$ sudo apt install fonts-ipafont`
        - デスクトップをインストール(xfce)
        ```
        $ sudo apt install xfce4-terminal
        $ sudo apt install xfce4-session
        $ sudo apt install xfce4
        $ export DISPLAY=:0.0
        $ export LIBGL_ALWAYS_INDIRECT=1
        ```
        - デスクトップを起動してみる
        `$ startxfce4`