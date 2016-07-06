class UserSerializer < ActiveModel::Serializer

  cached

  embed :ids
  attributes :id, :username, :email, :created_at, :updated_at, :auth_token

  has_many :hotels

  def cache_key
    [object, scope]
  end
end