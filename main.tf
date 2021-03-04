resource "google_compute_security_policy" "policy" {
  name    = "${var.prefix}-${var.env}-${var.name}"
  project = var.project_id

  rule {
    action   = "deny(403)"
    priority = "2147483647"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
    description = "default rule"
  }

  dynamic "rule" {
    for_each = var.rules
    content {
      action   = rule.value.action
      priority = rule.value.priority
      match {
        versioned_expr = lookup(rule.value.match, "versioned_expr", can(rule.value.match.config) ? "SRC_IPS_V1" : null)
        dynamic "config" {
          for_each = lookup(rule.value.match, "config", {})
          content {
            src_ip_ranges = config.value
          }
        }
        dynamic "expr" {
          for_each = lookup(rule.value.match, "expr", {})
          content {
            expression = expr.value
          }
        }
      }
      description = lookup(rule.value, "description", null)
    }
  }
}
