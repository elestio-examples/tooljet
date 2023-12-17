set env vars
set -o allexport; source .env; set +o allexport;

cat <<EOT > ./servers.json
{
    "Servers": {
        "1": {
            "Name": "local",
            "Group": "Servers",
            "Host": "172.17.0.1",
            "Port": 39393,
            "MaintenanceDB": "postgres",
            "SSLMode": "prefer",
            "Username": "postgres",
            "PassFile": "/pgpass"
        }
    }
}
EOT

PGRST_JWT_SECRET=${PGRST_JWT_SECRET:-`openssl rand -hex 32`}

cat << EOT >> ./.env

PGRST_JWT_SECRET=${PGRST_JWT_SECRET}
EOT
