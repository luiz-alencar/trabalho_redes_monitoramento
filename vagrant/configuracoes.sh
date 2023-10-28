sudo su 
sudo apt-get update
sudo apt install ansible -y

apt install net-tools

ansible-playbook -i hosts ansible.yml

cd /vagrant

sudo docker-compose up -d

#--------OK---------------------------------------------------------------------------

  # Atualize a lista de pacotes
  sudo apt-get update

  # Instale o auditd
  sudo apt-get install -y auditd

  # Habilite o serviço auditd
  sudo systemctl enable auditd
  sudo systemctl start auditd

  # Configure uma regra de auditoria para registrar eventos de acesso a arquivos
  sudo auditctl -a always,exit -F arch=b64 -S open -k file-access

  # Reinicie o serviço auditd para aplicar as configurações
  sudo systemctl restart auditd

  sudo systemctl is-active auditd

  sudo systemctl status auditd
  
  #------OK--------------------------------------------------------------------------------

  sudo apt-get install -y ufw

  # Ative o UFW 
  sudo ufw --force enable

  sudo ufw allow 22  # SS
  sudo ufw allow 80  # HTTP
  sudo ufw allow 443 # HTTPS

  sudo ufw --force enable

  #-----OK----------------------------------------------------------------------------------

  # Desinstala aplicativos denecessários
  apt-get remove -y nmap
  apt-get remove -y mysql
  
  #---------------------------------------------------------------------------------------

  # Bloquear solicitações de ping (ICMP)
  iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

  #-------OK--------------------------------------------------------------------------------

  # Limpa todas as regras existentes
  sudo iptables -F

  # Define uma política padrão para DROP (bloquear)
  sudo iptables -P INPUT DROP
  sudo iptables -P FORWARD DROP
  sudo iptables -P OUTPUT ACCEPT

  # Permite o tráfego na porta 80 (HTTP)
  sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT

  # Permite o tráfego na porta 443 (HTTPS)
  sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT

  # Permite o tráfego na porta 22 (SSH)
  sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT

  # Salva as regras para persistência
  sudo iptables-save > /etc/iptables/rules.v4

  #------------------------------------------------------------------------------------------

  # Nome do arquivo a ser criado e criptografado
  file_to_encrypt="crip.txt"

  # Conteúdo do arquivo
  file_content="Este é um arquivo secreto que será criptografado."

  # Crie o arquivo
  echo "$file_content" > "$file_to_encrypt"

  # Criptografe o arquivo usando OpenSSL
  openssl enc -aes-256-cbc -salt -in "$file_to_encrypt" -out "${file_to_encrypt}.enc"

  # Descriptografe o arquivo usando OpenSSL
  openssl enc -d -aes-256-cbc -in "${file_to_encrypt}.enc" -out "${file_to_encrypt}.decrypted"

  # Verifique o conteúdo do arquivo descriptografado
  cat "${file_to_encrypt}.decrypted"

  #---OK----------------------------------------------------------------------------------------

  # Crie um grupo de administradores
  sudo groupadd admin

  # Crie usuários e adicione-os ao grupo de administradores
  sudo useradd -m -s /bin/bash usuario1
  sudo useradd -m -s /bin/bash usuario2

  # Atribua os usuários ao grupo de administradores
  sudo usermod -a -G admin usuario1
  sudo usermod -a -G admin usuario2

  #-------------------------------------------------------------------------------------------

  # Instale o rkhunter
  sudo apt-get install -y rkhunter

  # Atualize as assinaturas do rkhunter
  sudo rkhunter --update

  # Execute a verificação inicial
  sudo rkhunter --checkall --skip-keypress

  # Exiba o relatório de verificação
  sudo cat /var/log/rkhunter.log
