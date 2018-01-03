# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!


# amazon-ecs environments
Amazon::Ecs.options = {
      associate_tag:     'kazubooks0a-22',
      AWS_access_key_id: 'AKIAILQ4752J27SIQA3Q',
      AWS_secret_key:   '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'
}
