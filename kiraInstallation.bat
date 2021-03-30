#kuracağımız node için aşağıdaki TCP portlarını açıyoruz

22 — Reserved for SSH, allows for remote communication with the host
80 — Allows for http access to KIRA Frontend
9090 — GRPC access to the public sentry
26656 — P2P port allowing public sentry to sync and propagate blocks
26657 — RPC port enabling blockchain state query
36656 — P2P port allowing private sentry to sync and propagate blocks
11000 — INTERX enabling easy blockchain state query & snapshot

//User açıyoruz
sudo adduser kira

//Usere yetki veriyoruz
sudo visudo
root    ALL=(ALL:ALL) ALL 
altına bu satırı ekle 
kira ALL=(ALL:ALL) ALL
CTRL+O enter CTRL+X

//Usere yetki veriyoruz
sudo usermod -a -G sudo kira

//Usere giriyoruz.
sudo su - kira

//Komutu çalıştırdıktan sonra gelen ekranda sırasıyla( testnet-1 , V yazıyoruz)
cd /tmp && read -p "Input branch name: " BRANCH && \
 wget https://raw.githubusercontent.com/KiraCore/kira/$BRANCH/workstation/init.sh -O ./i.sh && \
 chmod 555 -v ./i.sh && H=$(sha256sum ./i.sh | awk '{ print $1 }') && read -p "Is '$H' a [V]alid SHA256 ?: "$'\n' -n 1 V && \
 [ "${V,,}" == "v" ] && ./i.sh "$BRANCH" || echo "Hash was NOT accepted by the user"
 
 //kurulum sırasında gelen ekranlarda
 
 1. Validator Node seçeneğini seçiyoruz -->2
 2. Quick Setup seçeneğini seçiyoruz -->1
 3. Create [N]ew network or [J]oin existing one: olanda Join seçeneğini seçiyoruz--> J 
 3.1. Gelen ekranda 3.11.224.235, 3.11.25.53 IP'lerinden birini seçiyoruz
 4. Chose to [A]pprove or [R]eject configuration sayfasında Approve seçeneğini seçiyoruz --> A
 5. Yarım saat sonra kurulum tamamlanınca reboot ediyoruz
 
 //Açıldıktan sonra sudo  kullanıcıya giriş yapıyoruz
 su - kira 
 
//Public Key için dosyayı açıyoruz
sudo nano /home/kira/.secrets/menmonics.env

//VALIDATOR_NODE_ID yi alıp formda yerine yazıyoruz

Kurulum ve form gönderme işlemi tamamlanmış oluyor.
 
 
