# frozen_string_literal: true

class AuthorDecorator < Drape::Decorator
  delegate_all

  def full_name
    "#{object.name} #{object.surname}"
  end
end
