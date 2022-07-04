## Autoscaling Configuration

resource oci_autoscaling_auto_scaling_configuration autoscaling-webapp {
  auto_scaling_resources {
    id   = oci_core_instance_pool.export_web.id
    type = "instancePool"
  }
  compartment_id       = var.compartment_ocid
  cool_down_in_seconds = "300"
  defined_tags = {}
  display_name = "autoscaling-webapp"
  freeform_tags = {
  }
  is_enabled = "true"
  policies {
    capacity {
      initial = "2"
      max     = "4"
      min     = "2"
    }
    display_name = "autoscaling-policy-cpu"
    is_enabled  = "true"
    policy_type = "threshold"
    rules {
      action {
        type  = "CHANGE_COUNT_BY"
        value = "-1"
      }
      display_name = "conditiondetails20220701175014"
      metric {
        metric_type = "CPU_UTILIZATION"
        threshold {
          operator = "LT"
          value    = "20"
        }
      }
    }
    rules {
      action {
        type  = "CHANGE_COUNT_BY"
        value = "1"
      }
      display_name = "conditiondetails20220701175014"
      metric {
        metric_type = "CPU_UTILIZATION"
        threshold {
          operator = "GT"
          value    = "70"
        }
      }
    }
  }
}

