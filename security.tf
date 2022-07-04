#Security Lists

resource oci_core_security_list export_SL_Private {
  compartment_id = var.compartment_ocid
  defined_tags = {}
  display_name = "SL_Private"
  egress_security_rules {
    #description = <<Optional>>
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional>>
    protocol  = "all"
    stateless = "false"
    #tcp_options = <<Optional>>
    #udp_options = <<Optional>>
  }
  freeform_tags = {
  }
  ingress_security_rules {
    #description = <<Optional>>
    #icmp_options = <<Optional>>
    protocol    = "6"
    source      = "10.1.0.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "80"
      min = "80"
      #source_port_range = <<Optional>>
    }
    #udp_options = <<Optional>>
  }
  vcn_id = oci_core_vcn.demo2.id
}

resource oci_core_security_list export_SL_Public {
  compartment_id = var.compartment_ocid
  defined_tags = {}
  display_name = "SL_Public"
  egress_security_rules {
    #description = <<Optional>>
    destination      = "10.1.1.0/24"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional>>
    protocol  = "6"
    stateless = "false"
    tcp_options {
      max = "80"
      min = "80"
      #source_port_range = <<Optional>>
    }
    #udp_options = <<Optional>>
  }
  freeform_tags = {
  }
  ingress_security_rules {
    #description = <<Optional>>
    #icmp_options = <<Optional>>
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "80"
      min = "80"
      #source_port_range = <<Optional>>
    }
    #udp_options = <<Optional>>
  }
  vcn_id = oci_core_vcn.demo2.id
}

resource oci_core_security_list export_Security-List-for-Private-Subnet-demo_vcn {
  compartment_id = var.compartment_ocid
  defined_tags = {}
  display_name = "Security List for Private Subnet-demo_vcn"
  egress_security_rules {
    #description = <<Optional>>
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional>>
    protocol  = "all"
    stateless = "false"
    #tcp_options = <<Optional>>
    #udp_options = <<Optional>>
  }
  freeform_tags = {
    "VCN" = "VCN-2022-06-28T21:19:33"
  }
  ingress_security_rules {
    #description = <<Optional>>
    #icmp_options = <<Optional>>
    protocol    = "6"
    source      = "10.1.0.0/16"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "22"
      min = "22"
      #source_port_range = <<Optional>>
    }
    #udp_options = <<Optional>>
  }
  ingress_security_rules {
    #description = <<Optional>>
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol    = "1"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional>>
    #udp_options = <<Optional>>
  }
  ingress_security_rules {
    #description = <<Optional>>
    icmp_options {
      code = "-1"
      type = "3"
    }
    protocol    = "1"
    source      = "10.1.0.0/16"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional>>
    #udp_options = <<Optional>>
  }
  vcn_id = oci_core_vcn.demo2.id
}

resource oci_core_default_security_list export_Default-Security-List-for-demo_vcn {
  compartment_id = var.compartment_ocid
  defined_tags = {}
  display_name = "Default Security List for demo_vcn"
  egress_security_rules {
    #description = <<Optional>>
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional>>
    protocol  = "all"
    stateless = "false"
    #tcp_options = <<Optional>>
    #udp_options = <<Optional>>
  }
  freeform_tags = {
    "VCN" = "VCN-2022-06-28T21:19:33"
  }
  ingress_security_rules {
    #description = <<Optional>>
    #icmp_options = <<Optional>>
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "22"
      min = "22"
      #source_port_range = <<Optional>>
    }
    #udp_options = <<Optional>>
  }
  ingress_security_rules {
    #description = <<Optional>>
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol    = "1"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
  }
  ingress_security_rules {
    #description = <<Optional>>
    icmp_options {
      code = "-1"
      type = "3"
    }
    protocol    = "1"
    source      = "10.1.0.0/16"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
  }
  manage_default_resource_id = oci_core_vcn.demo2.default_security_list_id
}

