variable "vm-dev" {
    type        = string
    description = "Nom de la VM"
    default     = "vm-dev"
}

variable "type" {
    type        = string
    description = "Type de la VM"
    default     = "e2-small"
}

variable "zone" {
    type        = string
    description = "Zone de la VM"
    default     = "europe-west9-c"
}

variable "network_self_link" {
    type        = string
    description = "Lien vers le réseau"
}

variable "subnet_self_link" {
    type        = string
    description = "Lien vers le sous-réseau"
}

variable "service_account_email" {
    description = "Email du compte de service"
}