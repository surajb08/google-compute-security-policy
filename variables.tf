
variable "env" {
  description = "Name of the Environment"
  default     = ""
}

variable "name" {
  description = "Name of the WAF policy."
}

variable "prefix" {
  description = "Prefix of name of resource."
  default     = ""
}

variable "project_id" {
  description = "Project ID of the project in which WAF policy needs to be created."
}

variable "rules" {
  description = "List of Map of rules to be created in the Policy."
  type = list(object(
    {
      action : string   #"allow" #"deny(status)" #Valid HTTP response code 403,404,502
      priority : string #"12345"#Unique +ve int, lowest int(highest priority)
      match : {
        type = object({
          versioned_expr : {
            type    = string
            default = null
          }
          config : {
            type = object({
              src_ip_ranges : { type : list }
            })
            default : {}
          }
          expr : {
            type : object({
              expression : { type : string, default : "" }
            })
            default : {}
          }
        })
      }
      description : { type = string, default = null }
    }
  ))
  default = []
}
