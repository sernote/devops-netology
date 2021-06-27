Устанавливаем и запускаем Vault. \
Прописываем переменные:
````
export VAULT_ADDR=http://127.0.0.1:8200
export VAULT_TOKEN=s.xAjOHpOc6S9XkXUXnNTSmGpO
````
генерируем Root CA
````
vault secrets enable pki
vault secrets tune -max-lease-ttl=87600h pki
vault write -field=certificate pki/root/generate/internal \
        common_name="example.com" \
        ttl=87600h > CA_cert.crt
vault write pki/config/urls \
        issuing_certificates="$VAULT_ADDR/v1/pki/ca" \
        crl_distribution_points="$VAULT_ADDR/v1/pki/crl"
````
генерируем Intermediate CA
````
vault secrets enable -path=pki_int pki
vault secrets tune -max-lease-ttl=43800h pki_int
vault write -format=json pki_int/intermediate/generate/internal \
        common_name="example.com Intermediate Authority" \
        | jq -r '.data.csr' > pki_intermediate.csr
vault write -format=json pki/root/sign-intermediate csr=@pki_intermediate.csr \
        format=pem_bundle ttl="43800h" \
        | jq -r '.data.certificate' > intermediate.cert.pem
vault write pki_int/intermediate/set-signed certificate=@intermediate.cert.pem


````
создаем роль

````
vault write pki_int/roles/example-dot-com \
        allowed_domains="example.com" \
        allow_subdomains=true \
        max_ttl="720h"
````

подписываем Intermediate CA csr на сертификат для тестового домена
````
vault write pki_int/issue/example-dot-com common_name="netology.example.com" ttl="24h"
````
стаивм nginx
и 
модифицируем vhost по-умолчанию
````
listen 443 ssl default_server;
listen [::]:443 ssl default_server;
ssl_certificate /home/vagrant/example.com.crt;
ssl_certificate_key /home/vagrant/example.com.key;
````
перезагружаем конфигурацию предварительно проверив правильность
````
sudo nginx -t
sudo systemctl reload nginx
sudo systemctl status nginx
````
добавляем в hosts
```` 
sudo echo 127.0.0.1 netology.example.com >> /etc/hosts
````
кладем файл с сертификатом в local/share/ca-certificates/ чтобы сделать его доверенным и обновляем
````
ln intermediate.cert.pem /usr/local/share/ca-certificates/demo_ca.crt
update-ca-certificates
````
