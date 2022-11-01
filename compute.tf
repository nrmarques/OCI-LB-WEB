# Compute Configration

resource oci_core_instance_configuration web-demo-oracle {
  compartment_id = var.compartment_ocid
  defined_tags = {}
  display_name = "web-demo-oracle"
  freeform_tags = {
  }
  instance_details {
    instance_type = "compute"
    launch_details {
      agent_config {
        is_management_disabled = "false"
        is_monitoring_disabled = "false"
        plugins_config {
          desired_state = "DISABLED"
          name          = "Vulnerability Scanning"
        }
        plugins_config {
          desired_state = "DISABLED"
          name          = "Oracle Java Management Service"
        }
        plugins_config {
          desired_state = "ENABLED"
          name          = "OS Management Service Agent"
        }
        plugins_config {
          desired_state = "ENABLED"
          name          = "Compute Instance Run Command"
        }
        plugins_config {
          desired_state = "ENABLED"
          name          = "Compute Instance Monitoring"
        }
        plugins_config {
          desired_state = "DISABLED"
          name          = "Block Volume Management"
        }
        plugins_config {
          desired_state = "DISABLED"
          name          = "Bastion"
        }
      }
      availability_config {
        recovery_action = "RESTORE_INSTANCE"
      }
      availability_domain = data.oci_identity_availability_domain.export_rxfz-EU-FRANKFURT-1-AD-1.name
      compartment_id = var.compartment_ocid
      create_vnic_details {
        assign_private_dns_record = "true"
        assign_public_ip          = "false"
        freeform_tags = {
        }
        nsg_ids = [
        ]
        subnet_id = oci_core_subnet.Private-Subnet-demo_vcn.id
      }
      extended_metadata = {
      }
      freeform_tags = {
      }
      instance_options {
        are_legacy_imds_endpoints_disabled = "false"
      }
      is_pv_encryption_in_transit_enabled = "true"
      launch_mode                         = ""
      #launch_options = <Optional>
      metadata = {
        "ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCgJvbmSPnUFqn+87lmKkdvACL/nTDzdpmd1aeMRLWKW4vcubKYgN7PUvAWcVD3hJuVMOha5MuTI9du41SUdyChO5T9HmLXjutBkcczZlosoHY2P12Vt1WnhGpxJlZcoOnXsCRD+mAUy+5JHz78Z9O0pl8CYZkzZqHYTyj+0TCKGknqqTShJ7nbNazoqT1J82X133aP2p+fkgVkXfyBoAFd3pFSakvKidwA7G80dcULSPE2jfHKgEYnyYMvkefK1m54AyoBhNwOxyy/JBNPCvHKm9zguUE485kaJqvCXv05cYn3Soe6AlgEnymsnKqMWLhLov3TP2o2isSoHz1iGvDh ssh-key-2022-05-06"
        "user_data"           = "IyEgL2Jpbi9iYXNoCnN1ZG8gc2V0ZW5mb3JjZSAwCnN1ZG8geXVtIGNsZWFuIGFsbAojc3VkbyB5dW0gLXkgdXBkYXRlCnN1ZG8geXVtIC15IGluc3RhbGwgaHR0cGQKc3VkbyBzeXN0ZW1jdGwgc3RhcnQgaHR0cGQKc3VkbyBzeXN0ZW1jdGwgZW5hYmxlIGh0dHBkCnN1ZG8gZmlyZXdhbGwtY21kIC0tcGVybWFuZW50IC0tem9uZT1wdWJsaWMgLS1hZGQtc2VydmljZT1odHRwCnN1ZG8gZmlyZXdhbGwtY21kIC0tcGVybWFuZW50IC0tem9uZT1wdWJsaWMgLS1hZGQtc2VydmljZT1odHRwcwpzdWRvIGZpcmV3YWxsLWNtZCAtLXJlbG9hZApzdWRvIC1zIApjYXQgPDxFT0YgPiAvdmFyL3d3dy9odG1sL2luZGV4Lmh0bWwKPCFET0NUWVBFIGh0bWw+CjxodG1sIGxhbmc9InB0LWJyIj4KPGhlYWQ+CiAgICA8bWV0YSBjaGFyc2V0PSJVVEYtOCI+CiAgICA8bWV0YSBuYW1lPSJ2aWV3cG9ydCIgY29udGVudD0id2lkdGg9ZGV2aWNlLXdpZHRoLCBpbml0aWFsLXNjYWxlPTEuMCI+CiAgICA8dGl0bGU+T0NJIERFTU88L3RpdGxlPgo8L2hlYWQ+Cjxib2R5PgogICAgPGNlbnRlcj4gPGgxPk9DSSBDbG91ZCAkKGhvc3RuYW1lIC1mKTwvaDE+IAogICAgICAgICAgICA8aDI+SGVsbG8gZnJvbSBPQ0kgQ2xvdWQhISEhICYjeDI3MEM7IDwvaDI+CiAgICAgICAgICAgIDxocj4KICAgICAgICAgICAgPGltZyBzcmM9Imh0dHBzOi8vb2JqZWN0c3RvcmFnZS5ldS1mcmFua2Z1cnQtMS5vcmFjbGVjbG91ZC5jb20vbi9heHhyaDJyczNsbW0vYi93ZWJfYnVja2V0L28vb3JhY2xlX3dlYm9yYWNsZV93ZWIuanBnIiBhbHQ9InN1Y2VzcyI+CiAgICA8L2NlbnRlcj4gICAgCjwvYm9keT4KPC9odG1sPgpFT0Y="
      }
      #platform_config = <<Optional>>
      #preemptible_instance_config = <<Optional>>
      preferred_maintenance_action = ""
      shape                        = "VM.Standard.A1.Flex"
      shape_config {
        baseline_ocpu_utilization = ""
        memory_in_gbs             = "6"
        #nvmes = <<Optional>>
        ocpus = "1"
      }
      source_details {
        #boot_volume_id = <<Optional>>
        #boot_volume_size_in_gbs = <<Optional>>
        #boot_volume_vpus_per_gb = <<Optional>>
        image_id    = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaxp2zqotv37r4zycmwfqywcujsh4scenphjjs5w2ozakmidg3vs6q"
        source_type = "image"
      }
    }
  }
  #instance_id = <<Optional>>
  #source = <<Optional>>
}

resource oci_core_instance_pool export_web {
  compartment_id = var.compartment_ocid
  defined_tags = {}
  display_name = "web2"
  freeform_tags = {
  }
  instance_configuration_id = oci_core_instance_configuration.web-demo-oracle.id
  load_balancers {
    backend_set_name = oci_load_balancer_backend_set.backend_web_demo.name
    load_balancer_id = oci_load_balancer_load_balancer.web_lb2.id
    port             = "80"
    vnic_selection   = "PrimaryVnic"
  }
  placement_configurations {
    availability_domain = data.oci_identity_availability_domain.export_rxfz-EU-FRANKFURT-1-AD-1.name
    fault_domains = [
    ]
    primary_subnet_id = oci_core_subnet.Private-Subnet-demo_vcn.id
  }
  placement_configurations {
    availability_domain = data.oci_identity_availability_domain.export_rxfz-EU-FRANKFURT-1-AD-2.name
    fault_domains = [
    ]
    primary_subnet_id = oci_core_subnet.Private-Subnet-demo_vcn.id
  }
  size  = "1"
  state = "RUNNING"
}
