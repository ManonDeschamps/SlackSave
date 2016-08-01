class Message
  include Mongoid::Document
  field :published_at, type: DateTime
  field :author, type: String
  field :message, type: String
end
