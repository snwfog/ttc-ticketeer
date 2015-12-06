require 'active_record'
require 'active_model'
require 'virtus'

class User < ActiveRecord::Base
  include Virtus.model
  include ActiveModel::Validations

  attribute :user_app_id, String
end