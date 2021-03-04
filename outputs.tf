output "name" {
  description = "This is name of the Compute Security Policy."
  value       = google_compute_security_policy.policy.name
}

output "id" {
  description = "This is id of the Compute Security Policy."
  value       = google_compute_security_policy.policy.id
}

output "self_link" {
  description = "This is self_link of the Compute Security Policy."
  value       = google_compute_security_policy.policy.self_link
}
