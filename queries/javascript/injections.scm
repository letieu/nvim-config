; javascript
(
 (template_string (string_fragment) @injection.content)
 (#match? @injection.content "^.*FROM|ALTER|SELECT|CREATE|UPDATE|DELETE|INSERT|WITH.*$")
 (#set! injection.language "sql")
 )
