# Virtual Cloud Network

resource oci_core_vcn demo2 {
  #byoipv6cidr_details = <<Optional>>
  #cidr_block = <<Optional>>
  cidr_blocks = [
    "10.1.0.0/16",
  ]
  compartment_id = var.compartment_ocid
  defined_tags = {}
  display_name = "demo_vcn2"
  dns_label    = "demovcn2"
  freeform_tags = {
    "VCN" = "VCN-2022-06-28T21:19:33"
  }
  ipv6private_cidr_blocks = [
  ]
  #is_ipv6enabled = <<Optional>>
}

## IGW

resource oci_core_internet_gateway export_Internet-Gateway-demo_vcn {
  compartment_id = var.compartment_ocid
  defined_tags = {}
  display_name = "Internet Gateway-demo_vcn"
  enabled      = "true"
  vcn_id = oci_core_vcn.demo2.id
}

resource oci_core_public_ip export_Floating-IP-for-VIP-public-vip-on-LB-ocid1-loadbalancer-oc1-eu-frankfurt-1-aaaaaaaasthvso3ipxbib23lcq3if74xc3luo3wlxalzgpsfspr4kzf45lfq {
  compartment_id = var.compartment_ocid
  defined_tags = {
  }
  display_name = "Floating IP for VIP public-vip on LB ocid1.loadbalancer.oc1.eu-frankfurt-1.aaaaaaaasthvso3ipxbib23lcq3if74xc3luo3wlxalzgpsfspr4kzf45lfq"
  freeform_tags = {
  }
  lifetime      = "RESERVED"
  #public_ip_pool_id = <<Optionaly>>
}

## Private Subnet

resource oci_core_subnet Private-Subnet-demo_vcn {
  #availability_domain = <<Optional>>
  cidr_block     = "10.1.1.0/24"
  compartment_id = var.compartment_ocid
  defined_tags = {}
  dhcp_options_id = oci_core_vcn.demo2.default_dhcp_options_id
  display_name    = "Private Subnet-demo_vcn"
  dns_label       = "sub06282119581"
  freeform_tags = {
    "VCN" = "VCN-2022-06-28T21:19:33"
  }
  #ipv6cidr_block = <<Optional>>
  ipv6cidr_blocks = [
  ]
  prohibit_internet_ingress  = "true"
  prohibit_public_ip_on_vnic = "true"
  route_table_id             = oci_core_route_table.Route-Table-for-Private-Subnet-demo_vcn.id
  security_list_ids = [
    oci_core_security_list.export_SL_Private.id,
  ]
  vcn_id = oci_core_vcn.demo2.id
}

## Public Subnet

resource oci_core_subnet Public-Subnet-demo_vcn {
  #availability_domain = <<Optionaly>>
  cidr_block     = "10.1.0.0/24"
  compartment_id = var.compartment_ocid
  defined_tags = {}
  dhcp_options_id = oci_core_vcn.demo2.default_dhcp_options_id
  display_name    = "Public Subnet-demo_vcn"
  dns_label       = "sub06282119580"
  freeform_tags = {
    "VCN" = "VCN-2022-06-28T21:19:33"
  }
  #ipv6cidr_block = <<Optional>>
  ipv6cidr_blocks = [
  ]
  prohibit_internet_ingress  = "false"
  prohibit_public_ip_on_vnic = "false"
  route_table_id             = oci_core_vcn.demo2.default_route_table_id
  security_list_ids = [
    oci_core_security_list.export_SL_Public.id,
  ]
  vcn_id = oci_core_vcn.demo2.id
}



resource oci_core_default_dhcp_options export_Default-DHCP-Options-for-demo_vcn {
  compartment_id = var.compartment_ocid
  defined_tags = {}
  display_name     = "Default DHCP Options for demo_vcn"
  domain_name_type = "CUSTOM_DOMAIN"
  freeform_tags = {
    "VCN" = "VCN-2022-06-28T21:19:33"
  }
  manage_default_resource_id = oci_core_vcn.demo2.default_dhcp_options_id
  options {
    custom_dns_servers = [
    ]
    #search_domain_names = <<Optional>>
    server_type = "VcnLocalPlusInternet"
    type        = "DomainNameServer"
  }
  options {
    #custom_dns_servers = <<Optional>>
    search_domain_names = [
      "demovcn.oraclevcn.com",
    ]
    #server_type = <<Optional>>
    type = "SearchDomain"
  }
}

#NAT Gateway

resource oci_core_nat_gateway NAT-Gateway-demo_vcn {
  block_traffic  = "false"
  compartment_id = var.compartment_ocid
  defined_tags = {}
  display_name = "NAT Gateway-demo_vcn"
  freeform_tags = {
    "VCN" = "VCN-2022-06-28T21:19:33"
  }
  vcn_id       = oci_core_vcn.demo2.id
}

#Route Tables 

resource oci_core_route_table Route-Table-for-Public-Subnet-demo_vcn {
  compartment_id = var.compartment_ocid
  defined_tags = {}
  display_name = "Route Table for Public Subnet-demo_vcn"
  freeform_tags = {
  }
  route_rules {
    description       = "route table for public subnet"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.export_Internet-Gateway-demo_vcn.id
  }
  vcn_id = oci_core_vcn.demo2.id
}

resource oci_core_route_table Route-Table-for-Private-Subnet-demo_vcn {
  compartment_id = var.compartment_ocid
  defined_tags = {}
  display_name = "Route Table for Private Subnet-demo_vcn"
  freeform_tags = {
    "VCN" = "VCN-2022-06-28T21:19:33"
  }
  route_rules {
    #description = <<Optional>>
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.NAT-Gateway-demo_vcn.id
  }

  vcn_id = oci_core_vcn.demo2.id
}

resource oci_core_default_route_table Default-Route-Table-for-demo_vcn {
  compartment_id = var.compartment_ocid
  defined_tags = {}
  display_name = "Default Route Table for demo_vcn"
  freeform_tags = {
    "VCN" = "VCN-2022-06-28T21:19:33"
  }
  manage_default_resource_id = oci_core_vcn.demo2.default_route_table_id
  route_rules {
    #description = <<Optional>>
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.export_Internet-Gateway-demo_vcn.id
  }
}

