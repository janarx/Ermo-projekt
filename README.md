# Ermo-projekt

Automatiseeritud Flask rakenduse deploy Proxmox virtuaalmasinate peal, kasutades Terraformi, Ansiblet ja Dockerit.

## Arhitektuur
┌─────────────────────────────────────────────────────┐
│                    Proxmox VE                       │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐ │
│  │   web-01    │  │   db-01     │  │ monitor-01  │ │
│  │192.168.10.161│ │192.168.10.162│  │192.168.10.163│
│  │             │  │             │  │             │ │
│  │  Docker     │  │ PostgreSQL  │  │  htop       │ │
│  │  Flask App  │  │ studentapp  │  │  net-tools  │ │
│  │  Gunicorn   │  │             │  │  iotop      │ │
│  │  Port 5000  │  │  Port 5432  │  │             │ │
│  └─────────────┘  └─────────────┘  └─────────────┘ │
└─────────────────────────────────────────────────────┘

## Eeldused

- Proxmox VE server
- Ubuntu 24.04 cloud-init template (VMID 9000)
- WSL2 Ubuntu
- Terraform >= 1.3.0
- Ansible >= 2.19

## Paigaldusjuhend

### 1. Klooni repo

```bash
git clone https://github.com/janarx/Ermo-projekt
cd Ermo-projekt
```

### 2. Terraform — VM-ide loomine

```bash
cd terraform

# Muuda vars.tf väärtused:
# - pm_api_token_id
# - pm_api_token_secret
# - ssh_public_key
# - proxmox_ssh_public_key

terraform init
terraform plan
terraform apply
```

### 3. Ansible — süsteemide seadistamine

```bash
cd ../ansible

# Kopeeri ansible_key Proxmox serverile
ssh-keygen -t rsa -b 4096 -f /root/.ssh/ansible_key -N ""

# Lisa ansible_key VM-idesse (Proxmox konsooli kaudu)
echo "ANSIBLE_KEY_PUB" >> ~/.ssh/authorized_keys

# Käivita playbook
ansible-playbook -i inventory deploy.yml
```

### 4. Kontrolli

```bash
# Testi ühendust
ansible all -i inventory -m ping

# Ava brauser
http://192.168.10.161:5000
```

## VM-ide kirjeldus

| VM | IP | Eesmärk |
|---|---|---|
| web-01 | 192.168.10.161 | Flask rakendus + Docker |
| db-01 | 192.168.10.162 | PostgreSQL andmebaas |
| monitor-01 | 192.168.10.163 | Monitooringu tööriistad |

## Flask rakendus

- Homepage sõnumite kuvamiseks
- Vorm sõnumite saatmiseks
- Sõnumid salvestatakse PostgreSQL-i
- Töötab Docker konteineris

## Kausta struktuur
.
├── terraform/
│   ├── main.tf
│   ├── vars.tf
│   └── versions.tf
├── ansible/
│   ├── deploy.yml
│   ├── inventory
│   ├── vars/variables.yml
│   ├── templates/
│   │   ├── hostname.j2
│   │   └── netplan.yml.j2
│   └── roles/
│       ├── update/
│       ├── hostname/
│       ├── netplan/
│       ├── docker/
│       ├── flask/
│       ├── postgresql/
│       └── monitoring/
└── task/
├── app.py
├── Dockerfile
├── docker-compose.yml
├── requirements.txt
└── templates/
└── index.html
