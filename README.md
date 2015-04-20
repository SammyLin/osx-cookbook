# 製圖機安裝

這可以幫助你建置一個 Ruby 跟 Chef 的環境

* RVM
* Chef
* Homebrew
* postgresql
* fontconfig
* git
* imagemagick
* build-essential

## 步驟

### 1.確認使用者為 commandp 及確定是否為`管理者`

如果不是的話先加入使用者 帳號密碼設定為 `commandp` / `commandp`


### 2.下載 osx-cookbook 資料夾

請到 XXXX 下載

### 3.把 KEY 放到 roles/macmini.json

    # cat ~/.ssh/id_rsa.pub 查詢自已的 KEY 貼到裡面
    "ssh_keys": [ "ssh-rsa AAAAxx" ]

### 4.安裝 Installing Command Line Tools

    $ xcode-select --install

### 5.安裝 Chef

    $ sudo ./bootstrap.sh

### 6.執行 Chef

    $ sudo ./deploy.sh

### 7.上 VPS Server 開帳號，並下載 key 檔

[https://54.65.34.51:9700](https://54.65.34.51:9700)

![](doc/001.png)

(目前命名規則為 dc-mini1, dc-mini2, ...)


### 8. 匯入 VPN Key 檔 (.ovpn)

![](doc/002.png)

解壓縮後直接點擊兩下匯入安裝，設定「所有用戶」

![](doc/003.png)

### 9. 設定保持連結，並連線

![](doc/004.png)

### 10. 下載 illustrator

# fix


### 11. 本機操作

把 server ip 加入 config/deploy/staging.rb, 跑 cap staging deploy:check, 會幫你建立目錄並跟你說少什麼檔案

從別台 server 複製設定檔, 例如:

    $ scp 'commandp@192.168.0.156:~/deploy/staging/shared/config/*.yml' .
    $ scp *.yml commandp@192.168.0.141:~/deploy/staging/shared/config/

跑 `cap staging deploy:check`, 確定沒少檔案

    $ ssh bitbucket.org

    $ cap staging deploy <- 要跑很久, 可以先去打個桌球



## cookbook 更動備註

### 如果 berksfile 有更改的話

    $ berks vendor vendor/cookbooks

### 執行 chef-solo

    $ chef-solo -c solo.rb -j rolos/macmini.json

