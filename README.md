# vps-ipv6-only
```shell
sudo apt update && sudo apt upgrade -y && sudo reboot
```

```shell
sudo wget --no-check-certificate https://raw.githubusercontent.com/bibicadotnet/vps-ipv6-only/main/setup.sh -O ipv6.sh && sudo chmod +x ipv6.sh && sudo ./ipv6.sh
```
Cài đặt xong chờ 5-10s chạy tiếp
```shell
curl -4 google.com
```
Thấy hiện ra bình thường là đã hỗ trợ ipv4
