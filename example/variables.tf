variable "project_id" {
  type = string
}
variable "rules" {
  default = [
    {
      "description" : "deny traffic from specific regions"
      "action" : "deny(403)"
      "priority" : "1000"
      "match" : {
        "expr" : {
          "expression" : "origin.region_code == \"CN\""
        }
      }
    },
    {
      "description" : "allow all traffic"
      "action" : "allow"
      "priority" : "1001"
      "match" : {
        #"versioned_expr" : "SRC_IPS_V1"
        "config" : {
          "src_ip_ranges" : ["*"]
        }
      }
    },
  ]
}
