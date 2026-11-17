# MANASIK Admin Panel — specification

## Navigation
- Overview: active users, language usage, published content, support queue
- Users: search, suspend/reactivate, export only with authorization
- Content CMS: guides, duas, translations, source references, scholar review status
- Groups: abuse reports and membership support; do not expose live location by default
- Emergency directory: country/region/service, source URL, verified date, active status
- Travel partners: provider approval, package listing, booking status
- AI quality: flagged answers, citations, unresolved questions, safety review
- Support: tickets, response templates, escalation
- Settings: roles, audit logs, retention and localization

## Roles
- super_admin: all admin functions
- content_editor: draft and edit content
- scholar_reviewer: approve religious content
- support_agent: support tickets, limited user data
- travel_partner: only own listings and bookings

All privileged operations must be enforced server-side. Every content approval and sensitive action must create an audit log.
