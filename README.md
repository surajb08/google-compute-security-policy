# google-compute-security-policy
This Transform module is used for creating Security Policy in Google Cloud Armor.

## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Resources

| Name |
|------|
| [google_compute_security_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_security_policy) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name of the WAF policy. | `any` | n/a | yes |
| project\_id | Project ID of the project in which WAF policy needs to be created. | `any` | n/a | yes |
| env | Name of the Environment | `string` | `""` | no |
| prefix | Prefix of name of resource. | `string` | `""` | no |
| rules | List of Map of rules to be created in the Policy. | <pre>list(object(<br>    {<br>      action : string   #"allow" #"deny(status)" #Valid HTTP response code 403,404,502<br>      priority : string #"12345"#Unique +ve int, lowest int(highest priority)<br>      match : {<br>        type = object({<br>          versioned_expr : {<br>            type    = string<br>            default = null<br>          }<br>          config : {<br>            type = object({<br>              src_ip_ranges : { type : list }<br>            })<br>            default : {}<br>          }<br>          expr : {<br>            type : object({<br>              expression : { type : string, default : "" }<br>            })<br>            default : {}<br>          }<br>        })<br>      }<br>      description : { type = string, default = null }<br>    }<br>  ))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | This is id of the Compute Security Policy. |
| name | This is name of the Compute Security Policy. |
| self\_link | This is self\_link of the Compute Security Policy. |

## Example

You can run the example in example folder after specifying `project_id` in `variables.tf`.