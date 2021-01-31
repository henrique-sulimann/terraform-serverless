#locals {
#  rs_name = "${aws_cognito_resource_server.this.name}"
#
#  rs_scope_list = "${aws_cognito_resource_server.this.scope}"
#
#  rs_scopes = [
#    "${local.rs_name}/${lookup(local.rs_scope_list, "scope_name")}"
#  ]
#}

resource "aws_cognito_user_pool" "this" {
  name = "${var.cg_pool}"
}

resource "aws_cognito_user_pool_client" "this" {
  name = "${var.cg_client}"
  user_pool_id = "${aws_cognito_user_pool.this.id}"
  generate_secret = true
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows = [ "client_credentials" ]
  allowed_oauth_scopes = "${aws_cognito_resource_server.this.scope_identifiers}" 
  #allowed_oauth_scopes = "${local.rs_scopes}" 

}

resource "aws_cognito_user_pool_domain" "this" {
  domain = "${var.cg_domain}-${random_id.bucket.dec}"
  user_pool_id = "${aws_cognito_user_pool.this.id}"

}

resource "aws_cognito_resource_server" "this" {
  identifier = "${var.cg_client}"
  name = "${var.cg_client}"

  scope {
    scope_name = "read_todos"
    scope_description = "Read todos"
  }
  scope {
    scope_name = "create_todos"
    scope_description = "Create todos"
  }
  scope {
    scope_name = "delete_todos"
    scope_description = "Delete Todos"
  }

  user_pool_id = "${aws_cognito_user_pool.this.id}"
}
